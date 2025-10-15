obj-m += helloworld.o
# KERNDIR := /home/toastsandwich/ldd/linux-6.18-rc1/
KERNDIR := /lib/modules/6.12.51-1-lts/build
all:
	make -C $(KERNDIR) M=$(PWD) modules

commands:
	make -C $(KERNDIR) M=$(PWD) compile_commands.json

clean:
	make -C $(KERNDIR) M=$(PWD) clean
