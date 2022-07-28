rm test_out.txt
cd test
arm-linux-gnueabihf-gcc -o test.fcl.target test.fcl.s -static ../sysy_lib/libsysy.a 
# qemu-arm -L /usr/arm-linux-gnueabihf/  test.fcl.target -static ../sysy_lib/libsysy.a >>../test_out.txt
qemu-arm -L /usr/arm-linux-gnueabihf/  test.fcl.target -static ../sysy_lib/libsysy.a <test.in >>../test_out.txt