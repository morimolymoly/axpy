; ModuleID = 'basic.cu'
source_filename = "basic.cu"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.CUstream_st = type opaque
%struct.cudaDeviceProp = type { [256 x i8], %struct.CUuuid_st, [8 x i8], i32, i64, i64, i32, i32, i64, i32, [3 x i32], [3 x i32], i32, i64, i32, i32, i64, i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, [2 x i32], [2 x i32], [3 x i32], [2 x i32], [3 x i32], [3 x i32], i32, [2 x i32], [3 x i32], [2 x i32], i32, [2 x i32], [3 x i32], [2 x i32], [3 x i32], i32, [2 x i32], i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i64, i32, i32 }
%struct.CUuuid_st = type { [16 x i8] }
%struct.dim3 = type { i32, i32, i32 }

$_ZN4dim3C2Ejjj = comdat any

@.str = private unnamed_addr constant [5 x i8] c"-gpu\00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"-cpu\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"-hdm\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"-um\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"No CUDA device.\0A\00", align 1
@.str.5 = private unnamed_addr constant [32 x i8] c"GPU-%d : %s, C.C.%d.%d, U.M.%s\0A\00", align 1
@.str.6 = private unnamed_addr constant [3 x i8] c"ON\00", align 1
@.str.7 = private unnamed_addr constant [4 x i8] c"OFF\00", align 1
@.str.8 = private unnamed_addr constant [41 x i8] c"nvector=%d nloop=%d %e(%e) %s[sec]=%.3f\0A\00", align 1
@.str.9 = private unnamed_addr constant [4 x i8] c"GPU\00", align 1
@.str.10 = private unnamed_addr constant [4 x i8] c"CPU\00", align 1

; Function Attrs: noinline norecurse optnone uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %gpu = alloca i32, align 4
  %um = alloca i32, align 4
  %ngpu = alloca i32, align 4
  %nvector = alloca i32, align 4
  %nloop = alloca i32, align 4
  %offset = alloca i32*, align 8
  %length = alloca i32*, align 8
  %size = alloca i64, align 8
  %stream = alloca %struct.CUstream_st**, align 8
  %ndevice = alloca i32, align 4
  %igpu = alloca i32, align 4
  %prop = alloca %struct.cudaDeviceProp, align 8
  %h_a = alloca float*, align 8
  %h_b = alloca float*, align 8
  %h_c = alloca float*, align 8
  %d_a = alloca float**, align 8
  %d_b = alloca float**, align 8
  %d_c = alloca float**, align 8
  %igpu63 = alloca i32, align 4
  %i = alloca i32, align 4
  %igpu99 = alloca i32, align 4
  %igpu122 = alloca i32, align 4
  %t0 = alloca i64, align 8
  %loop = alloca i32, align 4
  %igpu137 = alloca i32, align 4
  %block = alloca i32, align 4
  %grid = alloca i32, align 4
  %agg.tmp = alloca %struct.dim3, align 4
  %agg.tmp145 = alloca %struct.dim3, align 4
  %agg.tmp.coerce = alloca { i64, i32 }, align 4
  %agg.tmp145.coerce = alloca { i64, i32 }, align 4
  %igpu161 = alloca i32, align 4
  %igpu173 = alloca i32, align 4
  %igpu198 = alloca i32, align 4
  %t1 = alloca i64, align 8
  %igpu208 = alloca i32, align 4
  %sum = alloca double, align 8
  %i222 = alloca i32, align 4
  %exact = alloca double, align 8
  %sec = alloca double, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  store i32 1, i32* %gpu, align 4
  store i32 0, i32* %um, align 4
  store i32 1, i32* %ngpu, align 4
  store i32 1000, i32* %nvector, align 4
  store i32 1000, i32* %nloop, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end38, %entry
  %0 = load i32, i32* %argc.addr, align 4
  %dec = add nsw i32 %0, -1
  store i32 %dec, i32* %argc.addr, align 4
  %tobool = icmp ne i32 %dec, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %1 = load i8**, i8*** %argv.addr, align 8
  %incdec.ptr = getelementptr inbounds i8*, i8** %1, i32 1
  store i8** %incdec.ptr, i8*** %argv.addr, align 8
  %2 = load i8**, i8*** %argv.addr, align 8
  %3 = load i8*, i8** %2, align 8
  %call = call i32 @strcmp(i8* %3, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0)) #8
  %tobool1 = icmp ne i32 %call, 0
  br i1 %tobool1, label %if.else, label %if.then

if.then:                                          ; preds = %while.body
  store i32 1, i32* %gpu, align 4
  br label %if.end38

if.else:                                          ; preds = %while.body
  %4 = load i8**, i8*** %argv.addr, align 8
  %5 = load i8*, i8** %4, align 8
  %call2 = call i32 @strcmp(i8* %5, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i64 0, i64 0)) #8
  %tobool3 = icmp ne i32 %call2, 0
  br i1 %tobool3, label %if.else5, label %if.then4

if.then4:                                         ; preds = %if.else
  store i32 0, i32* %gpu, align 4
  br label %if.end37

if.else5:                                         ; preds = %if.else
  %6 = load i8**, i8*** %argv.addr, align 8
  %7 = load i8*, i8** %6, align 8
  %call6 = call i32 @strcmp(i8* %7, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0)) #8
  %tobool7 = icmp ne i32 %call6, 0
  br i1 %tobool7, label %if.else9, label %if.then8

if.then8:                                         ; preds = %if.else5
  store i32 0, i32* %um, align 4
  br label %if.end36

if.else9:                                         ; preds = %if.else5
  %8 = load i8**, i8*** %argv.addr, align 8
  %9 = load i8*, i8** %8, align 8
  %call10 = call i32 @strcmp(i8* %9, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #8
  %tobool11 = icmp ne i32 %call10, 0
  br i1 %tobool11, label %if.else13, label %if.then12

if.then12:                                        ; preds = %if.else9
  store i32 1, i32* %um, align 4
  br label %if.end35

if.else13:                                        ; preds = %if.else9
  %10 = load i32, i32* %argc.addr, align 4
  %cmp = icmp eq i32 %10, 3
  br i1 %cmp, label %if.then14, label %if.else18

if.then14:                                        ; preds = %if.else13
  %11 = load i8**, i8*** %argv.addr, align 8
  %12 = load i8*, i8** %11, align 8
  %call15 = call i32 @atoi(i8* %12) #8
  store i32 %call15, i32* %ngpu, align 4
  %13 = load i32, i32* %ngpu, align 4
  %cmp16 = icmp slt i32 %13, 1
  br i1 %cmp16, label %if.then17, label %if.end

if.then17:                                        ; preds = %if.then14
  store i32 1, i32* %ngpu, align 4
  br label %if.end

if.end:                                           ; preds = %if.then17, %if.then14
  br label %if.end34

if.else18:                                        ; preds = %if.else13
  %14 = load i32, i32* %argc.addr, align 4
  %cmp19 = icmp eq i32 %14, 2
  br i1 %cmp19, label %if.then20, label %if.else25

if.then20:                                        ; preds = %if.else18
  %15 = load i8**, i8*** %argv.addr, align 8
  %16 = load i8*, i8** %15, align 8
  %call21 = call i32 @atoi(i8* %16) #8
  store i32 %call21, i32* %nvector, align 4
  %17 = load i32, i32* %nvector, align 4
  %cmp22 = icmp slt i32 %17, 1
  br i1 %cmp22, label %if.then23, label %if.end24

if.then23:                                        ; preds = %if.then20
  store i32 1, i32* %nvector, align 4
  br label %if.end24

if.end24:                                         ; preds = %if.then23, %if.then20
  br label %if.end33

if.else25:                                        ; preds = %if.else18
  %18 = load i32, i32* %argc.addr, align 4
  %cmp26 = icmp eq i32 %18, 1
  br i1 %cmp26, label %if.then27, label %if.end32

if.then27:                                        ; preds = %if.else25
  %19 = load i8**, i8*** %argv.addr, align 8
  %20 = load i8*, i8** %19, align 8
  %call28 = call i32 @atoi(i8* %20) #8
  store i32 %call28, i32* %nloop, align 4
  %21 = load i32, i32* %nloop, align 4
  %cmp29 = icmp slt i32 %21, 1
  br i1 %cmp29, label %if.then30, label %if.end31

if.then30:                                        ; preds = %if.then27
  store i32 1, i32* %nloop, align 4
  br label %if.end31

if.end31:                                         ; preds = %if.then30, %if.then27
  br label %if.end32

if.end32:                                         ; preds = %if.end31, %if.else25
  br label %if.end33

if.end33:                                         ; preds = %if.end32, %if.end24
  br label %if.end34

if.end34:                                         ; preds = %if.end33, %if.end
  br label %if.end35

if.end35:                                         ; preds = %if.end34, %if.then12
  br label %if.end36

if.end36:                                         ; preds = %if.end35, %if.then8
  br label %if.end37

if.end37:                                         ; preds = %if.end36, %if.then4
  br label %if.end38

if.end38:                                         ; preds = %if.end37, %if.then
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %22 = load i32, i32* %gpu, align 4
  %tobool39 = icmp ne i32 %22, 0
  br i1 %tobool39, label %if.then40, label %if.end50

if.then40:                                        ; preds = %while.end
  %call41 = call i32 @cudaGetDeviceCount(i32* %ndevice)
  %23 = load i32, i32* %ndevice, align 4
  %cmp42 = icmp slt i32 %23, 1
  br i1 %cmp42, label %if.then43, label %if.end45

if.then43:                                        ; preds = %if.then40
  %call44 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0))
  call void @exit(i32 1) #9
  unreachable

if.end45:                                         ; preds = %if.then40
  store i32 0, i32* %igpu, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end45
  %24 = load i32, i32* %igpu, align 4
  %25 = load i32, i32* %ngpu, align 4
  %cmp46 = icmp slt i32 %24, %25
  br i1 %cmp46, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %26 = load i32, i32* %igpu, align 4
  %call47 = call i32 @cudaGetDeviceProperties(%struct.cudaDeviceProp* %prop, i32 %26)
  %27 = load i32, i32* %igpu, align 4
  %name = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %prop, i32 0, i32 0
  %arraydecay = getelementptr inbounds [256 x i8], [256 x i8]* %name, i64 0, i64 0
  %major = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %prop, i32 0, i32 14
  %28 = load i32, i32* %major, align 8
  %minor = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %prop, i32 0, i32 15
  %29 = load i32, i32* %minor, align 4
  %30 = load i32, i32* %um, align 4
  %tobool48 = icmp ne i32 %30, 0
  %31 = zext i1 %tobool48 to i64
  %cond = select i1 %tobool48, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.7, i64 0, i64 0)
  %call49 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.5, i64 0, i64 0), i32 %27, i8* %arraydecay, i32 %28, i32 %29, i8* %cond)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %32 = load i32, i32* %igpu, align 4
  %inc = add nsw i32 %32, 1
  store i32 %inc, i32* %igpu, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %if.end50

if.end50:                                         ; preds = %for.end, %while.end
  %33 = load i32, i32* %nvector, align 4
  %conv = sext i32 %33 to i64
  %mul = mul i64 %conv, 4
  store i64 %mul, i64* %size, align 8
  %34 = load i64, i64* %size, align 8
  %call51 = call noalias i8* @malloc(i64 %34) #10
  %35 = bitcast i8* %call51 to float*
  store float* %35, float** %h_a, align 8
  %36 = load i64, i64* %size, align 8
  %call52 = call noalias i8* @malloc(i64 %36) #10
  %37 = bitcast i8* %call52 to float*
  store float* %37, float** %h_b, align 8
  %38 = load i64, i64* %size, align 8
  %call53 = call noalias i8* @malloc(i64 %38) #10
  %39 = bitcast i8* %call53 to float*
  store float* %39, float** %h_c, align 8
  %40 = load i32, i32* %ngpu, align 4
  %conv54 = sext i32 %40 to i64
  %mul55 = mul i64 %conv54, 4
  store i64 %mul55, i64* %size, align 8
  %41 = load i64, i64* %size, align 8
  %call56 = call noalias i8* @malloc(i64 %41) #10
  %42 = bitcast i8* %call56 to i32*
  store i32* %42, i32** %offset, align 8
  %43 = load i64, i64* %size, align 8
  %call57 = call noalias i8* @malloc(i64 %43) #10
  %44 = bitcast i8* %call57 to i32*
  store i32* %44, i32** %length, align 8
  %45 = load i32, i32* %nvector, align 4
  %46 = load i32, i32* %ngpu, align 4
  %47 = load i32*, i32** %offset, align 8
  %48 = load i32*, i32** %length, align 8
  call void @_ZL12divide_arrayiiPiS_(i32 %45, i32 %46, i32* %47, i32* %48)
  %49 = load i32, i32* %ngpu, align 4
  %conv58 = sext i32 %49 to i64
  %mul59 = mul i64 %conv58, 8
  store i64 %mul59, i64* %size, align 8
  %50 = load i64, i64* %size, align 8
  %call60 = call noalias i8* @malloc(i64 %50) #10
  %51 = bitcast i8* %call60 to float**
  store float** %51, float*** %d_a, align 8
  %52 = load i64, i64* %size, align 8
  %call61 = call noalias i8* @malloc(i64 %52) #10
  %53 = bitcast i8* %call61 to float**
  store float** %53, float*** %d_b, align 8
  %54 = load i64, i64* %size, align 8
  %call62 = call noalias i8* @malloc(i64 %54) #10
  %55 = bitcast i8* %call62 to float**
  store float** %55, float*** %d_c, align 8
  store i32 0, i32* %igpu63, align 4
  br label %for.cond64

for.cond64:                                       ; preds = %for.inc82, %if.end50
  %56 = load i32, i32* %igpu63, align 4
  %57 = load i32, i32* %ngpu, align 4
  %cmp65 = icmp slt i32 %56, %57
  br i1 %cmp65, label %for.body66, label %for.end84

for.body66:                                       ; preds = %for.cond64
  %58 = load i32, i32* %gpu, align 4
  %tobool67 = icmp ne i32 %58, 0
  br i1 %tobool67, label %if.then68, label %if.end70

if.then68:                                        ; preds = %for.body66
  %59 = load i32, i32* %igpu63, align 4
  %call69 = call i32 @cudaSetDevice(i32 %59)
  br label %if.end70

if.end70:                                         ; preds = %if.then68, %for.body66
  %60 = load i32*, i32** %length, align 8
  %61 = load i32, i32* %igpu63, align 4
  %idxprom = sext i32 %61 to i64
  %arrayidx = getelementptr inbounds i32, i32* %60, i64 %idxprom
  %62 = load i32, i32* %arrayidx, align 4
  %conv71 = sext i32 %62 to i64
  %mul72 = mul i64 %conv71, 4
  store i64 %mul72, i64* %size, align 8
  %63 = load float**, float*** %d_a, align 8
  %64 = load i32, i32* %igpu63, align 4
  %idxprom73 = sext i32 %64 to i64
  %arrayidx74 = getelementptr inbounds float*, float** %63, i64 %idxprom73
  %65 = bitcast float** %arrayidx74 to i8**
  %66 = load i64, i64* %size, align 8
  %call75 = call i32 @cudaMalloc(i8** %65, i64 %66)
  %67 = load float**, float*** %d_b, align 8
  %68 = load i32, i32* %igpu63, align 4
  %idxprom76 = sext i32 %68 to i64
  %arrayidx77 = getelementptr inbounds float*, float** %67, i64 %idxprom76
  %69 = bitcast float** %arrayidx77 to i8**
  %70 = load i64, i64* %size, align 8
  %call78 = call i32 @cudaMalloc(i8** %69, i64 %70)
  %71 = load float**, float*** %d_c, align 8
  %72 = load i32, i32* %igpu63, align 4
  %idxprom79 = sext i32 %72 to i64
  %arrayidx80 = getelementptr inbounds float*, float** %71, i64 %idxprom79
  %73 = bitcast float** %arrayidx80 to i8**
  %74 = load i64, i64* %size, align 8
  %call81 = call i32 @cudaMalloc(i8** %73, i64 %74)
  br label %for.inc82

for.inc82:                                        ; preds = %if.end70
  %75 = load i32, i32* %igpu63, align 4
  %inc83 = add nsw i32 %75, 1
  store i32 %inc83, i32* %igpu63, align 4
  br label %for.cond64

for.end84:                                        ; preds = %for.cond64
  store i32 0, i32* %i, align 4
  br label %for.cond85

for.cond85:                                       ; preds = %for.inc96, %for.end84
  %76 = load i32, i32* %i, align 4
  %77 = load i32, i32* %nvector, align 4
  %cmp86 = icmp slt i32 %76, %77
  br i1 %cmp86, label %for.body87, label %for.end98

for.body87:                                       ; preds = %for.cond85
  %78 = load i32, i32* %i, align 4
  %conv88 = sitofp i32 %78 to float
  %79 = load float*, float** %h_a, align 8
  %80 = load i32, i32* %i, align 4
  %idxprom89 = sext i32 %80 to i64
  %arrayidx90 = getelementptr inbounds float, float* %79, i64 %idxprom89
  store float %conv88, float* %arrayidx90, align 4
  %81 = load i32, i32* %i, align 4
  %add = add nsw i32 %81, 1
  %conv91 = sitofp i32 %add to float
  %82 = load float*, float** %h_b, align 8
  %83 = load i32, i32* %i, align 4
  %idxprom92 = sext i32 %83 to i64
  %arrayidx93 = getelementptr inbounds float, float* %82, i64 %idxprom92
  store float %conv91, float* %arrayidx93, align 4
  %84 = load float*, float** %h_c, align 8
  %85 = load i32, i32* %i, align 4
  %idxprom94 = sext i32 %85 to i64
  %arrayidx95 = getelementptr inbounds float, float* %84, i64 %idxprom94
  store float 0.000000e+00, float* %arrayidx95, align 4
  br label %for.inc96

for.inc96:                                        ; preds = %for.body87
  %86 = load i32, i32* %i, align 4
  %inc97 = add nsw i32 %86, 1
  store i32 %inc97, i32* %i, align 4
  br label %for.cond85

for.end98:                                        ; preds = %for.cond85
  store i32 0, i32* %igpu99, align 4
  br label %for.cond100

for.cond100:                                      ; preds = %for.inc119, %for.end98
  %87 = load i32, i32* %igpu99, align 4
  %88 = load i32, i32* %ngpu, align 4
  %cmp101 = icmp slt i32 %87, %88
  br i1 %cmp101, label %for.body102, label %for.end121

for.body102:                                      ; preds = %for.cond100
  %89 = load i32*, i32** %length, align 8
  %90 = load i32, i32* %igpu99, align 4
  %idxprom103 = sext i32 %90 to i64
  %arrayidx104 = getelementptr inbounds i32, i32* %89, i64 %idxprom103
  %91 = load i32, i32* %arrayidx104, align 4
  %conv105 = sext i32 %91 to i64
  %mul106 = mul i64 %conv105, 4
  store i64 %mul106, i64* %size, align 8
  %92 = load float**, float*** %d_a, align 8
  %93 = load i32, i32* %igpu99, align 4
  %idxprom107 = sext i32 %93 to i64
  %arrayidx108 = getelementptr inbounds float*, float** %92, i64 %idxprom107
  %94 = load float*, float** %arrayidx108, align 8
  %95 = bitcast float* %94 to i8*
  %96 = load float*, float** %h_a, align 8
  %97 = load i32*, i32** %offset, align 8
  %98 = load i32, i32* %igpu99, align 4
  %idxprom109 = sext i32 %98 to i64
  %arrayidx110 = getelementptr inbounds i32, i32* %97, i64 %idxprom109
  %99 = load i32, i32* %arrayidx110, align 4
  %idx.ext = sext i32 %99 to i64
  %add.ptr = getelementptr inbounds float, float* %96, i64 %idx.ext
  %100 = bitcast float* %add.ptr to i8*
  %101 = load i64, i64* %size, align 8
  %call111 = call i32 @cudaMemcpy(i8* %95, i8* %100, i64 %101, i32 1)
  %102 = load float**, float*** %d_b, align 8
  %103 = load i32, i32* %igpu99, align 4
  %idxprom112 = sext i32 %103 to i64
  %arrayidx113 = getelementptr inbounds float*, float** %102, i64 %idxprom112
  %104 = load float*, float** %arrayidx113, align 8
  %105 = bitcast float* %104 to i8*
  %106 = load float*, float** %h_b, align 8
  %107 = load i32*, i32** %offset, align 8
  %108 = load i32, i32* %igpu99, align 4
  %idxprom114 = sext i32 %108 to i64
  %arrayidx115 = getelementptr inbounds i32, i32* %107, i64 %idxprom114
  %109 = load i32, i32* %arrayidx115, align 4
  %idx.ext116 = sext i32 %109 to i64
  %add.ptr117 = getelementptr inbounds float, float* %106, i64 %idx.ext116
  %110 = bitcast float* %add.ptr117 to i8*
  %111 = load i64, i64* %size, align 8
  %call118 = call i32 @cudaMemcpy(i8* %105, i8* %110, i64 %111, i32 1)
  br label %for.inc119

for.inc119:                                       ; preds = %for.body102
  %112 = load i32, i32* %igpu99, align 4
  %inc120 = add nsw i32 %112, 1
  store i32 %inc120, i32* %igpu99, align 4
  br label %for.cond100

for.end121:                                       ; preds = %for.cond100
  store i32 0, i32* %igpu122, align 4
  br label %for.cond123

for.cond123:                                      ; preds = %for.inc128, %for.end121
  %113 = load i32, i32* %igpu122, align 4
  %114 = load i32, i32* %ngpu, align 4
  %cmp124 = icmp slt i32 %113, %114
  br i1 %cmp124, label %for.body125, label %for.end130

for.body125:                                      ; preds = %for.cond123
  %115 = load i32, i32* %igpu122, align 4
  %call126 = call i32 @cudaSetDevice(i32 %115)
  %call127 = call i32 @cudaDeviceSynchronize()
  br label %for.inc128

for.inc128:                                       ; preds = %for.body125
  %116 = load i32, i32* %igpu122, align 4
  %inc129 = add nsw i32 %116, 1
  store i32 %inc129, i32* %igpu122, align 4
  br label %for.cond123

for.end130:                                       ; preds = %for.cond123
  %call131 = call i64 @clock() #10
  store i64 %call131, i64* %t0, align 8
  store i32 0, i32* %loop, align 4
  br label %for.cond132

for.cond132:                                      ; preds = %for.inc195, %for.end130
  %117 = load i32, i32* %loop, align 4
  %118 = load i32, i32* %nloop, align 4
  %cmp133 = icmp slt i32 %117, %118
  br i1 %cmp133, label %for.body134, label %for.end197

for.body134:                                      ; preds = %for.cond132
  %119 = load i32, i32* %gpu, align 4
  %tobool135 = icmp ne i32 %119, 0
  br i1 %tobool135, label %if.then136, label %if.else172

if.then136:                                       ; preds = %for.body134
  store i32 0, i32* %igpu137, align 4
  br label %for.cond138

for.cond138:                                      ; preds = %for.inc158, %if.then136
  %120 = load i32, i32* %igpu137, align 4
  %121 = load i32, i32* %ngpu, align 4
  %cmp139 = icmp slt i32 %120, %121
  br i1 %cmp139, label %for.body140, label %for.end160

for.body140:                                      ; preds = %for.cond138
  %122 = load i32, i32* %igpu137, align 4
  %call141 = call i32 @cudaSetDevice(i32 %122)
  store i32 256, i32* %block, align 4
  %123 = load i32*, i32** %length, align 8
  %124 = load i32, i32* %igpu137, align 4
  %idxprom142 = sext i32 %124 to i64
  %arrayidx143 = getelementptr inbounds i32, i32* %123, i64 %idxprom142
  %125 = load i32, i32* %arrayidx143, align 4
  %126 = load i32, i32* %block, align 4
  %sub = sub nsw i32 %126, 1
  %add144 = add nsw i32 %125, %sub
  %127 = load i32, i32* %block, align 4
  %div = sdiv i32 %add144, %127
  store i32 %div, i32* %grid, align 4
  %128 = load i32, i32* %grid, align 4
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %agg.tmp, i32 %128, i32 1, i32 1)
  %129 = load i32, i32* %block, align 4
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %agg.tmp145, i32 %129, i32 1, i32 1)
  %130 = load %struct.CUstream_st**, %struct.CUstream_st*** %stream, align 8
  %131 = load i32, i32* %igpu137, align 4
  %idxprom146 = sext i32 %131 to i64
  %arrayidx147 = getelementptr inbounds %struct.CUstream_st*, %struct.CUstream_st** %130, i64 %idxprom146
  %132 = load %struct.CUstream_st*, %struct.CUstream_st** %arrayidx147, align 8
  %133 = bitcast %struct.CUstream_st* %132 to i8*
  %134 = bitcast { i64, i32 }* %agg.tmp.coerce to i8*
  %135 = bitcast %struct.dim3* %agg.tmp to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %134, i8* align 4 %135, i64 12, i1 false)
  %136 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp.coerce, i32 0, i32 0
  %137 = load i64, i64* %136, align 4
  %138 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp.coerce, i32 0, i32 1
  %139 = load i32, i32* %138, align 4
  %140 = bitcast { i64, i32 }* %agg.tmp145.coerce to i8*
  %141 = bitcast %struct.dim3* %agg.tmp145 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %140, i8* align 4 %141, i64 12, i1 false)
  %142 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp145.coerce, i32 0, i32 0
  %143 = load i64, i64* %142, align 4
  %144 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp145.coerce, i32 0, i32 1
  %145 = load i32, i32* %144, align 4
  %call148 = call i32 @__cudaPushCallConfiguration(i64 %137, i32 %139, i64 %143, i32 %145, i64 0, i8* %133)
  %tobool149 = icmp ne i32 %call148, 0
  br i1 %tobool149, label %kcall.end, label %kcall.configok

kcall.configok:                                   ; preds = %for.body140
  %146 = load i32*, i32** %length, align 8
  %147 = load i32, i32* %igpu137, align 4
  %idxprom150 = sext i32 %147 to i64
  %arrayidx151 = getelementptr inbounds i32, i32* %146, i64 %idxprom150
  %148 = load i32, i32* %arrayidx151, align 4
  %149 = load float**, float*** %d_a, align 8
  %150 = load i32, i32* %igpu137, align 4
  %idxprom152 = sext i32 %150 to i64
  %arrayidx153 = getelementptr inbounds float*, float** %149, i64 %idxprom152
  %151 = load float*, float** %arrayidx153, align 8
  %152 = load float**, float*** %d_b, align 8
  %153 = load i32, i32* %igpu137, align 4
  %idxprom154 = sext i32 %153 to i64
  %arrayidx155 = getelementptr inbounds float*, float** %152, i64 %idxprom154
  %154 = load float*, float** %arrayidx155, align 8
  %155 = load float**, float*** %d_c, align 8
  %156 = load i32, i32* %igpu137, align 4
  %idxprom156 = sext i32 %156 to i64
  %arrayidx157 = getelementptr inbounds float*, float** %155, i64 %idxprom156
  %157 = load float*, float** %arrayidx157, align 8
  call void @_ZL8vadd_gpuiPKfS0_Pf(i32 %148, float* %151, float* %154, float* %157)
  br label %kcall.end

kcall.end:                                        ; preds = %kcall.configok, %for.body140
  br label %for.inc158

for.inc158:                                       ; preds = %kcall.end
  %158 = load i32, i32* %igpu137, align 4
  %inc159 = add nsw i32 %158, 1
  store i32 %inc159, i32* %igpu137, align 4
  br label %for.cond138

for.end160:                                       ; preds = %for.cond138
  store i32 0, i32* %igpu161, align 4
  br label %for.cond162

for.cond162:                                      ; preds = %for.inc169, %for.end160
  %159 = load i32, i32* %igpu161, align 4
  %160 = load i32, i32* %ngpu, align 4
  %cmp163 = icmp slt i32 %159, %160
  br i1 %cmp163, label %for.body164, label %for.end171

for.body164:                                      ; preds = %for.cond162
  %161 = load i32, i32* %igpu161, align 4
  %call165 = call i32 @cudaSetDevice(i32 %161)
  %162 = load %struct.CUstream_st**, %struct.CUstream_st*** %stream, align 8
  %163 = load i32, i32* %igpu161, align 4
  %idxprom166 = sext i32 %163 to i64
  %arrayidx167 = getelementptr inbounds %struct.CUstream_st*, %struct.CUstream_st** %162, i64 %idxprom166
  %164 = load %struct.CUstream_st*, %struct.CUstream_st** %arrayidx167, align 8
  %call168 = call i32 @cudaStreamSynchronize(%struct.CUstream_st* %164)
  br label %for.inc169

for.inc169:                                       ; preds = %for.body164
  %165 = load i32, i32* %igpu161, align 4
  %inc170 = add nsw i32 %165, 1
  store i32 %inc170, i32* %igpu161, align 4
  br label %for.cond162

for.end171:                                       ; preds = %for.cond162
  br label %if.end194

if.else172:                                       ; preds = %for.body134
  store i32 0, i32* %igpu173, align 4
  br label %for.cond174

for.cond174:                                      ; preds = %for.inc191, %if.else172
  %166 = load i32, i32* %igpu173, align 4
  %167 = load i32, i32* %ngpu, align 4
  %cmp175 = icmp slt i32 %166, %167
  br i1 %cmp175, label %for.body176, label %for.end193

for.body176:                                      ; preds = %for.cond174
  %168 = load i32*, i32** %length, align 8
  %169 = load i32, i32* %igpu173, align 4
  %idxprom177 = sext i32 %169 to i64
  %arrayidx178 = getelementptr inbounds i32, i32* %168, i64 %idxprom177
  %170 = load i32, i32* %arrayidx178, align 4
  %171 = load float*, float** %h_a, align 8
  %172 = load i32*, i32** %offset, align 8
  %173 = load i32, i32* %igpu173, align 4
  %idxprom179 = sext i32 %173 to i64
  %arrayidx180 = getelementptr inbounds i32, i32* %172, i64 %idxprom179
  %174 = load i32, i32* %arrayidx180, align 4
  %idx.ext181 = sext i32 %174 to i64
  %add.ptr182 = getelementptr inbounds float, float* %171, i64 %idx.ext181
  %175 = load float*, float** %h_b, align 8
  %176 = load i32*, i32** %offset, align 8
  %177 = load i32, i32* %igpu173, align 4
  %idxprom183 = sext i32 %177 to i64
  %arrayidx184 = getelementptr inbounds i32, i32* %176, i64 %idxprom183
  %178 = load i32, i32* %arrayidx184, align 4
  %idx.ext185 = sext i32 %178 to i64
  %add.ptr186 = getelementptr inbounds float, float* %175, i64 %idx.ext185
  %179 = load float*, float** %h_c, align 8
  %180 = load i32*, i32** %offset, align 8
  %181 = load i32, i32* %igpu173, align 4
  %idxprom187 = sext i32 %181 to i64
  %arrayidx188 = getelementptr inbounds i32, i32* %180, i64 %idxprom187
  %182 = load i32, i32* %arrayidx188, align 4
  %idx.ext189 = sext i32 %182 to i64
  %add.ptr190 = getelementptr inbounds float, float* %179, i64 %idx.ext189
  call void @_ZL8vadd_cpuiPKfS0_Pf(i32 %170, float* %add.ptr182, float* %add.ptr186, float* %add.ptr190)
  br label %for.inc191

for.inc191:                                       ; preds = %for.body176
  %183 = load i32, i32* %igpu173, align 4
  %inc192 = add nsw i32 %183, 1
  store i32 %inc192, i32* %igpu173, align 4
  br label %for.cond174

for.end193:                                       ; preds = %for.cond174
  br label %if.end194

if.end194:                                        ; preds = %for.end193, %for.end171
  br label %for.inc195

for.inc195:                                       ; preds = %if.end194
  %184 = load i32, i32* %loop, align 4
  %inc196 = add nsw i32 %184, 1
  store i32 %inc196, i32* %loop, align 4
  br label %for.cond132

for.end197:                                       ; preds = %for.cond132
  store i32 0, i32* %igpu198, align 4
  br label %for.cond199

for.cond199:                                      ; preds = %for.inc204, %for.end197
  %185 = load i32, i32* %igpu198, align 4
  %186 = load i32, i32* %ngpu, align 4
  %cmp200 = icmp slt i32 %185, %186
  br i1 %cmp200, label %for.body201, label %for.end206

for.body201:                                      ; preds = %for.cond199
  %187 = load i32, i32* %igpu198, align 4
  %call202 = call i32 @cudaSetDevice(i32 %187)
  %call203 = call i32 @cudaDeviceSynchronize()
  br label %for.inc204

for.inc204:                                       ; preds = %for.body201
  %188 = load i32, i32* %igpu198, align 4
  %inc205 = add nsw i32 %188, 1
  store i32 %inc205, i32* %igpu198, align 4
  br label %for.cond199

for.end206:                                       ; preds = %for.cond199
  %call207 = call i64 @clock() #10
  store i64 %call207, i64* %t1, align 8
  store i32 0, i32* %igpu208, align 4
  br label %for.cond209

for.cond209:                                      ; preds = %for.inc219, %for.end206
  %189 = load i32, i32* %igpu208, align 4
  %190 = load i32, i32* %ngpu, align 4
  %cmp210 = icmp slt i32 %189, %190
  br i1 %cmp210, label %for.body211, label %for.end221

for.body211:                                      ; preds = %for.cond209
  %191 = load float*, float** %h_c, align 8
  %192 = load i32*, i32** %offset, align 8
  %193 = load i32, i32* %igpu208, align 4
  %idxprom212 = sext i32 %193 to i64
  %arrayidx213 = getelementptr inbounds i32, i32* %192, i64 %idxprom212
  %194 = load i32, i32* %arrayidx213, align 4
  %idx.ext214 = sext i32 %194 to i64
  %add.ptr215 = getelementptr inbounds float, float* %191, i64 %idx.ext214
  %195 = bitcast float* %add.ptr215 to i8*
  %196 = load float**, float*** %d_c, align 8
  %197 = load i32, i32* %igpu208, align 4
  %idxprom216 = sext i32 %197 to i64
  %arrayidx217 = getelementptr inbounds float*, float** %196, i64 %idxprom216
  %198 = load float*, float** %arrayidx217, align 8
  %199 = bitcast float* %198 to i8*
  %200 = load i64, i64* %size, align 8
  %call218 = call i32 @cudaMemcpy(i8* %195, i8* %199, i64 %200, i32 2)
  br label %for.inc219

for.inc219:                                       ; preds = %for.body211
  %201 = load i32, i32* %igpu208, align 4
  %inc220 = add nsw i32 %201, 1
  store i32 %inc220, i32* %igpu208, align 4
  br label %for.cond209

for.end221:                                       ; preds = %for.cond209
  store double 0.000000e+00, double* %sum, align 8
  store i32 0, i32* %i222, align 4
  br label %for.cond223

for.cond223:                                      ; preds = %for.inc230, %for.end221
  %202 = load i32, i32* %i222, align 4
  %203 = load i32, i32* %nvector, align 4
  %cmp224 = icmp slt i32 %202, %203
  br i1 %cmp224, label %for.body225, label %for.end232

for.body225:                                      ; preds = %for.cond223
  %204 = load float*, float** %h_c, align 8
  %205 = load i32, i32* %i222, align 4
  %idxprom226 = sext i32 %205 to i64
  %arrayidx227 = getelementptr inbounds float, float* %204, i64 %idxprom226
  %206 = load float, float* %arrayidx227, align 4
  %conv228 = fpext float %206 to double
  %207 = load double, double* %sum, align 8
  %add229 = fadd contract double %207, %conv228
  store double %add229, double* %sum, align 8
  br label %for.inc230

for.inc230:                                       ; preds = %for.body225
  %208 = load i32, i32* %i222, align 4
  %inc231 = add nsw i32 %208, 1
  store i32 %inc231, i32* %i222, align 4
  br label %for.cond223

for.end232:                                       ; preds = %for.cond223
  %209 = load i32, i32* %nvector, align 4
  %conv233 = sitofp i32 %209 to double
  %210 = load i32, i32* %nvector, align 4
  %conv234 = sitofp i32 %210 to double
  %mul235 = fmul contract double %conv233, %conv234
  store double %mul235, double* %exact, align 8
  %211 = load i64, i64* %t1, align 8
  %212 = load i64, i64* %t0, align 8
  %sub236 = sub nsw i64 %211, %212
  %conv237 = sitofp i64 %sub236 to double
  %div238 = fdiv double %conv237, 1.000000e+06
  store double %div238, double* %sec, align 8
  %213 = load i32, i32* %nvector, align 4
  %214 = load i32, i32* %nloop, align 4
  %215 = load double, double* %sum, align 8
  %216 = load double, double* %exact, align 8
  %217 = load i32, i32* %gpu, align 4
  %tobool239 = icmp ne i32 %217, 0
  br i1 %tobool239, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.end232
  br label %cond.end

cond.false:                                       ; preds = %for.end232
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond-lvalue = phi [4 x i8]* [ @.str.9, %cond.true ], [ @.str.10, %cond.false ]
  %arraydecay240 = getelementptr inbounds [4 x i8], [4 x i8]* %cond-lvalue, i64 0, i64 0
  %218 = load double, double* %sec, align 8
  %call241 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.8, i64 0, i64 0), i32 %213, i32 %214, double %215, double %216, i8* %arraydecay240, double %218)
  %219 = load float*, float** %h_a, align 8
  %220 = bitcast float* %219 to i8*
  call void @free(i8* %220) #10
  %221 = load float*, float** %h_b, align 8
  %222 = bitcast float* %221 to i8*
  call void @free(i8* %222) #10
  %223 = load float*, float** %h_c, align 8
  %224 = bitcast float* %223 to i8*
  call void @free(i8* %224) #10
  %225 = load float**, float*** %d_a, align 8
  %226 = bitcast float** %225 to i8*
  call void @free(i8* %226) #10
  %227 = load float**, float*** %d_b, align 8
  %228 = bitcast float** %227 to i8*
  call void @free(i8* %228) #10
  %229 = load float**, float*** %d_c, align 8
  %230 = bitcast float** %229 to i8*
  call void @free(i8* %230) #10
  %call242 = call i32 @cudaDeviceReset()
  ret i32 0
}

; Function Attrs: nounwind readonly
declare dso_local i32 @strcmp(i8*, i8*) #1

; Function Attrs: nounwind readonly
declare dso_local i32 @atoi(i8*) #1

declare dso_local i32 @cudaGetDeviceCount(i32*) #2

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

declare dso_local i32 @cudaGetDeviceProperties(%struct.cudaDeviceProp*, i32) #2

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal void @_ZL12divide_arrayiiPiS_(i32 %n, i32 %ndiv, i32* %offset, i32* %length) #5 {
entry:
  %n.addr = alloca i32, align 4
  %ndiv.addr = alloca i32, align 4
  %offset.addr = alloca i32*, align 8
  %length.addr = alloca i32*, align 8
  %l_n = alloca i32, align 4
  %i = alloca i32, align 4
  %istop = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  store i32 %ndiv, i32* %ndiv.addr, align 4
  store i32* %offset, i32** %offset.addr, align 8
  store i32* %length, i32** %length.addr, align 8
  %0 = load i32, i32* %n.addr, align 4
  %1 = load i32, i32* %ndiv.addr, align 4
  %sub = sub nsw i32 %1, 1
  %add = add nsw i32 %0, %sub
  %2 = load i32, i32* %ndiv.addr, align 4
  %div = sdiv i32 %add, %2
  store i32 %div, i32* %l_n, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i32, i32* %i, align 4
  %4 = load i32, i32* %ndiv.addr, align 4
  %cmp = icmp slt i32 %3, %4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4
  %6 = load i32, i32* %l_n, align 4
  %mul = mul nsw i32 %5, %6
  %7 = load i32*, i32** %offset.addr, align 8
  %8 = load i32, i32* %i, align 4
  %idxprom = sext i32 %8 to i64
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 %idxprom
  store i32 %mul, i32* %arrayidx, align 4
  %9 = load i32, i32* %i, align 4
  %add1 = add nsw i32 %9, 1
  %10 = load i32, i32* %l_n, align 4
  %mul2 = mul nsw i32 %add1, %10
  store i32 %mul2, i32* %istop, align 4
  %11 = load i32, i32* %istop, align 4
  %12 = load i32, i32* %n.addr, align 4
  %cmp3 = icmp sgt i32 %11, %12
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %13 = load i32, i32* %n.addr, align 4
  store i32 %13, i32* %istop, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  %14 = load i32, i32* %istop, align 4
  %15 = load i32*, i32** %offset.addr, align 8
  %16 = load i32, i32* %i, align 4
  %idxprom4 = sext i32 %16 to i64
  %arrayidx5 = getelementptr inbounds i32, i32* %15, i64 %idxprom4
  %17 = load i32, i32* %arrayidx5, align 4
  %sub6 = sub nsw i32 %14, %17
  %18 = load i32*, i32** %length.addr, align 8
  %19 = load i32, i32* %i, align 4
  %idxprom7 = sext i32 %19 to i64
  %arrayidx8 = getelementptr inbounds i32, i32* %18, i64 %idxprom7
  store i32 %sub6, i32* %arrayidx8, align 4
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %20 = load i32, i32* %i, align 4
  %inc = add nsw i32 %20, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

declare dso_local i32 @cudaSetDevice(i32) #2

declare dso_local i32 @cudaMalloc(i8**, i64) #2

declare dso_local i32 @cudaMemcpy(i8*, i8*, i64, i32) #2

declare dso_local i32 @cudaDeviceSynchronize() #2

; Function Attrs: nounwind
declare dso_local i64 @clock() #4

declare dso_local i32 @__cudaPushCallConfiguration(i64, i32, i64, i32, i64, i8*) #2

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN4dim3C2Ejjj(%struct.dim3* %this, i32 %vx, i32 %vy, i32 %vz) unnamed_addr #5 comdat align 2 {
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

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #6

; Function Attrs: noinline optnone uwtable
define internal void @_ZL8vadd_gpuiPKfS0_Pf(i32 %n, float* %a, float* %b, float* %c) #7 {
entry:
  %n.addr = alloca i32, align 4
  %a.addr = alloca float*, align 8
  %b.addr = alloca float*, align 8
  %c.addr = alloca float*, align 8
  %grid_dim = alloca %struct.dim3, align 8
  %block_dim = alloca %struct.dim3, align 8
  %shmem_size = alloca i64, align 8
  %stream = alloca i8*, align 8
  %grid_dim.coerce = alloca { i64, i32 }, align 8
  %block_dim.coerce = alloca { i64, i32 }, align 8
  store i32 %n, i32* %n.addr, align 4
  store float* %a, float** %a.addr, align 8
  store float* %b, float** %b.addr, align 8
  store float* %c, float** %c.addr, align 8
  %kernel_args = alloca i8*, i64 4, align 16
  %0 = bitcast i32* %n.addr to i8*
  %1 = getelementptr i8*, i8** %kernel_args, i32 0
  store i8* %0, i8** %1
  %2 = bitcast float** %a.addr to i8*
  %3 = getelementptr i8*, i8** %kernel_args, i32 1
  store i8* %2, i8** %3
  %4 = bitcast float** %b.addr to i8*
  %5 = getelementptr i8*, i8** %kernel_args, i32 2
  store i8* %4, i8** %5
  %6 = bitcast float** %c.addr to i8*
  %7 = getelementptr i8*, i8** %kernel_args, i32 3
  store i8* %6, i8** %7
  %8 = call i32 @__cudaPopCallConfiguration(%struct.dim3* %grid_dim, %struct.dim3* %block_dim, i64* %shmem_size, i8** %stream)
  %9 = load i64, i64* %shmem_size, align 8
  %10 = load i8*, i8** %stream, align 8
  %11 = bitcast { i64, i32 }* %grid_dim.coerce to i8*
  %12 = bitcast %struct.dim3* %grid_dim to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %11, i8* align 8 %12, i64 12, i1 false)
  %13 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %grid_dim.coerce, i32 0, i32 0
  %14 = load i64, i64* %13, align 8
  %15 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %grid_dim.coerce, i32 0, i32 1
  %16 = load i32, i32* %15, align 8
  %17 = bitcast { i64, i32 }* %block_dim.coerce to i8*
  %18 = bitcast %struct.dim3* %block_dim to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %17, i8* align 8 %18, i64 12, i1 false)
  %19 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %block_dim.coerce, i32 0, i32 0
  %20 = load i64, i64* %19, align 8
  %21 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %block_dim.coerce, i32 0, i32 1
  %22 = load i32, i32* %21, align 8
  %23 = bitcast i8* %10 to %struct.CUstream_st*
  %call = call i32 @cudaLaunchKernel(i8* bitcast (void (i32, float*, float*, float*)* @_ZL8vadd_gpuiPKfS0_Pf to i8*), i64 %14, i32 %16, i64 %20, i32 %22, i8** %kernel_args, i64 %9, %struct.CUstream_st* %23)
  br label %setup.end

setup.end:                                        ; preds = %entry
  ret void
}

declare dso_local i32 @cudaStreamSynchronize(%struct.CUstream_st*) #2

; Function Attrs: noinline optnone uwtable
define internal void @_ZL8vadd_cpuiPKfS0_Pf(i32 %n, float* %a, float* %b, float* %c) #7 {
entry:
  %n.addr = alloca i32, align 4
  %a.addr = alloca float*, align 8
  %b.addr = alloca float*, align 8
  %c.addr = alloca float*, align 8
  %i = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  store float* %a, float** %a.addr, align 8
  store float* %b, float** %b.addr, align 8
  store float* %c, float** %c.addr, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %1 = load i32, i32* %n.addr, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load float*, float** %a.addr, align 8
  %3 = load i32, i32* %i, align 4
  %idxprom = sext i32 %3 to i64
  %arrayidx = getelementptr inbounds float, float* %2, i64 %idxprom
  %4 = load float, float* %arrayidx, align 4
  %5 = load float*, float** %b.addr, align 8
  %6 = load i32, i32* %i, align 4
  %idxprom1 = sext i32 %6 to i64
  %arrayidx2 = getelementptr inbounds float, float* %5, i64 %idxprom1
  %7 = load float, float* %arrayidx2, align 4
  %8 = load float*, float** %c.addr, align 8
  %9 = load i32, i32* %i, align 4
  %idxprom3 = sext i32 %9 to i64
  %arrayidx4 = getelementptr inbounds float, float* %8, i64 %idxprom3
  call void @_ZL9vadd_calcffPf(float %4, float %7, float* %arrayidx4)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %10 = load i32, i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

; Function Attrs: nounwind
declare dso_local void @free(i8*) #4

declare dso_local i32 @cudaDeviceReset() #2

declare dso_local i32 @__cudaPopCallConfiguration(%struct.dim3*, %struct.dim3*, i64*, i8**)

declare dso_local i32 @cudaLaunchKernel(i8*, i64, i32, i64, i32, i8**, i64, %struct.CUstream_st*)

; Function Attrs: noinline nounwind optnone uwtable
define internal void @_ZL9vadd_calcffPf(float %a, float %b, float* %c) #5 {
entry:
  %a.addr = alloca float, align 4
  %b.addr = alloca float, align 4
  %c.addr = alloca float*, align 8
  store float %a, float* %a.addr, align 4
  store float %b, float* %b.addr, align 4
  store float* %c, float** %c.addr, align 8
  %0 = load float, float* %a.addr, align 4
  %1 = load float, float* %b.addr, align 4
  %add = fadd contract float %0, %1
  %2 = load float*, float** %c.addr, align 8
  store float %add, float* %2, align 4
  ret void
}

attributes #0 = { noinline norecurse optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { argmemonly nounwind }
attributes #7 = { noinline optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nounwind readonly }
attributes #9 = { noreturn nounwind }
attributes #10 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 10, i32 1]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{!"clang version 9.0.0 (https://github.com/morimolymoly/llvm.git f7f3c2919a97198083f994fce16cd2b09010f77a)"}
