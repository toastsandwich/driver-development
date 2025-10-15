#include "asm/ptrace.h"
#include <linux/init.h>
#include <linux/module.h>
#include <linux/sched.h>

struct something {
  int value;
  int err;
};

union val_ok {
  int ok;
  struct something *smtg;
};

static int __init info_init(void) {
  printk(KERN_INFO "this process is \"%s\" (pid: %d)", current->comm, current->pid);

  struct something *smtg = {};
  smtg->err = 0;
  smtg->value = 1;

  union val_ok vo;
  vo.smtg = smtg;
  
  return 0; 
}

static void __exit info_exit(void) {
  printk(KERN_INFO "exiting info module");  
}

module_init(info_init);
module_exit(info_exit);

MODULE_LICENSE("GPL");
MODULE_DESCRIPTION("This module tells process name and its pid");
