#include <stdlib.h>
#include <stdio.h>
#include <string.h>

int main() {
    int input[] = {16, 1, 0, 18, 12, 14, 19};
    int* numbers = malloc(30000000 * sizeof(int));
    int last, c, n, ix;

    memset(numbers, 0, 30000000 * sizeof(int));

    for (ix = 0; ix < 7; ix++) {
        c++;
        last = input[ix];
        numbers[last] = c;
    }

    for (; c < 30000000; c++) {
        int p = numbers[last];
        numbers[last] = c;
        last = p == 0 ? 0 : c - p;
    }

    printf("%d\n", last);
    free(numbers);
}

