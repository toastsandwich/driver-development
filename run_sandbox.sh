KERN_DIR=/home/toastsandwich/ldd/linux-6.18-rc1

qemu-system-x86_64 \
     -kernel $KERN_DIR/arch/x86_64/boot/bzImage \
     -initrd ./initramfs.cpio.gz \
     -append 'console=ttyS0' \
     -nographic
