#include <linux/init.h>
#include <linux/module.h>

static int __init init_func(void) {
  
  return 0;
}

static void __exit exit_func(void) {
  
}

module_init(init_func);
module_exit(exit_func);

MODULE_AUTHOR("toastsandwich");
MODULE_LICENSE("DUAL BSD/GPL");
