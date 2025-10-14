#include <linux/init.h>
#include <linux/module.h>
#include <linux/sched.h>

static int info_init(void) {
  printk(KERN_INFO "this process is \"%s\" (pid: %d)", current->comm, current->pid);
  return 0; 
}

static void info_exit(void) {
  printk(KERN_INFO "exiting info module");  
}

module_init(info_init);
module_exit(info_exit);

MODULE_LICENSE("GPL");
MODULE_DESCRIPTION("This module tells process name and its pid");
