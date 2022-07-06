make
rm ../test/arm_out/test.s ../test/fcl_arm_out/test.fcl.s ../test/out/test.out ../test/out/test.fcl.out ../test/fcl_out/test.fcl ../src/test_out.txt
./fcl_parser ../test/test_in/test.c >>test_out.txt
arm-linux-gcc  -march=armv7-a -mtune=cortex-a9 -static ../test/test_in/test.c -S -o ../test/arm_out/test.s
arm-linux-gcc  -march=armv7-a -mtune=cortex-a9 -mxgot -static ../sysy_lib/lib.a ../test/arm_out/test.s -o ../test/out/test.out
arm-linux-gcc  -march=armv7-a -mtune=cortex-a9 -mxgot  -static ../sysy_lib/lib.a ../test/fcl_arm_out/test.fcl.s -o ../test/out/test.fcl.out
echo -e "\nthe ans from arm-linux-gcc： \c"
echo -e "out:\t"
qemu-arm ../test/out/test.out  >>test_out.txt 
RET_VALUE1=$?


echo -e "\nthe ans from fcl_parser： \c"
echo -e "out:\t"
qemu-arm ../test/out/test.fcl.out  >>test_out.txt
#<../test/func_test/75_max_flow.in
RET_VALUE2=$?
echo -e "\nreturn from arm-linux-gcc:\t\c"
echo $RET_VALUE1
echo -e "return from fcl_parser:\t\t\c"
echo $RET_VALUE2
