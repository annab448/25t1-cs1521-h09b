// Squares a number, unless its square is too big for a 32-bit integer.
// If it is too big, prints an error message instead.

#include <stdio.h>

#define SQUARE_MAX 46340

int main(void) {
    int x, y;

    printf("Enter a number: ");
    scanf("%d", &x);


	if (x <= SQUARE_MAX) goto square_x;
too_big:
    printf("square too big for 32 bits\n");

	goto end;
square_x:
    y = x * x;
    printf("%d\n", y);

end:
    return 0;
}
