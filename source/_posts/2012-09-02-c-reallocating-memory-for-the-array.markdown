---
categories: [Programming]
date: 2012-09-02 01:54:36+00:00
tags: [c]
title: C - Reallocating memory for the array
---

I just started delving into C and I had some issues with increasing the memory allocation size for my array. The best way to understand something - write a detailed explanation of the process. So here we go:

    #include <stdio.h>
    #include <stdlib.h>

    // notice that array is a pointer to a pointer
    int append_array_element(int **array, int *array_length, int element) {
        *array_length += 1;
        *array = realloc(*array, *array_length * sizeof(int));
        (*array)[*array_length - 1] = element; // [] has higher priority
                                               // then * in C's order of
        return 0;                              // operations
    }

We have a pointer to the pointer to the array, pointer to the array's length, and a value to append to the array. Array is passed as a pointer to pointer so we will be able to 'repoint' the original pointer to a new memory segment.

Let's call the function a few times and see what it gives us.

    int main() {
        int *array = NULL;
        int array_length = 0;

        append_array_element(&array, &array_length, 142);
        printf ("Our array with %d elementsn", array_length);
        printf("%dn", array[0]);

        append_array_element(&array, &array_length, 19);
        printf ("Our array with %d elementsn", array_length);
        printf("%dn", array[0]);
        printf("%dn", array[1]);

        return 0;
    }

And the output is:

    Our array with 1 elements
    142
    Our array with 2 elements
    142
    19

You can never be sure when you work with memory, so let's add some error handling in case the operation fails.

    int append_array_element(int **array, int *array_length, int element) {
        *array_length += 1;
        // realloc() returns pointer or False if it fails
        void *_tmp_array = realloc(*array, *array_length * sizeof(int));
        if (!_tmp_array) {
            printf("Error while trying to realloc memory!n");
            return -1;
        }
        *array = _tmp_array;
        (*array)[*array_length - 1] = element;

        return 0;
    }

Now we will be able to handle the crash on our own. But reallocation is not a very fast thing, so let's double the amount of reallocated memory every time we run out of allocated memory. We'll need one more variable to track the current allocated memory size.

    int append_array_element(int **array, int *array_length,
                             int *array_alloc_length, int element) {
        *array_length += 1;
        if (*array_length > *array_alloc_length) {
            if (*array_alloc_length == 0) {
                *array_alloc_length = 1;
            } else {
                *array_alloc_length *= 2;
            }

            void *_tmp_array = realloc(*array, *array_alloc_length * sizeof(int));
            if (!_tmp_array) {
                printf("Error while trying to reallocate memory for an array!n");
                return -1;
            }
            *array = _tmp_array;
        }
        (*array)[*array_length - 1] = element;

        return 0;
    }

Let's call it few times:

    int main() {
        int *array = NULL;
        int array_length = 0;
        int array_alloc_length = 0;

        int i;
        for (i = 0; i < 10; i++) {
            append_array_element(&array, &array_length, &array_alloc_length, i);
        }

        printf("Our array with %d elementsn", array_length);
        for (i = 0; i < 10; i++) {
            printf("%dn", array[i]);
        }
        printf("Array length: %d, allocated elements: %dn",
               array_length, array_alloc_length);

        return 0;
    }

    Our array with 10 elements
    0
    1
    2
    3
    4
    5
    6
    7
    8
    9
    Array length: 10, allocated elements: 16

And for the fun of it, let's do the same with 100 elements:

    Our array with 100 elements
    0
    1
    2
    ...
    97
    98
    99
    Array length: 100, allocated elements: 128

Let's improve the function a little bit more - and we are good to go. Let's say we have a dynamic array with 129 elements - but we will have allocated memory for 256 elements... It is 127 more then we need! We don't want to be greedy, so let's find a way to free up the memory.

    #include <stdio.h>
    #include <stdlib.h>
    #include <stdbool.h> // I included this just to use boolean values with
                         // neat true/false aliases

    int append_array_element(int **array, int *array_length,
                             int *array_alloc_length, int element,
                             bool is_last_element) {
        *array_length += 1;
        if (*array_length > *array_alloc_length || is_last_element) {
            if (is_last_element) {
                *array_alloc_length = *array_length;
            }
            else if (*array_alloc_length == 0) {
                *array_alloc_length = 1;
            } else {
                *array_alloc_length *= 2;
            }

            void *_tmp_array = realloc(*array, *array_alloc_length * sizeof(int));
            if (!_tmp_array) {
                printf("Error while trying to reallocate memory for an array!n");
                return -1;
            }
            *array = _tmp_array;
        }
        (*array)[*array_length - 1] = element;

        return 0;
    }

That should be pretty straight-forward. And let's call it two more times with 10 and 100 elements:

    int main() {
        int *array = NULL;
        int array_length = 0;
        int array_alloc_length = 0;
        bool is_last_element;

        int i;
        int i_max = 10;
        for (i = 0; i < i_max; i++) {
            if (i == i_max - 1)
            {
                is_last_element = true;
            } else {
                is_last_element = false;
            }
            append_array_element(&array, &array_length, &array_alloc_length,
                                 i, is_last_element);
        }

        printf("Our array with %d elementsn", array_length);
        for (i = 0; i < i_max; i++) {
            printf("%dn", array[i]);
        }
        printf("Array length: %d, allocated elements: %dn",
               array_length, array_alloc_length);

        return 0;
    }

And the results are:

    Our array with 10 elements
    0
    1
    2
    3
    4
    5
    6
    7
    8
    9
    Array length: 10, allocated elements: 10

    Our array with 100 elements
    0
    1
    2
    ...
    97
    98
    99
    Array length: 100, allocated elements: 100

Pretty neat, huh? Thank you for reading!
