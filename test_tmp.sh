# ./build.sh
rm /home/chui/桌面/compiler_fcl/test_out.txt 
cd /home/chui/桌面/compiler_fcl/test
rm test.right.s test.fcl.s test.fcl.target test.fcl.target
../compiler -ir -o test.fcl.s ./test.c >>/home/chui/桌面/compiler_fcl/test_out.txt
arm-linux-gnueabihf-gcc test.c -S -o test.right.s
arm-linux-gnueabihf-gcc -o test.right.target test.right.s -static ../sysy_lib/libsysy.a 
arm-linux-gnueabihf-gcc -o test.fcl.target test.fcl.s -static ../sysy_lib/libsysy.a 
echo -e "\nthe ans from arm-linux-gcc： \c" >>/home/chui/桌面/compiler_fcl/test_out.txt
echo -e "out:\t" >>/home/chui/桌面/compiler_fcl/test_out.txt
qemu-arm test.right.target    >>/home/chui/桌面/compiler_fcl/test_out.txt
RET_VALUE1=$?


echo -e "\nthe ans from fcl_parser： \c" >>/home/chui/桌面/compiler_fcl/test_out.txt
echo -e "out:\t" >>/home/chui/桌面/compiler_fcl/test_out.txt
qemu-arm test.fcl.target  >>/home/chui/桌面/compiler_fcl/test_out.txt
#<../test/func_test/75_max_flow.in
RET_VALUE2=$?
echo -e "\nreturn from arm-linux-gcc:\t\c" >>/home/chui/桌面/compiler_fcl/test_out.txt
echo $RET_VALUE1 >>/home/chui/桌面/compiler_fcl/test_out.txt
echo -e "return from fcl_parser:\t\t\c" >>/home/chui/桌面/compiler_fcl/test_out.txt
echo $RET_VALUE2 >>/home/chui/桌面/compiler_fcl/test_out.txt


