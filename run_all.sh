nasm -f elf p12EnASM.asm
gcc -m32 -c p12_enC.c 
gcc -m32 p12EnASM.o p12_enC.o -o p12
./p12
