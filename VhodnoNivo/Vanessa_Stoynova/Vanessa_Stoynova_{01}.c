#include<stdio.h>

int main () {
	int x, y, counter = 1;
	while(counter) {	
		scanf("%d %d", &x, &y);
		if(x < y) {
			counter = 0;
			break;
		}else{
			printf("Not valid x and y,\nPlease enter again\n");
		}
	}
	int sum = 0;
	for(counter = x ; counter <= y ; counter ++) {
		 if(counter % 2 != 0 ) {
		 	sum += counter;
		 }
	}
	printf("%d\n", sum);	
	return 0;
}	
