main:
	mkdir -p out
	nasm ./src/bootloader.s -f bin -o ./out/bootloader.bin
	make kernel
	nasm ./src/zerodb.s -f bin -o ./out/zerodb.bin
	cat "./out/bootloader.bin" "./out/full_kernel.bin" "./out/zerodb.bin" > "./out/bread_os.bin"
	rm "./out/bootloader.bin" "./out/full_kernel.bin" "./out/zerodb.bin"

kernel:
	nasm "./src/kernel_entry.s" -f elf -o "./out/kernel_entry.o"
	i686-elf-gcc -m32 -g -c "./src/kernel.c" -lm "./src/utils.c"
	mv "./kernel.o" "./out/kernel.o"
	mv "./utils.o" "./out/utils.o"
	i386-elf-ld -o "./out/full_kernel.bin" -Ttext 0x1000 "./out/kernel_entry.o" "./out/kernel.o" --oformat binary
	rm "./out/kernel_entry.o" "./out/kernel.o"

copy:
	make iso
	dd if=./out/bread_os.iso of=$(device)

iso:
	dd if=/dev/zero of=./out/bread_os.iso bs=512 count=2880
	dd if=./out/bread_os.bin of=./out/boot.iso conv=notrunc bs=512 seek=1 count=128

clean:
	rm -rf out