KERN_DIR := /home/toastsandwich/ldd/linux-6.18-rc1
obj-m := keyboard_mod.o

all:
	$(MAKE) LLVM=1 -C $(KERN_DIR) M=$(PWD) modules

command:
	$(MAKE) LLVM=1 -C $(KERN_DIR) M=$(PWD) compile_commands.json

clean:
	$(MAKE) LLVM=1 -C $(KERN_DIR) M=$(PWD) clean
