#include <stdio.h>

int sum(int n);

int main(int argc, char *argv[]) {
        int n;
        printf("Enter a number: ");
        scanf("%d", &n);

        int result = sum(n);
        printf("Sum of all numbers up to %d = %d\n", n, result);

        return 0;
}

int sum(int n) {
	if (n == 1) {
		printf("BASE CASE (n = 1)\n");
		return 1;
	}

	printf("called for n = %d\n", n);

	int answ = n + sum(n-1);
	printf("returning n = %d\n", n);
	return answ;
	// return n + sum(n-1);
}
