#include <stdio.h>

// Function definition
int add(int a, int b) {
    return a + b;
}

int main() {
    int x = 3, y = 7;
    int result = add(x, y); // Function call

    printf("Result: %d\n", result);
    return 0;
}