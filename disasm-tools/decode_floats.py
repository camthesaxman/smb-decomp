#!/usr/bin/env python

import sys
import re
import struct
import os

label = ''
section = ''
skipAll = False
doubleBytes = None

def prompt():
    while True:
        response = raw_input('[f]loat|[d]ouble|[s]kip|[q]uit? ')
        if response in ['f', 'd', 's', 'q']:
            return response
        print('invalid response "%s"' % response)

def decode_float(b):
    return struct.unpack('>f', b)[0]

def decode_double(b):
    return struct.unpack('>d', b)[0]

def u32_to_bytearray(val):
    b = [(val>>24)&0xFF, (val>>16)&0xFF, (val>>8)&0xFF, (val>>0)&0xFF]
    return bytearray(b)

def read_byte_directive(line):
    m = re.match(r'^\s*\.byte\s+([^,]+),\s*([^,]+),\s*([^,]+),\s*([^\s]+)', line)
    if m:
        g = m.groups()
        b = [int(g[0],0), int(g[1],0), int(g[2],0), int(g[3],0)]
        return bytearray(b)
    m = re.match(r'^\s*\.4byte\s+([^,]+)', line)
    if m:
        return u32_to_bytearray(int(m.groups()[0], 0))
    printf('can\'t parse "%s"' % line)
    assert(0)

# returns string of comma-separated hex bytes
def hex_bytes(data):
    return ', '.join('0x%02X' % n for n in data)

fout = open(sys.argv[1]+'.new', 'wt')
with open(sys.argv[1], 'rt') as f:
    for line in f.readlines():
        if skipAll:
            fout.write(line)
            continue
        m = re.match(r'^\.section\s+([.a-zA-Z0-9]+)', line)
        if m:
            section = m.groups()[0]
            #print('section %s' % section)
        if section == '.sdata2':
            m = re.match(r'^(\w+):', line)
            if m:
                label = m.groups()[0]
                #print('label %s' % label)
            m = re.match(r'\s*(\.byte|\.4byte)', line)
            if m:
                if doubleBytes:
                    doubleBytes += read_byte_directive(line)
                    val = decode_double(doubleBytes)
                    print('double val: %.15g' % val)
                    line = '\t.double %.15g  ;# %s\n' % (val, hex_bytes(doubleBytes))
                    doubleBytes = None
                else:
                    print('label %s: line: %s', label, line)
                    response = prompt()
                    if response == 'q':
                        skipAll = True
                    elif response == 'f':
                        b = read_byte_directive(line)
                        val = decode_float(b)
                        print('float val: %.15g' % val)
                        line = '\t.float %.15g  ;# %s\n' % (val, hex_bytes(b))
                    elif response == 'd':
                        doubleBytes = read_byte_directive(line)
                        continue
                    elif response == 'q':
                        skipAll = True
        fout.write(line)
fout.close()
os.rename(sys.argv[1]+'.new', sys.argv[1])
