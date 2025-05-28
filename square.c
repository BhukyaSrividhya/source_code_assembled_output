#include <stdio.h>

// Inline function definition
 static inline int square(int x) {
    return x * x;
}

int main() {
    int num = 4;
    int result = square(num); // Inline function call

    printf("The square of %d is %d\n", num, result);
    return 0;
}