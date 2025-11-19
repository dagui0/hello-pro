#!/usr/bin/yabasic

PRINT ""
PRINT "BASIC implementation of the Truth Machine"
PRINT "     (Using structured programming)"
PRINT ""
PRINT "The Truth Machine is a simple program for learning"
PRINT "a programing language that takes only two inputs."
PRINT ""
PRINT "* 1: Infinitely outputs \"1\". You can exit using <Ctrl-C>."
PRINT "* 0: Outputs \"0\" and terminates."
PRINT ""

WHILE TRUE
    INPUT "Enter 1 or 0: " val$

    IF val$ = "1" THEN
        WHILE TRUE
            PRINT "1"
        WEND
    ELSEIF val$ = "0" THEN
        PRINT "0"
        EXIT
    END IF
WEND
