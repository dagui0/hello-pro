#!/usr/bin/yabasic

PRINT ""
PRINT "BASIC implementation of the Truth Machine"
PRINT "  (Using old-fashioned spaghetti code)"
PRINT ""
PRINT "The Truth Machine is a simple program for learning"
PRINT "a programing language that takes only two inputs."
PRINT ""
PRINT "* 1: Infinitely outputs \"1\". You can exit using <Ctrl-C>."
PRINT "* 0: Outputs \"0\" and terminates."
PRINT ""

LABEL INPUT_VAL 
INPUT "Enter 1 or 0: " val$

IF val$ = "1" GOTO ON_INPUT_1
IF val$ = "0" GOTO ON_INPUT_0
GOTO INPUT_VAL

LABEL ON_INPUT_1
PRINT "1"
GOTO ON_INPUT_1

LABEL ON_INPUT_0
PRINT "0"
