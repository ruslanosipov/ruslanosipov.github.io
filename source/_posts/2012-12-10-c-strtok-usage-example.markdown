---
categories: [Programming]
date: 2012-12-10 18:36:05+00:00
tags: [c]
title: C strtok usage example
---

I had some issues with the `strtok` function. Here's a detailed explanation and usage for it.

The `strtok` function is used to tokenize a string and thus separates it into multiple strings divided by a delimiter.

    #include <stdio.h>
    #include <string.h>

    int main() {
        int j, i = 0;
        char delim[4];
        char user_input[81], *token[80];
        user_input[0] = 0;  // set first byte to 0 to detect empty string

        // validate the string length
        while (strlen(user_input) <= 1 || strlen(user_input) > 82) {
            printf("Feed me a string to tokenize: ");
            fgets(user_input, sizeof(user_input), stdin);
        }

        printf("And a delimiter (up to 4 chars): ");
        fgets(delim, sizeof(delim), stdin);

        token[0] = strtok(user_input, delim);  // first call returns pointer
                                               // to first part of user_input
                                               // separated by delim
        while (token[i] != NULL) {
            i++;
            token[i] = strtok(NULL, delim);  // every call with NULL uses
                                             // saved user_input value and
                                             // returns next substring
        }

        for (j=0; j<=i-1; j++) {
            printf("%sn", token[j]);
        }

        return 0;
    }

Let's compile and execute it:

    Feed me a string to tokenize: foo/bar/baz
    And a delimiter: /
    foo
    bar
    baz

The first call to `strtok` returns the pointer to the first substring. All the next calls with the first argument being `NULL` use the string passed at the first call and return the next substring. The function returns `NULL` if no more substrings are available.
