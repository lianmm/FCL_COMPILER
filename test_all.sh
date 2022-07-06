cd ./src
make
cd ..
cp ./src/compiler compiler
rm test_out.txt ./f2022/*.fcl ./f2022/*.s 
i=0
for file in ./f2022/*.sy
do
echo -e $i "$file:" >>test_out.txt
echo -e $i ":\n"  
./compiler  $file   2>>test_out.txt  >>test_out.txt

arm-linux-gcc  -march=armv7-a -mtune=cortex-a9 -mxgot -static ./sysy_lib/lib.a ${file/.sy/.s} -o  ${file/.sy/.fcl}

echo -e "\nthe ans from fcl_parser：" >>test_out.txt
case $i in
    38) qemu-arm ${file/.sy/.fcl}<${file/.sy/.in} >>test_out.txt 2>>test_out.txt
    ;;
    43) qemu-arm ${file/.sy/.fcl}<${file/.sy/.in} >>test_out.txt 2>>test_out.txt
    ;;
    50) qemu-arm ${file/.sy/.fcl}<${file/.sy/.in} >>test_out.txt 2>>test_out.txt
    ;;
    61) qemu-arm ${file/.sy/.fcl}<${file/.sy/.in} >>test_out.txt 2>>test_out.txt
    ;;
    62) qemu-arm ${file/.sy/.fcl}<${file/.sy/.in} >>test_out.txt 2>>test_out.txt
    ;;
    64) qemu-arm ${file/.sy/.fcl}<${file/.sy/.in} >>test_out.txt 2>>test_out.txt
    ;;
    65) qemu-arm ${file/.sy/.fcl}<${file/.sy/.in} >>test_out.txt 2>>test_out.txt
    ;;    
    67) qemu-arm ${file/.sy/.fcl}<${file/.sy/.in} >>test_out.txt 2>>test_out.txt
    ;;
    68) qemu-arm ${file/.sy/.fcl}<${file/.sy/.in} >>test_out.txt 2>>test_out.txt
    ;;
    69) qemu-arm ${file/.sy/.fcl}<${file/.sy/.in} >>test_out.txt 2>>test_out.txt
    ;;
    70) qemu-arm ${file/.sy/.fcl}<${file/.sy/.in} >>test_out.txt 2>>test_out.txt
    ;;
    71) qemu-arm ${file/.sy/.fcl}<${file/.sy/.in} >>test_out.txt 2>>test_out.txt
    ;;
    72) qemu-arm ${file/.sy/.fcl}<${file/.sy/.in} >>test_out.txt 2>>test_out.txt
    ;;
    73) qemu-arm ${file/.sy/.fcl}<${file/.sy/.in} >>test_out.txt 2>>test_out.txt
    ;;
    74) qemu-arm ${file/.sy/.fcl}<${file/.sy/.in} >>test_out.txt 2>>test_out.txt
    ;;
    75) qemu-arm ${file/.sy/.fcl}<${file/.sy/.in} >>test_out.txt 2>>test_out.txt
    ;;
    76) qemu-arm ${file/.sy/.fcl}<${file/.sy/.in} >>test_out.txt 2>>test_out.txt
    ;;
    81) qemu-arm ${file/.sy/.fcl}<${file/.sy/.in} >>test_out.txt 2>>test_out.txt
    ;;
    87) qemu-arm ${file/.sy/.fcl}<${file/.sy/.in} >>test_out.txt 2>>test_out.txt
    ;;
    91) qemu-arm ${file/.sy/.fcl}<${file/.sy/.in} >>test_out.txt 2>>test_out.txt
    ;;
    92) qemu-arm ${file/.sy/.fcl}<${file/.sy/.in} >>test_out.txt 2>>test_out.txt
    ;;
    93) qemu-arm ${file/.sy/.fcl}<${file/.sy/.in} >>test_out.txt 2>>test_out.txt
    ;;
    94) qemu-arm ${file/.sy/.fcl}<${file/.sy/.in} >>test_out.txt 2>>test_out.txt
    ;;
    *) qemu-arm ${file/.sy/.fcl} >>test_out.txt 2>>test_out.txt
esac

RET_VALUE2=$?
echo -e "\n"$RET_VALUE2 >>test_out.txt
echo -e "the right out :" >>test_out.txt
cat ${file/.sy/.out} >>test_out.txt
echo -e "\n" >>test_out.txt
   i=`expr $i + 1`;
done