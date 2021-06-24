#!/usr/bin/awk -f
NF==5{print "0x"$3": '"$5"',"}
