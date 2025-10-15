KERN_DIR=/home/toastsandwich/ldd/linux-6.18-rc1

qemu-system-x86_64 \
     -kernel $KERN_DIR/arch/x86_64/boot/bzImage \
     -initrd ./initramfs.cpio.gz \
     -append 'console=ttyS0' \
     -netdev user,id=host_net,hostfwd=tcp::7023-:23 \
     -device e1000,mac=94:e2:3c:d8:65:3a,netdev=host_net \
     -nographic
