#!/usr/bin/env python

import sys
import os

filecontent = bytearray()

def read_u32(pos):
    return (filecontent[pos]<<24) | (filecontent[pos+1]<<16) | (filecontent[pos+2]<<8) | (filecontent[pos+3])

def is_ascii(code):
    if code >= 0x20 and code <= 0x7E:  # normal characters
        return True
    if code in [0x09, 0x0A]:  # tab, newline
        return True
    return False

def read_string(pos):
    text = ''
    while pos < len(filecontent) and is_ascii(filecontent[pos]):
        text += chr(filecontent[pos])
        pos += 1
    if pos < len(filecontent) and filecontent[pos] == 0:
        return text
    return ''

with open(sys.argv[1], 'rb') as f:
    f.seek(0, os.SEEK_SET)
    filecontent = bytearray(f.read())

print('/* Model IDs for %s */' % sys.argv[1])
print('enum\n{')

i = 0
while True:
    modelOffset = read_u32(4 + i * 4)
    if modelOffset == 0:
        break
    headerOffset = modelOffset - 8
    nameOffset = read_u32(headerOffset) + 4
    #print('modelOffset = 0x%X' % modelOffset)
    #print('name = %s' % read_string(nameOffset))
    print('    /*0x%04X*/ %s,' % (i, read_string(nameOffset)))
    i += 1

print('};')

exit(0)
