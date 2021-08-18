#include <stdio.h>
#include <stdlib.h>
#include "recursive.h"

int main(int argc, char argv[])
{
    int n[5] = {1, 2, 3, 4, 5};
    int test = binary_search(n, 0, 4, 2);
    printf("posição: %d\n", test);
    return 0;
}