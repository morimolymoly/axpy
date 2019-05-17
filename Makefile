build:
	../../llvm-project/build/bin/clang++ axpy.cu -o axpy --cuda-gpu-arch=sm_35 -L/usr/local/cuda/lib64 -lcudart_static -ldl -lrt -pthread

ir:
	../../llvm-project/build/bin/clang++ -ccc-print-phases axpy.cu --cuda-gpu-arch=sm_35 -L/usr/local/cuda/lib64 -O0 -c -S -emit-llvm --cuda-compile-host-device

ir2:
	../../llvm-project/build/bin/clang++ -ccc-print-phases axpy.cu --cuda-gpu-arch=sm_35 -L/usr/local/cuda/lib64 -O0 -c -S -emit-llvm