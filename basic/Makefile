build:
	../../llvm/llvm-project/build/bin/clang++ basic.cu -o basic --cuda-gpu-arch=sm_35 -L/usr/local/cuda/lib64 -lcudart_static -ldl -lrt -pthread

ir:
	../../llvm/llvm-project/build/bin/clang++ basic.cu --cuda-gpu-arch=sm_35 -L/usr/local/cuda/lib64 -O0 -c -S -emit-llvm 
