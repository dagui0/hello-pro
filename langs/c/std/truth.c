#include <stdio.h>
#include <stdlib.h>
#include <errno.h>

#define TRUE (1)

/*
 * prototype declarations
 */

int run_truth_machine(int);

/*
 * main function
 */
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

        if (run_truth_machine((int)val) == 0) {
            break;
        }
    } while (TRUE);

    return 0;
}

/*
 * function implementations
 */

static void exec_true_action(void) {
    while (TRUE)
        printf("1\n");
}

static void exec_false_action(void) {
    printf("0\n");
}

int run_truth_machine(int input) {
    if (input == 1) {
        exec_true_action();
        return 0;
    }
    else if (input == 0) {
        exec_false_action();
        return 0;
    }
    return -1;
}
