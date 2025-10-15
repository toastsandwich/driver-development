obj-m += helloworld.o
KERNDIR := /home/toastsandwich/ldd/linux-6.18-rc1/
# KERNDIR := /lib/modules/6.12.51-1-lts/build
all:
	$(MAKE) LLVM=1 -C $(KERNDIR) M=$(PWD) modules

commands:
	$(MAKE) LLVM=1 -C $(KERNDIR) M=$(PWD) compile_commands.json

clean:
	$(MAKE) LLVM=1 -C $(KERNDIR) M=$(PWD) clean
