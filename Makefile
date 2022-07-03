main:
	mkdir -p out
	nasm ./src/bootloader.asm -f bin -o ./out/bootloader.bin
	nasm "./src/kernel_entry.asm" -f elf -o ./out/kernel_entry.o
	gcc -fno-pic -m32 -c -o ./out/kernel.o ./src/kernel.c
	ld -fno-pie -shared -m elf_i386 -o ./out/kernel.bin ./out/kernel_entry.o ./out/kernel.o --oformat binary
	cat ./out/bootloader.bin ./out/kernel.bin > ./out/bread.img
copy:
	make iso
	dd if=./out/bread_os.iso of=$(device)

iso:
	dd if=/dev/zero of=./out/bread_os.iso bs=512 count=2880
	dd if=./out/bread_os.bin of=./out/boot.iso conv=notrunc bs=512 seek=1 count=128

clean:
	rm -rf out