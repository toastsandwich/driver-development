#include "linux/kern_levels.h"
#include <linux/errno.h>
#include <linux/init.h>
#include <linux/module.h>
#include <linux/moduleparam.h>
#include <linux/stat.h>

static char *name = "toastsandwich";
static int n = 1;

module_param(name, charp, S_IRUGO);
module_param(n, int, S_IRUGO);

static int hello_init(void) {
	printk(KERN_INFO "hello world\n");
	printk(KERN_INFO "%s\n", name);
	printk(KERN_INFO "%d\n", n);	
	return 0;
}

static void hello_exit(void) {
	printk(KERN_INFO "exit world\n");
}

module_init(hello_init);
module_exit(hello_exit);

MODULE_LICENSE("GPL");
MODULE_AUTHOR("toastsandwich");
MODULE_DESCRIPTION("simple hello world module");
