#include <iostream>

__global__ void axpy() {
}

int main(int argc, char* argv[]) {
  // Launch the kernel.
  axpy<<<1, 10>>>();
  cudaDeviceReset();
  return 0;
}
