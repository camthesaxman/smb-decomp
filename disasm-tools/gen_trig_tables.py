#!/usr/bin/env python

import math
import os
import struct

def trig_list(offset, count, func):
    with open('baserom.dol', 'rb') as f:
        for i in range(0, count):
            f.seek(offset + i * 4, os.SEEK_SET)
            b = bytearray(f.read(4))
            num = struct.unpack('>f', b)[0]
            if func:
                comment = '  // %s(0x%04X)' % (func, i)
            else:
                comment = ''
            valstr = '%.15g,' % num
            print('    %-21s%s' % (valstr, comment))

print('#include <math.h>\n#pragma force_active on\n')
print('#define inf INFINITY')
print('float sinTable[] ATTRIBUTE_ALIGN(32) =\n{')
trig_list(0x181920, 0x4001, 'sin')
print('};\n')
print('float tanTable[] ATTRIBUTE_ALIGN(32) =\n{')
trig_list(0x191940, 0x4001, 'tan')
print('};\n')
print('float unknownTrigTable[] ATTRIBUTE_ALIGN(32) =\n{')
trig_list(0x1A1960, 0x2000, None)
print('};')
