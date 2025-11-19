#include <stdio.h>
#include <stdlib.h>
#include <errno.h>

#define TRUE (1)

int main(void) {

    printf("\n"
      "C implementation of the Truth Machine\n"
      "\n"
      "The Truth Machine is a simple program for learning\n"
      "a programing language that takes only two inputs.\n"
      "\n"
      "* 1: Infinitely outputs \"1\". You can exit using <Ctrl-C>.\n"
      "* 0: Outputs \"0\" and terminates.\n\n");

    int buf_size = 1024;
    char *buf = (char*)malloc(buf_size);
    do {
        printf("Enter 1 or 0: ");

        char *read = fgets(buf, buf_size, stdin);
        if (read == NULL)
            continue;

        errno = 0;
        char *stop = NULL;
        long val = strtol(read, &stop, 10);
        if (errno != 0)
            continue;

        /* check wheater non-numeric */
        if (val == 0 && read == stop)
            continue;

        if (val == 1L) {
            while (TRUE)
                printf("1\n");
        }
        else if (val == 0L) {
            printf("0\n");
            break;
        }
    } while (TRUE);

    return 0;
}
