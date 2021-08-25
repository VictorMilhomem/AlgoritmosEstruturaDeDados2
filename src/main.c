#include <stdio.h>
#include <stdlib.h>
#include "recursive.h"

int main(int argc, char argv[])
{
    int n[5] = {5, 4, 3, 2, 1};
    merge_sort(n, 0, 4);
    printf("elemento: %d\n", n[0]);
    return 0;
}