#include <stdio.h>

int arr[100];

int main() {
    int i = 0;
    int j = 0;
    int k = 0;
    int n;
    int temp;
    int gap;
    int idx;

    scanf("%d", &n);
    gap = n / 2;

    input_start:
        if (i >= n) goto input_end;
        scanf("%d", &arr[i]);
        i ++;
        goto input_start;
    input_end:

    gap_start:
        if (gap <= 0) goto gap_end;
        i = gap;

        i_start:
            if (i >= n) goto i_end;
            temp = arr[i];
            j = i;

            j_start:
                if (j < gap) goto j_end;
                idx = j;
                idx -= gap;
                if (arr[idx] <= temp) goto j_end;
                arr[j] = arr[idx];
                j -= gap;
                goto j_start;
            j_end:

            arr[j] = temp;
            i ++;
            goto i_start;
        i_end:

        gap /= 2;
        goto gap_start;
    gap_end:

    output_start:
        if (k >= n) goto output_end;
        printf("%d", arr[k]);
        k ++;
        goto output_start;
    output_end:

    return 0;
}