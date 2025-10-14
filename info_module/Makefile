KERN_DIR := /home/toastsandwich/ldd/linux-6.18-rc1
# KERN_DIR := /lib/modules/6.12.51-1-lts/build
obj-m += info_mod.o
all:
	@ $(MAKE) LLVM=1 -C $(KERN_DIR) M=$(PWD) modules

command:
	@ $(MAKE) LLVM=1 -C $(KERN_DIR) M=$(PWD) compile_commands.json

clean:
	@ $(MAKE) LLVM=1 -C $(KERN_DIR) M=$(PWD) clean
