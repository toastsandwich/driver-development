set -e
set -x

LDD_ROOT=/home/toastsandwich/ldd
INITRAMFS_DIR=$LDD_ROOT/sandbox
mkdir -p $INITRAMFS_DIR

mkdir -p $INITRAMFS_DIR/{bin,dev,etc,lib,lib64,mnt,proc,root,sbin,sys,tmp}
chmod 1777 $INITRAMFS_DIR/tmp

sudo cp -a /dev/{null,console,tty,ttyS0} $INITRAMFS_DIR/dev/

sudo busybox --install $INITRAMFS_DIR/bin
sudo busybox --install $INITRAMFS_DIR/sbin

sudo cat << EOF > $INITRAMFS_DIR/init
#!bin/busybox sh

# Mount /proc and /sys fs
mount -t proc none /proc
mount -t sysfs none /sys

# Boot things

# NIC up
ip link set eth0 up
ip addr add 10.0.2.15/24 dev eth0

ip link set wlan0 up
ip addr add 10.0.2.14/24 dev wlan0

ip link set lo up

# Wait for NIC
sleep 0.5

# create pts device node
mkdir dev/pts
mknod -m 666 dev/ptmx c 5 2
mount -t devpts devpts /dev/pts

# mount driver-dir to guest
mount -t nfs -o nolock host:/home/toastsandwich/ldd/driver-dir /mnt

# telnetd
telnetd -l /bin/sh

# Make the new shell as a login shell with -l option
# Only login shell read /etc/profile
echo "Welcome to your sandbox ...."
setsid sh -c 'exec sh -l </dev/ttyS0 >/dev/ttyS0 2>&1'
EOF

chmod +x $INITRAMFS_DIR/init

# name resolve
sudo cat << EOF > $INITRAMFS_DIR/etc/hosts
127.0.0.1    localhost
10.0.2.2     host
EOF

# common alias
sudo cat << EOF > $INITRAMFS_DIR/etc/profile
alias ll='ls -l'
EOF

# busybox saves password in /etc/passwd directly, no /etc/shadow is needed.
sudo cat << EOF > $INITRAMFS_DIR/etc/passwd
root:x:0:0:root:/root:/bin/bash
EOF

# group file
sudo cat << EOF > $INITRAMFS_DIR/etc/group
root:x:0:
EOF

# build initramfs image
cd $INITRAMFS_DIR
find . -print0 | cpio --null -ov --format=newc | gzip -9 > ../initramfs.cpio.gz
