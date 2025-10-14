#include <linux/init.h>
#include <linux/module.h>

typedef struct {
	bool is_lock;
} lock_t;

static void lock(lock_t *l) {
	l->is_lock = true;
}

static void unlock(lock_t *l) {
	l->is_lock = false;
}

typedef struct {
	int len;
	uint *arr;	
} data_t;


static int hello_init(void) {
	printk(KERN_INFO "hello world\n");
	// data_t *d = (data_t *)malloc(sizeof(data_t *));
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
