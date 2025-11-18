#include <stdio.h>
#include <stdlib.h>

int main(void) {
    int val = 0;
    printf("Enter 0 or 1: ");
    scanf("%d", &val);
    if (val == 1) {
        while (1)
            printf("1\n");
    }
    else if (val == 0) {
        printf("0\n");
    }
    else {
        fprintf(stderr, "Invalid value: %d: Please enter 0 or 1\n", val);
        exit(1);
    }

    return 0;
}
