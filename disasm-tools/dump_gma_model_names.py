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

#print('size = %i' % len(filecontent))
numModels = read_u32(0)
modelEntriesOffset = 8
namesBase = modelEntriesOffset + numModels * 8

#print('num models: %i' % numModels)
print('/* Model IDs for %s */' % sys.argv[1])
print('enum\n{')

for i in range(0, numModels):
    modelOffset = read_u32(modelEntriesOffset + i * 8 + 0)
    nameOffset = read_u32(modelEntriesOffset + i * 8 + 4)
    #print('model %i' % i)
    #print('nameOffset: 0x%X' % nameOffset)
    #print('modelOffset: 0x%X' % modelOffset)
    #print('name: %s' % read_string(namesBase + nameOffset))
    if modelOffset == 0xFFFFFFFF:
        print('    /*0x%04X*/ _DUMMY_%i,' % (i, i))
    else:
        print('    /*0x%04X*/ %s,' % (i, read_string(namesBase + nameOffset)))

print('};')
