#include <stdio.h>
#include <errno.h>
#define TRUE (1)

/*
 * This is truely old-fashion, instead of <errno.h>.
 * But this code is not compatible with mordern C library.
 */
/* extern int errno; */

main() {

    /* declaration must be at the beginning of the block */
    int buf_size, val;
    char *buf, *read, *stop;

    printf("\n"
      "C implementation of the Truth Machine\n"
      "\n"
      "The Truth Machine is a simple program for learning\n"
      "a programing language that takes only two inputs.\n"
      "\n"
      "* 1: Infinitely outputs \"1\". You can exit using <Ctrl-C>.\n"
      "* 0: Outputs \"0\" and terminates.\n\n");

    buf_size = 1024;
    buf = (char*)malloc(buf_size);

    loop:

    printf("Enter 1 or 0: ");

    read = fgets(buf, buf_size, stdin);
    if (read == 0)
        goto loop;

    errno = 0;
    stop = 0;
    val = (int)strtol(read, &stop, 10);
    if (errno != 0)
        goto loop;

    /* check wheater non-numeric */
    if (val == 0 && read == stop)
        goto loop;

    run_truth_machine(val);
    goto loop;
}

run_truth_machine(input)
int input;
{
    if (input == 1) {
        exec_true_action();
    }
    else if (input == 0) {
        exec_false_action();
    }
}

exec_true_action() {
    while (TRUE)
        printf("1\n");
}

exec_false_action() {
    printf("0\n");
    exit(0);
}
