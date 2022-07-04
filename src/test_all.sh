make
rm test_out.txt
i=0
for file in ../test/func_test/*.c
do
echo -e $i "$file:" >>test_out.txt
echo -e $i ":\n"
rm  ../test/fcl_arm_out/test.fcl.s ../test/out/test.fcl.out  
./fcl_parser  $file   2>>test_out.txt  >>test_out.txt

arm-linux-gcc  -march=armv7-a -mtune=cortex-a9 -mxgot -static ../sysy_lib/lib.a ../test/fcl_arm_out/test.fcl.s -o ../test/out/test.fcl.out  


echo -e "\nthe ans from fcl_parser：" >>test_out.txt
case $i in
    38) qemu-arm ../test/out/test.fcl.out<${file/.c/.in} >>test_out.txt 2>>test_out.txt
    ;;
    43) qemu-arm ../test/out/test.fcl.out<${file/.c/.in} >>test_out.txt 2>>test_out.txt
    ;;
    50) qemu-arm ../test/out/test.fcl.out<${file/.c/.in} >>test_out.txt 2>>test_out.txt
    ;;
    61) qemu-arm ../test/out/test.fcl.out<${file/.c/.in} >>test_out.txt 2>>test_out.txt
    ;;
    62) qemu-arm ../test/out/test.fcl.out<${file/.c/.in} >>test_out.txt 2>>test_out.txt
    ;;
    64) qemu-arm ../test/out/test.fcl.out<${file/.c/.in} >>test_out.txt 2>>test_out.txt
    ;;
    65) qemu-arm ../test/out/test.fcl.out<${file/.c/.in} >>test_out.txt 2>>test_out.txt
    ;;    
    67) qemu-arm ../test/out/test.fcl.out<${file/.c/.in} >>test_out.txt 2>>test_out.txt
    ;;
    68) qemu-arm ../test/out/test.fcl.out<${file/.c/.in} >>test_out.txt 2>>test_out.txt
    ;;
    69) qemu-arm ../test/out/test.fcl.out<${file/.c/.in} >>test_out.txt 2>>test_out.txt
    ;;
    70) qemu-arm ../test/out/test.fcl.out<${file/.c/.in} >>test_out.txt 2>>test_out.txt
    ;;
    71) qemu-arm ../test/out/test.fcl.out<${file/.c/.in} >>test_out.txt 2>>test_out.txt
    ;;
    72) qemu-arm ../test/out/test.fcl.out<${file/.c/.in} >>test_out.txt 2>>test_out.txt
    ;;
    73) qemu-arm ../test/out/test.fcl.out<${file/.c/.in} >>test_out.txt 2>>test_out.txt
    ;;
    74) qemu-arm ../test/out/test.fcl.out<${file/.c/.in} >>test_out.txt 2>>test_out.txt
    ;;
    75) qemu-arm ../test/out/test.fcl.out<${file/.c/.in} >>test_out.txt 2>>test_out.txt
    ;;
    76) qemu-arm ../test/out/test.fcl.out<${file/.c/.in} >>test_out.txt 2>>test_out.txt
    ;;
    81) qemu-arm ../test/out/test.fcl.out<${file/.c/.in} >>test_out.txt 2>>test_out.txt
    ;;
    87) qemu-arm ../test/out/test.fcl.out<${file/.c/.in} >>test_out.txt 2>>test_out.txt
    ;;
    91) qemu-arm ../test/out/test.fcl.out<${file/.c/.in} >>test_out.txt 2>>test_out.txt
    ;;
    92) qemu-arm ../test/out/test.fcl.out<${file/.c/.in} >>test_out.txt 2>>test_out.txt
    ;;
    93) qemu-arm ../test/out/test.fcl.out<${file/.c/.in} >>test_out.txt 2>>test_out.txt
    ;;
    94) qemu-arm ../test/out/test.fcl.out<${file/.c/.in} >>test_out.txt 2>>test_out.txt
    ;;
    *) qemu-arm ../test/out/test.fcl.out >>test_out.txt 2>>test_out.txt
esac

RET_VALUE2=$?
echo -e "\n"$RET_VALUE2 >>test_out.txt
echo -e "the right out :" >>test_out.txt
cat ${file/.c/.out} >>test_out.txt
echo -e "\n" >>test_out.txt
   i=`expr $i + 1`;
done