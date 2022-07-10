# ./build.sh
rm /home/chui/桌面/compiler_fcl/test_out.txt 
cd /home/chui/桌面/compiler_fcl/test
rm test.right.s test.fcl.s test.fcl.target test.fcl.target
../compiler -ir -o test.fcl.s ./test.c >>../test_out.txt
arm-linux-gnueabihf-gcc test.c -S -o test.right.s
arm-linux-gnueabihf-gcc -o test.right.target test.right.s -static ../sysy_lib/libsysy.a 
arm-linux-gnueabihf-gcc -o test.fcl.target test.fcl.s -static ../sysy_lib/libsysy.a 
echo -e "\nthe ans from arm-linux-gcc： \c" >>../test_out.txt
echo -e "out:\t" >>../test_out.txt
if [ -f test.in ];
    then
        qemu-arm -L /usr/arm-linux-gnueabihf/ test.right.target  -static ../sysy_lib/libsysy.a <test.in >>../test_out.txt
        RET_VALUE1=$?
    else
        qemu-arm -L /usr/arm-linux-gnueabihf/ test.right.target  -static ../sysy_lib/libsysy.a >>../test_out.txt
        RET_VALUE1=$?
    fi


echo -e "\nthe ans from fcl_parser： \c" >>../test_out.txt
echo -e "out:\t" >>../test_out.txt
if [ -f test.in ];
    then
        qemu-arm -L /usr/arm-linux-gnueabihf/ test.fcl.target <test.in >>../test_out.txt
        RET_VALUE2=$?
    else
        qemu-arm -L /usr/arm-linux-gnueabihf/ test.fcl.target >>../test_out.txt 
        RET_VALUE2=$?
    fi

#<../test/func_test/75_max_flow.in
echo -e "\nreturn from arm-linux-gcc:\t\c" >>../test_out.txt
echo $RET_VALUE1 >>../test_out.txt
echo -e "return from fcl_parser:\t\t\c" >>../test_out.txt
echo $RET_VALUE2 >>../test_out.txt


