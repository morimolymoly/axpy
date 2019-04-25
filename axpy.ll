; ModuleID = 'axpy.cu'
source_filename = "axpy.cu"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"class.std::ios_base::Init" = type { i8 }
%"class.std::basic_ostream" = type { i32 (...)**, %"class.std::basic_ios" }
%"class.std::basic_ios" = type { %"class.std::ios_base", %"class.std::basic_ostream"*, i8, i8, %"class.std::basic_streambuf"*, %"class.std::ctype"*, %"class.std::num_put"*, %"class.std::num_get"* }
%"class.std::ios_base" = type { i32 (...)**, i64, i64, i32, i32, i32, %"struct.std::ios_base::_Callback_list"*, %"struct.std::ios_base::_Words", [8 x %"struct.std::ios_base::_Words"], i32, %"struct.std::ios_base::_Words"*, %"class.std::locale" }
%"struct.std::ios_base::_Callback_list" = type { %"struct.std::ios_base::_Callback_list"*, void (i32, %"class.std::ios_base"*, i32)*, i32, i32 }
%"struct.std::ios_base::_Words" = type { i8*, i64 }
%"class.std::locale" = type { %"class.std::locale::_Impl"* }
%"class.std::locale::_Impl" = type { i32, %"class.std::locale::facet"**, i64, %"class.std::locale::facet"**, i8** }
%"class.std::locale::facet" = type <{ i32 (...)**, i32, [4 x i8] }>
%"class.std::basic_streambuf" = type { i32 (...)**, i8*, i8*, i8*, i8*, i8*, i8*, %"class.std::locale" }
%"class.std::ctype" = type <{ %"class.std::locale::facet.base", [4 x i8], %struct.__locale_struct*, i8, [7 x i8], i32*, i32*, i16*, i8, [256 x i8], [256 x i8], i8, [6 x i8] }>
%"class.std::locale::facet.base" = type <{ i32 (...)**, i32 }>
%struct.__locale_struct = type { [13 x %struct.__locale_data*], i16*, i32*, i32*, [13 x i8*] }
%struct.__locale_data = type opaque
%"class.std::num_put" = type { %"class.std::locale::facet.base", [4 x i8] }
%"class.std::num_get" = type { %"class.std::locale::facet.base", [4 x i8] }
%struct.dim3 = type { i32, i32, i32 }
%struct.CUstream_st = type opaque

$_ZN4dim3C2Ejjj = comdat any

@_ZStL8__ioinit = internal global %"class.std::ios_base::Init" zeroinitializer, align 1
@__dso_handle = external hidden global i8
@__const.main.host_x = private unnamed_addr constant [4 x float] [float 1.000000e+00, float 2.000000e+00, float 3.000000e+00, float 4.000000e+00], align 16
@_ZSt4cout = external dso_local global %"class.std::basic_ostream", align 8
@.str = private unnamed_addr constant [3 x i8] c"y[\00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"] = \00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_axpy.cu, i8* null }]

; Function Attrs: noinline uwtable
define internal void @__cxx_global_var_init() #0 section ".text.startup" {
entry:
  call void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* @_ZStL8__ioinit)
  %0 = call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::ios_base::Init"*)* @_ZNSt8ios_base4InitD1Ev to void (i8*)*), i8* getelementptr inbounds (%"class.std::ios_base::Init", %"class.std::ios_base::Init"* @_ZStL8__ioinit, i32 0, i32 0), i8* @__dso_handle) #2
  ret void
}

declare dso_local void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"*) unnamed_addr #1

declare dso_local void @_ZNSt8ios_base4InitD1Ev(%"class.std::ios_base::Init"*) unnamed_addr #1

; Function Attrs: nounwind
declare dso_local i32 @__cxa_atexit(void (i8*)*, i8*, i8*) #2

; Function Attrs: noinline optnone uwtable
define dso_local void @_Z4axpyfPfS_(float %a, float* %x, float* %y) #3 {
entry:
  %a.addr = alloca float, align 4
  %x.addr = alloca float*, align 8
  %y.addr = alloca float*, align 8
  %grid_dim = alloca %struct.dim3, align 8
  %block_dim = alloca %struct.dim3, align 8
  %shmem_size = alloca i64, align 8
  %stream = alloca i8*, align 8
  %grid_dim.coerce = alloca { i64, i32 }, align 8
  %block_dim.coerce = alloca { i64, i32 }, align 8
  store float %a, float* %a.addr, align 4
  store float* %x, float** %x.addr, align 8
  store float* %y, float** %y.addr, align 8
  %kernel_args = alloca i8*, i64 3, align 16
  %0 = bitcast float* %a.addr to i8*
  %1 = getelementptr i8*, i8** %kernel_args, i32 0
  store i8* %0, i8** %1
  %2 = bitcast float** %x.addr to i8*
  %3 = getelementptr i8*, i8** %kernel_args, i32 1
  store i8* %2, i8** %3
  %4 = bitcast float** %y.addr to i8*
  %5 = getelementptr i8*, i8** %kernel_args, i32 2
  store i8* %4, i8** %5
  %6 = call i32 @__cudaPopCallConfiguration(%struct.dim3* %grid_dim, %struct.dim3* %block_dim, i64* %shmem_size, i8** %stream)
  %7 = load i64, i64* %shmem_size, align 8
  %8 = load i8*, i8** %stream, align 8
  %9 = bitcast { i64, i32 }* %grid_dim.coerce to i8*
  %10 = bitcast %struct.dim3* %grid_dim to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %9, i8* align 8 %10, i64 12, i1 false)
  %11 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %grid_dim.coerce, i32 0, i32 0
  %12 = load i64, i64* %11, align 8
  %13 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %grid_dim.coerce, i32 0, i32 1
  %14 = load i32, i32* %13, align 8
  %15 = bitcast { i64, i32 }* %block_dim.coerce to i8*
  %16 = bitcast %struct.dim3* %block_dim to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %15, i8* align 8 %16, i64 12, i1 false)
  %17 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %block_dim.coerce, i32 0, i32 0
  %18 = load i64, i64* %17, align 8
  %19 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %block_dim.coerce, i32 0, i32 1
  %20 = load i32, i32* %19, align 8
  %21 = bitcast i8* %8 to %struct.CUstream_st*
  %call = call i32 @cudaLaunchKernel(i8* bitcast (void (float, float*, float*)* @_Z4axpyfPfS_ to i8*), i64 %12, i32 %14, i64 %18, i32 %20, i8** %kernel_args, i64 %7, %struct.CUstream_st* %21)
  br label %setup.end

setup.end:                                        ; preds = %entry
  ret void
}

declare dso_local i32 @__cudaPopCallConfiguration(%struct.dim3*, %struct.dim3*, i64*, i8**)

declare dso_local i32 @cudaLaunchKernel(i8*, i64, i32, i64, i32, i8**, i64, %struct.CUstream_st*)

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #4

; Function Attrs: noinline norecurse optnone uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #5 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %kDataLen = alloca i32, align 4
  %a = alloca float, align 4
  %host_x = alloca [4 x float], align 16
  %host_y = alloca [4 x float], align 16
  %device_x = alloca float*, align 8
  %device_y = alloca float*, align 8
  %agg.tmp = alloca %struct.dim3, align 4
  %agg.tmp3 = alloca %struct.dim3, align 4
  %agg.tmp.coerce = alloca { i64, i32 }, align 4
  %agg.tmp3.coerce = alloca { i64, i32 }, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  store i32 4, i32* %kDataLen, align 4
  store float 2.000000e+00, float* %a, align 4
  %0 = bitcast [4 x float]* %host_x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([4 x float]* @__const.main.host_x to i8*), i64 16, i1 false)
  %call = call i32 @_ZL10cudaMallocIfE9cudaErrorPPT_m(float** %device_x, i64 16)
  %call1 = call i32 @_ZL10cudaMallocIfE9cudaErrorPPT_m(float** %device_y, i64 16)
  %1 = load float*, float** %device_x, align 8
  %2 = bitcast float* %1 to i8*
  %arraydecay = getelementptr inbounds [4 x float], [4 x float]* %host_x, i64 0, i64 0
  %3 = bitcast float* %arraydecay to i8*
  %call2 = call i32 @cudaMemcpy(i8* %2, i8* %3, i64 16, i32 1)
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %agg.tmp, i32 1, i32 1, i32 1)
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %agg.tmp3, i32 4, i32 1, i32 1)
  %4 = bitcast { i64, i32 }* %agg.tmp.coerce to i8*
  %5 = bitcast %struct.dim3* %agg.tmp to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %4, i8* align 4 %5, i64 12, i1 false)
  %6 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp.coerce, i32 0, i32 0
  %7 = load i64, i64* %6, align 4
  %8 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp.coerce, i32 0, i32 1
  %9 = load i32, i32* %8, align 4
  %10 = bitcast { i64, i32 }* %agg.tmp3.coerce to i8*
  %11 = bitcast %struct.dim3* %agg.tmp3 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %10, i8* align 4 %11, i64 12, i1 false)
  %12 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp3.coerce, i32 0, i32 0
  %13 = load i64, i64* %12, align 4
  %14 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp3.coerce, i32 0, i32 1
  %15 = load i32, i32* %14, align 4
  %call4 = call i32 @__cudaPushCallConfiguration(i64 %7, i32 %9, i64 %13, i32 %15, i64 0, i8* null)
  %tobool = icmp ne i32 %call4, 0
  br i1 %tobool, label %kcall.end, label %kcall.configok

kcall.configok:                                   ; preds = %entry
  %16 = load float, float* %a, align 4
  %17 = load float*, float** %device_x, align 8
  %18 = load float*, float** %device_y, align 8
  call void @_Z4axpyfPfS_(float %16, float* %17, float* %18)
  br label %kcall.end

kcall.end:                                        ; preds = %kcall.configok, %entry
  %call5 = call i32 @cudaDeviceSynchronize()
  %arraydecay6 = getelementptr inbounds [4 x float], [4 x float]* %host_y, i64 0, i64 0
  %19 = bitcast float* %arraydecay6 to i8*
  %20 = load float*, float** %device_y, align 8
  %21 = bitcast float* %20 to i8*
  %call7 = call i32 @cudaMemcpy(i8* %19, i8* %21, i64 16, i32 2)
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %kcall.end
  %22 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %22, 4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %call8 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0))
  %23 = load i32, i32* %i, align 4
  %call9 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* %call8, i32 %23)
  %call10 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %call9, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i64 0, i64 0))
  %24 = load i32, i32* %i, align 4
  %idxprom = sext i32 %24 to i64
  %arrayidx = getelementptr inbounds [4 x float], [4 x float]* %host_y, i64 0, i64 %idxprom
  %25 = load float, float* %arrayidx, align 4
  %call11 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEf(%"class.std::basic_ostream"* %call10, float %25)
  %call12 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %call11, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i64 0, i64 0))
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %26 = load i32, i32* %i, align 4
  %inc = add nsw i32 %26, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %call13 = call i32 @cudaDeviceReset()
  ret i32 0
}

; Function Attrs: noinline optnone uwtable
define internal i32 @_ZL10cudaMallocIfE9cudaErrorPPT_m(float** %devPtr, i64 %size) #3 {
entry:
  %devPtr.addr = alloca float**, align 8
  %size.addr = alloca i64, align 8
  store float** %devPtr, float*** %devPtr.addr, align 8
  store i64 %size, i64* %size.addr, align 8
  %0 = load float**, float*** %devPtr.addr, align 8
  %1 = bitcast float** %0 to i8*
  %2 = bitcast i8* %1 to i8**
  %3 = load i64, i64* %size.addr, align 8
  %call = call i32 @cudaMalloc(i8** %2, i64 %3)
  ret i32 %call
}

declare dso_local i32 @cudaMemcpy(i8*, i8*, i64, i32) #1

declare dso_local i32 @__cudaPushCallConfiguration(i64, i32, i64, i32, i64, i8*) #1

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN4dim3C2Ejjj(%struct.dim3* %this, i32 %vx, i32 %vy, i32 %vz) unnamed_addr #6 comdat align 2 {
entry:
  %this.addr = alloca %struct.dim3*, align 8
  %vx.addr = alloca i32, align 4
  %vy.addr = alloca i32, align 4
  %vz.addr = alloca i32, align 4
  store %struct.dim3* %this, %struct.dim3** %this.addr, align 8
  store i32 %vx, i32* %vx.addr, align 4
  store i32 %vy, i32* %vy.addr, align 4
  store i32 %vz, i32* %vz.addr, align 4
  %this1 = load %struct.dim3*, %struct.dim3** %this.addr, align 8
  %x = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 0
  %0 = load i32, i32* %vx.addr, align 4
  store i32 %0, i32* %x, align 4
  %y = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 1
  %1 = load i32, i32* %vy.addr, align 4
  store i32 %1, i32* %y, align 4
  %z = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 2
  %2 = load i32, i32* %vz.addr, align 4
  store i32 %2, i32* %z, align 4
  ret void
}

declare dso_local i32 @cudaDeviceSynchronize() #1

declare dso_local dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272), i8*) #1

declare dso_local dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"*, i32) #1

declare dso_local dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEf(%"class.std::basic_ostream"*, float) #1

declare dso_local i32 @cudaDeviceReset() #1

declare dso_local i32 @cudaMalloc(i8**, i64) #1

; Function Attrs: noinline uwtable
define internal void @_GLOBAL__sub_I_axpy.cu() #0 section ".text.startup" {
entry:
  call void @__cxx_global_var_init()
  ret void
}

attributes #0 = { noinline uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }
attributes #3 = { noinline optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind }
attributes #5 = { noinline norecurse optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 10, i32 1]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{!"clang version 9.0.0 (https://github.com/llvm/llvm-project.git 9e8d0d981b0cb1e3cbd0260af4e3b1f44ddf7be2)"}
