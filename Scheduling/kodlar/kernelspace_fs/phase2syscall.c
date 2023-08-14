#include <linux/phase2syscall.h>

int flag = 0;

asmlinkage int sys_phase2syscall(int x){
	if(x == 0){
		flag = x;
	}

	else if(x == 1){
		flag = x;	
	} 
	return flag;
}
