#include <stdio.h>


int main(void) {
	int c;
	int count = 0;

	while ((c = getchar()) != EOF) {
		count++;

	}

	printf("characters counted = %d\n", count);

}
