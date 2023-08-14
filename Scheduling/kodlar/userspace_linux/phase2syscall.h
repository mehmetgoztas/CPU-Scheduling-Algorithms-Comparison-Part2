#include <linux/unistd.h>
#include <errno.h>
extern int errno;
_syscall1(int, phase2syscall, int, x);
