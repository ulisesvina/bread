main:
	mkdir -p out
	nasm ./src/bootloader.s -f bin -o ./out/boot.bin

copy:
	dd if=./out/boot.bin of=$(device) conv=notrunc bs=512 count=1

iso:
	dd if=/dev/zero of=./out/boot.iso bs=512 count=2880
	dd if=./out/boot.bin of=./out/boot.iso conv=notrunc bs=512 count=1

clean:
	rm -rf out