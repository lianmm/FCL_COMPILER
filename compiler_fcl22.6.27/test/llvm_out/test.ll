; ModuleID = 'test.c'
source_filename = "test.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@__const.main.e = private unnamed_addr constant [4 x [2 x [1 x i32]]] [[2 x [1 x i32]] [[1 x i32] [i32 1], [1 x i32] [i32 2]], [2 x [1 x i32]] [[1 x i32] [i32 3], [1 x i32] [i32 4]], [2 x [1 x i32]] [[1 x i32] [i32 5], [1 x i32] [i32 6]], [2 x [1 x i32]] [[1 x i32] [i32 7], [1 x i32] [i32 8]]], align 16

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [4 x [2 x [1 x i32]]], align 16
  %2 = alloca i32, align 4
  %3 = bitcast [4 x [2 x [1 x i32]]]* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %3, i8* align 16 bitcast ([4 x [2 x [1 x i32]]]* @__const.main.e to i8*), i64 32, i1 false)
  %4 = getelementptr inbounds [4 x [2 x [1 x i32]]], [4 x [2 x [1 x i32]]]* %1, i64 0, i64 3
  %5 = getelementptr inbounds [2 x [1 x i32]], [2 x [1 x i32]]* %4, i64 0, i64 1
  %6 = getelementptr inbounds [1 x i32], [1 x i32]* %5, i64 0, i64 0
  %7 = load i32, i32* %6, align 4
  store i32 %7, i32* %2, align 4
  ret i32 0
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #1

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0-4ubuntu1 "}
