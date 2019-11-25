/* print a triangle of A’s */
#include <stdio.h>
int main ()
{
    int i, j;
    for (i = 0; i < 10; i++) {
        printf ("\n");
        for (j = 0; j < i+1; j++ )
            printf ( "A");
    }
    printf("\n");
    return 0; 
}