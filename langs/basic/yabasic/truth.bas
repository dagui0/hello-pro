#!/usr/bin/yabasic

10 PRINT ""
11 PRINT "BASIC implementation of the Truth Machine"
12 PRINT "  (Using old-fashioned spaghetti code)"
13 PRINT ""
14 PRINT "The Truth Machine is a simple program for learning"
15 PRINT "a programing language that takes only two inputs."
16 PRINT ""
17 PRINT "* 1: Infinitely outputs \"1\". You can exit using <Ctrl-C>."
18 PRINT "* 0: Outputs \"0\" and terminates."
19 PRINT ""

20 INPUT "Enter 1 or 0: " val$

21 IF val$ = "1" GOTO 30
22 IF val$ = "0" GOTO 40
23 GOTO 20

30 PRINT "1"
31 GOTO 30

40 PRINT "0"
