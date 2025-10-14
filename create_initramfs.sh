set -e
set -x

LDD_ROOT=/home/toastsandwich/ldd
INITRAMFS_DIR=$LDD_ROOT/initramfs
mkdir $INITRAMFS_DIR

mkdir -p $INITRAMFS_DIR/{bin,dev,etc,lib,lib64,mnt,proc,root,sbin,sys,tmp}
chmod 1777 $INITRAMFS_DIR/tmp

sudo cp -a /dev/{null, console, tty, ttyS0} $INITRAMFS_DIR/dev/

sudo busybox --install $INITRAMFS_DIR/bin
sudo busybox --install $INITRAMFS_DIR/sbin
