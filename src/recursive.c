#include <stdio.h>
#include <stdlib.h>

/*
* Recursive Algorithms implementation
*/


/*
* Function : odd (int n)
* assumes n >= 1
* returns the n-th odd natural number
*/
int odd(int n)
{
    if (n >= 1)
    {
        if (n == 1)
            return 1;
        else
            return odd(n-1) + 2;
    }
    else
        return -1;
}


/*
* Function : pow (int b, int n)
* assumes n >= 0, b !=0
* returns b^n
*/
int power(int b, int n)
{
    int t;
    if ((b != 0 && n >= 0) || (b == 0 && n > 0))
    {

        if (n == 0)
            return 1;
        else
        {
            if (n % 2 == 0)
            {
                t = power(b, n/2);
                return t * t;
            }
            else
            {
                t = power(b, (n-1)/2);
                return t * t * b; 
            }
        }

    }
    else
        return -1;
}


/*
* Function : bin (int n, int k)
* assumes n >= k >= 0, n >=0
* returns the binomial(n, k)
*/
int bin(int n, int k)
{
    if (n >= 0 && n >= k && k >= 0)
    {

        if (k == 0)
            return 1;
        else
            return bin(n, k-1) * (n-k+1) / k;
        
    }
    else
        return -1;
}


/*
* Function : div (int n, int k)
* assumes 0 <= k <= n
* returns the numbers of divisors of n, lower or equal to k
*/
int division(int n, int k)
{
    if (k >= 0 && k <= n)
    {

        if (k == 0)
            return 0;
        else
        {
            if (n % k == 0)
                return division(n, k-1) + 1;
            else
                return division(n, k-1);
        }
        
    }
    else
        return -1;
}


/*
* Function : hanoi (int n, char origin, char aux, char destine)
* assumes n >= 0
* prints the movements of the discs to solve the problem of the hanoi tower to a certain n (number of disks)  
* return void
*/
void hanoi(int n, char origin, char aux, char destine)
{
    if (n > 0)
    {
        hanoi(n-1, origin, aux, destine);
        printf("%c -> %c\n", origin, destine);
        hanoi(n-1, aux, destine, origin);
    }
}


/*
* Function : binary_search(int *vector, int start, int end, int value)
* assumes that the vector is sorted, end-start+1 >= 0
* return the index K , K > 0 if vector[K] = value, or -1 if value ∉ vector[start...end]
*/
int binary_search(int *vector, int start, int end, int value)
{
    if(end - start + 1 == 0)
        return -1;
    else
    {
        int m = (int)(start+end)/2;
        if ( *(vector+m) == value)
            return m;
        else if( *(vector+m) > value)
            return binary_search(vector, start, m-1, value);
        else
            return binary_search(vector, m+1, end, value);
    }
}


/*
* Function : partition(int *vector, int start, int end)
* return the pivot for quicksort function
*/

int partition(int *vector, int low, int high)
{
    int pivot; int i;
    pivot = *(vector+high); i = low-1;
    for(int j = low; j <= high-1; j++)
    {
        if(*(vector+j) < pivot)
        {
            i += 1;
            int aux = *(vector+i);
            *(vector+i) = *(vector+j);
            *(vector+j) = aux;
        }
    }
    if (pivot < *(vector+i+1))
    {
        int aux = *(vector+i+1);
        *(vector+i+1) = *(vector+high);
        *(vector+high) = aux;   
    }
    return i+1;

}


/*
* Function : quicksort(int *vector, int start, int end)
* sort an array of integers
* return void
*/

void quicksort(int *vector, int start, int end)
{
    int p;
    if (start < end)
    {
        p = partition(vector, start, end);
        quicksort(vector, start, p-1);
        quicksort(vector, p+1, end);
    }
}



/*
* Function : count_number_two(int *vector, int n)
* assumes n >= 0
* return quantity of the digit 2 in a vector of integer
*/
int count_digit_two(int *vector, int n)
{
    int count; int temp; int aux;
    if(n >= 0)
    {
        if(n == 0)
            return 0;
        else
        {
            temp = *(vector+n); count = 0;
            while(temp > 0)
            {
                aux = temp % 10; temp = (int) temp / 10;
                if(aux == 2)
                    count = count + 1;
            }
            
            return count_digit_two(vector, n-1) + count;
        }
    }
    else
        return -1;
}


/*
* Function : polynomial_validation(int *vector, int x, int n)
* assumes n >= 0
* return the sum of (anxN + aN-1 xN-1 + ... + a1 x + a0.)
*/
int polynomial_validation(int *vector, int x, int n)
{
    int temp; int aux;
    if(n >= 0)
    {
        if(n == 0)
            return *(vector+n);
        else
        {   
            return x * (*(vector+n)  + polynomial_validation(vector, x, n-1));
        }
    }
    else
        return -1;
}


/*
* Function : merge(int *vector, int start, int middle, int end)
* Ensures that vector[start..end] will be vector[i..middle] and vector[middle+1..end]
*/
void merge(int *vector, int start, int middle, int end)
{
    int first_position = start; int second_position = middle+1;
    int *aux_vector = malloc(sizeof(aux_vector) * (end - start + 1));
    for(int i = 0; i < end - start + 1; i++)
    {
        if(second_position > end || (first_position <= middle && *(vector+first_position) < *(vector+second_position)))
        {
            *(aux_vector+i) = *(vector+first_position);
            first_position += 1;
        }
        else
        {
            *(aux_vector+i) = *(vector+second_position);
            second_position += 1;
        }
    }

    for(int j = 0; j < end - start + 1; j++)
    {
        *(vector+j) = *(aux_vector+j);
    }
    free(aux_vector);
}



/*
* Function : merge_sort(int *vector, int start, int end)
* assumes that end-start+1 >= 0
* sort an array of integers
*/
void merge_sort(int *vector, int start, int end)
{
    if (end - start + 1 > 1)
    {
        int middle = (int) (start+end)/2;

        // sort for first part
        merge_sort(vector, start, middle);

        // sort for second part
        merge_sort(vector, middle+1, end);

        // merge both parts together
        merge(vector, start, middle, end);
    }
}
