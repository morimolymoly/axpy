// GPU/CPU
__host__ __device__
static void vadd_calc(float a, float b, float *c)
{
	*c = a + b;
}

// GPU
__global__
static void vadd_gpu(int n, const float *a, const float *b, float *c)
{
	int tid = threadIdx.x + (blockIdx.x * blockDim.x);
	if (tid < n) {
		vadd_calc(a[tid], b[tid], &c[tid]);
	}
}

// CPU
static void vadd_cpu(int n, const float *a, const float *b, float *c)
{
	for (int i = 0; i < n; i++) {
		vadd_calc(a[i], b[i], &c[i]);
	}
}

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <time.h>
#include <cuda.h>

static void divide_array(const int, const int, int [], int []);

int main(int argc, char **argv)
{
	int    gpu = 1;
	int    um = 0;
	int    ngpu = 1;
	int    nvector = 1000;
	int    nloop = 1000;
	int    *offset, *length;
	size_t size;
#ifndef _OPENMP
	cudaStream_t *stream;
#endif

	// arguments
	while (--argc) {
		argv++;
		if      (!strcmp(*argv, "-gpu")) {
			gpu = 1;
		}
		else if (!strcmp(*argv, "-cpu")) {
			gpu = 0;
		}
		else if (!strcmp(*argv, "-hdm")) {
			um = 0;
		}
		else if (!strcmp(*argv, "-um")) {
			um = 1;
		}
		else if (argc == 3) {
			ngpu = atoi(*argv);
			if (ngpu < 1) ngpu = 1;
		}
		else if (argc == 2) {
			nvector = atoi(*argv);
			if (nvector < 1) nvector = 1;
		}
		else if (argc == 1) {
			nloop = atoi(*argv);
			if (nloop < 1) nloop = 1;
		}
	}

	// setup GPU
	if (gpu) {
		// check device
		int ndevice;
		cudaGetDeviceCount(&ndevice);
		if (ndevice < 1) {
			printf("No CUDA device.\n");
			exit(1);
		}

		// GPU info
		for (int igpu = 0; igpu < ngpu; igpu++) {
			cudaDeviceProp prop;
			cudaGetDeviceProperties(&prop, igpu);
			printf("GPU-%d : %s, C.C.%d.%d, U.M.%s\n", igpu, prop.name, prop.major, prop.minor, (um ? "ON" : "OFF"));
		}
	}

	// host memory
	size = nvector * sizeof(float);
	float *h_a = (float *)malloc(size);
	float *h_b = (float *)malloc(size);
	float *h_c = (float *)malloc(size);

	// offset and length
	size = ngpu * sizeof(int);
	offset = (int *)malloc(size);
	length = (int *)malloc(size);
	divide_array(nvector, ngpu, offset, length);

	// device memory
	size = ngpu * sizeof(float *);
	float **d_a = (float **)malloc(size);
	float **d_b = (float **)malloc(size);
	float **d_c = (float **)malloc(size);
	for (int igpu = 0; igpu < ngpu; igpu++) {
		if (gpu) cudaSetDevice(igpu);  // 重要
		size = length[igpu] * sizeof(float);
		cudaMalloc((void **)&d_a[igpu], size);
		cudaMalloc((void **)&d_b[igpu], size);
		cudaMalloc((void **)&d_c[igpu], size);
	}

	// setup problem
	for (int i = 0; i < nvector; i++) {
		h_a[i] = i;
		h_b[i] = i + 1;
		h_c[i] = 0;
	}

	// copy host to device
	for (int igpu = 0; igpu < ngpu; igpu++) {
		size = length[igpu] * sizeof(float);
		cudaMemcpy(d_a[igpu], h_a + offset[igpu], size, cudaMemcpyHostToDevice);
		cudaMemcpy(d_b[igpu], h_b + offset[igpu], size, cudaMemcpyHostToDevice);
	}

	// timer
	for (int igpu = 0; igpu < ngpu; igpu++) {
		cudaSetDevice(igpu);
		cudaDeviceSynchronize();
	}
	clock_t t0 = clock();

	// calculation
	for (int loop = 0; loop < nloop; loop++) {
		if (gpu) {
			// GPU
			// streams
			for (int igpu = 0; igpu < ngpu; igpu++) {
				cudaSetDevice(igpu);
				int block = 256;
				int grid = (length[igpu] + (block - 1)) / block;
				vadd_gpu<<<grid, block, 0, stream[igpu]>>>(length[igpu], d_a[igpu], d_b[igpu], d_c[igpu]);
			}

			// synchronize streams
			for (int igpu = 0; igpu < ngpu; igpu++) {
				cudaSetDevice(igpu);
				cudaStreamSynchronize(stream[igpu]);
			}
		}
		else {
			// CPU
			for (int igpu = 0; igpu < ngpu; igpu++) {
				vadd_cpu(length[igpu], h_a + offset[igpu], h_b + offset[igpu], h_c + offset[igpu]);
			}
		}
	}

	// timer
	for (int igpu = 0; igpu < ngpu; igpu++) {
		cudaSetDevice(igpu);
		cudaDeviceSynchronize();
	}
	clock_t t1 = clock();

	// copy device to host
	for (int igpu = 0; igpu < ngpu; igpu++) {
		cudaMemcpy(h_c + offset[igpu], d_c[igpu], size, cudaMemcpyDeviceToHost);
	}

	// sum
	double sum = 0;
	for (int i = 0; i < nvector; i++) {
		sum += h_c[i];
	}

	// output
	double exact = (double)nvector * nvector;
	double sec = (double)(t1 - t0) / CLOCKS_PER_SEC;
	printf("nvector=%d nloop=%d %e(%e) %s[sec]=%.3f\n",
		nvector, nloop, sum, exact, (gpu ? "GPU" : "CPU"), sec);

	// free
  /*
	for (int igpu = 0; igpu < ngpu; igpu++) {
		cudaFree(gpu, d_a[igpu]);
		cudaFree(gpu, d_b[igpu]);
		cudaFree(gpu, d_c[igpu]);
	}*/

	free(h_a);
	free(h_b);
	free(h_c);
	free(d_a);
	free(d_b);
	free(d_c);
	cudaDeviceReset();

	return 0;
}

static void divide_array(const int n, const int ndiv, int offset[], int length[])
{
	int l_n = (n + (ndiv - 1)) / ndiv;
	for (int i = 0; i < ndiv; i++) {
		offset[i] = i * l_n;
		int istop = (i + 1) * l_n;
		if (istop > n) istop = n;
		length[i] = istop - offset[i];
	}
}
