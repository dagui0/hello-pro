#!/usr/bin/awk -f

BEGIN {
    print "\n" \
        "AWK implementation of the Truth Machine\n" \
        "\n" \
        "The Truth Machine is a simple program for learning\n" \
        "a programing language that takes only two inputs.\n" \
        "\n" \
        "* 1: Infinitely outputs \"1\". You can exit using <Ctrl-C>.\n" \
        "* 0: Outputs \"0\" and terminates.\n"

    printf "Enter 1 or 0: "
}
$1 ~ /^1$/ {
    while (1) {
        print "1"
    }
}
$1 ~ /^0$/ {
    print "0"
    exit
}
$1 !~ /^[01]$/ {
    printf "Enter 1 or 0: "
}
