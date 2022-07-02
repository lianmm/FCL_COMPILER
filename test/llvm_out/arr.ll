; ModuleID = 'arr.c'
source_filename = "arr.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@__const.main.a = private unnamed_addr constant [4 x [2 x i32]] [[2 x i32] [i32 1, i32 2], [2 x i32] [i32 3, i32 4], [2 x i32] zeroinitializer, [2 x i32] [i32 7, i32 0]], align 16
@__const.main.c = private unnamed_addr constant [4 x [2 x i32]] [[2 x i32] [i32 1, i32 2], [2 x i32] [i32 3, i32 4], [2 x i32] [i32 5, i32 6], [2 x i32] [i32 7, i32 8]], align 16
@__const.main.f = private unnamed_addr constant [2 x [3 x [4 x i32]]] [[3 x [4 x i32]] zeroinitializer, [3 x [4 x i32]] [[4 x i32] [i32 1, i32 2, i32 3, i32 6], [4 x i32] [i32 7, i32 0, i32 0, i32 0], [4 x i32] [i32 8, i32 9, i32 10, i32 0]]], align 16

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [4 x [2 x i32]], align 16
  %3 = alloca i32, align 4
  %4 = alloca [4 x [2 x i32]], align 16
  %5 = alloca [4 x [2 x i32]], align 16
  %6 = alloca [4 x [2 x i32]], align 16
  %7 = alloca [4 x [2 x [1 x i32]]], align 16
  %8 = alloca [2 x [3 x [4 x i32]]], align 16
  store i32 0, i32* %1, align 4
  %9 = bitcast [4 x [2 x i32]]* %2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %9, i8* align 16 bitcast ([4 x [2 x i32]]* @__const.main.a to i8*), i64 32, i1 false)
  store i32 3, i32* %3, align 4
  %10 = bitcast [4 x [2 x i32]]* %4 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %10, i8 0, i64 32, i1 false)
  %11 = bitcast [4 x [2 x i32]]* %5 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %11, i8* align 16 bitcast ([4 x [2 x i32]]* @__const.main.c to i8*), i64 32, i1 false)
  %12 = getelementptr inbounds [4 x [2 x i32]], [4 x [2 x i32]]* %6, i64 0, i64 0
  %13 = getelementptr inbounds [2 x i32], [2 x i32]* %12, i64 0, i64 0
  store i32 1, i32* %13, align 4
  %14 = getelementptr inbounds i32, i32* %13, i64 1
  store i32 2, i32* %14, align 4
  %15 = getelementptr inbounds [2 x i32], [2 x i32]* %12, i64 1
  %16 = getelementptr inbounds [2 x i32], [2 x i32]* %15, i64 0, i64 0
  store i32 3, i32* %16, align 4
  %17 = getelementptr inbounds i32, i32* %16, i64 1
  %18 = getelementptr inbounds i32, i32* %16, i64 2
  br label %19

19:                                               ; preds = %19, %0
  %20 = phi i32* [ %17, %0 ], [ %21, %19 ]
  store i32 0, i32* %20, align 4
  %21 = getelementptr inbounds i32, i32* %20, i64 1
  %22 = icmp eq i32* %21, %18
  br i1 %22, label %23, label %19

23:                                               ; preds = %19
  %24 = getelementptr inbounds [2 x i32], [2 x i32]* %15, i64 1
  %25 = getelementptr inbounds [2 x i32], [2 x i32]* %24, i64 0, i64 0
  store i32 5, i32* %25, align 4
  %26 = getelementptr inbounds i32, i32* %25, i64 1
  %27 = getelementptr inbounds i32, i32* %25, i64 2
  br label %28

28:                                               ; preds = %28, %23
  %29 = phi i32* [ %26, %23 ], [ %30, %28 ]
  store i32 0, i32* %29, align 4
  %30 = getelementptr inbounds i32, i32* %29, i64 1
  %31 = icmp eq i32* %30, %27
  br i1 %31, label %32, label %28

32:                                               ; preds = %28
  %33 = getelementptr inbounds [2 x i32], [2 x i32]* %24, i64 1
  %34 = getelementptr inbounds [2 x i32], [2 x i32]* %33, i64 0, i64 0
  %35 = getelementptr inbounds [4 x [2 x i32]], [4 x [2 x i32]]* %2, i64 0, i64 3
  %36 = getelementptr inbounds [2 x i32], [2 x i32]* %35, i64 0, i64 0
  %37 = load i32, i32* %36, align 8
  store i32 %37, i32* %34, align 4
  %38 = getelementptr inbounds i32, i32* %34, i64 1
  store i32 8, i32* %38, align 4
  %39 = getelementptr inbounds [4 x [2 x [1 x i32]]], [4 x [2 x [1 x i32]]]* %7, i64 0, i64 0
  %40 = getelementptr inbounds [2 x [1 x i32]], [2 x [1 x i32]]* %39, i64 0, i64 0
  %41 = getelementptr inbounds [1 x i32], [1 x i32]* %40, i64 0, i64 0
  %42 = getelementptr inbounds [4 x [2 x i32]], [4 x [2 x i32]]* %6, i64 0, i64 2
  %43 = getelementptr inbounds [2 x i32], [2 x i32]* %42, i64 0, i64 1
  %44 = load i32, i32* %43, align 4
  store i32 %44, i32* %41, align 4
  %45 = getelementptr inbounds [1 x i32], [1 x i32]* %40, i64 1
  %46 = getelementptr inbounds [1 x i32], [1 x i32]* %45, i64 0, i64 0
  %47 = getelementptr inbounds [4 x [2 x i32]], [4 x [2 x i32]]* %5, i64 0, i64 2
  %48 = getelementptr inbounds [2 x i32], [2 x i32]* %47, i64 0, i64 1
  %49 = load i32, i32* %48, align 4
  store i32 %49, i32* %46, align 4
  %50 = getelementptr inbounds [2 x [1 x i32]], [2 x [1 x i32]]* %39, i64 1
  %51 = getelementptr inbounds [2 x [1 x i32]], [2 x [1 x i32]]* %50, i64 0, i64 0
  %52 = getelementptr inbounds [1 x i32], [1 x i32]* %51, i64 0, i64 0
  store i32 3, i32* %52, align 4
  %53 = getelementptr inbounds [1 x i32], [1 x i32]* %51, i64 1
  %54 = getelementptr inbounds [1 x i32], [1 x i32]* %53, i64 0, i64 0
  store i32 4, i32* %54, align 4
  %55 = getelementptr inbounds [2 x [1 x i32]], [2 x [1 x i32]]* %50, i64 1
  %56 = getelementptr inbounds [2 x [1 x i32]], [2 x [1 x i32]]* %55, i64 0, i64 0
  %57 = getelementptr inbounds [1 x i32], [1 x i32]* %56, i64 0, i64 0
  store i32 5, i32* %57, align 4
  %58 = getelementptr inbounds [1 x i32], [1 x i32]* %56, i64 1
  %59 = getelementptr inbounds [1 x i32], [1 x i32]* %58, i64 0, i64 0
  store i32 6, i32* %59, align 4
  %60 = getelementptr inbounds [2 x [1 x i32]], [2 x [1 x i32]]* %55, i64 1
  %61 = getelementptr inbounds [2 x [1 x i32]], [2 x [1 x i32]]* %60, i64 0, i64 0
  %62 = getelementptr inbounds [1 x i32], [1 x i32]* %61, i64 0, i64 0
  store i32 7, i32* %62, align 4
  %63 = getelementptr inbounds [1 x i32], [1 x i32]* %61, i64 1
  %64 = getelementptr inbounds [1 x i32], [1 x i32]* %63, i64 0, i64 0
  store i32 8, i32* %64, align 4
  %65 = bitcast [2 x [3 x [4 x i32]]]* %8 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %65, i8* align 16 bitcast ([2 x [3 x [4 x i32]]]* @__const.main.f to i8*), i64 96, i1 false)
  %66 = getelementptr inbounds [4 x [2 x [1 x i32]]], [4 x [2 x [1 x i32]]]* %7, i64 0, i64 3
  %67 = getelementptr inbounds [2 x [1 x i32]], [2 x [1 x i32]]* %66, i64 0, i64 1
  %68 = getelementptr inbounds [1 x i32], [1 x i32]* %67, i64 0, i64 0
  %69 = load i32, i32* %68, align 4
  %70 = getelementptr inbounds [4 x [2 x [1 x i32]]], [4 x [2 x [1 x i32]]]* %7, i64 0, i64 0
  %71 = getelementptr inbounds [2 x [1 x i32]], [2 x [1 x i32]]* %70, i64 0, i64 0
  %72 = getelementptr inbounds [1 x i32], [1 x i32]* %71, i64 0, i64 0
  %73 = load i32, i32* %72, align 16
  %74 = add nsw i32 %69, %73
  %75 = getelementptr inbounds [4 x [2 x [1 x i32]]], [4 x [2 x [1 x i32]]]* %7, i64 0, i64 0
  %76 = getelementptr inbounds [2 x [1 x i32]], [2 x [1 x i32]]* %75, i64 0, i64 1
  %77 = getelementptr inbounds [1 x i32], [1 x i32]* %76, i64 0, i64 0
  %78 = load i32, i32* %77, align 4
  %79 = add nsw i32 %74, %78
  %80 = getelementptr inbounds [4 x [2 x i32]], [4 x [2 x i32]]* %6, i64 0, i64 3
  %81 = getelementptr inbounds [2 x i32], [2 x i32]* %80, i64 0, i64 0
  %82 = load i32, i32* %81, align 8
  %83 = add nsw i32 %79, %82
  ret i32 %83
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #1

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0-4ubuntu1 "}
