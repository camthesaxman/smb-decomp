#!/usr/bin/python

from capstone import *
from capstone.ppc import *
import sys

# addr -> name
# TODO: read these from main elf file
labels = {
0x8002fc80: 'g_debug_set_cursor_pos',
0x800301ac: 'g_debug_printf',
0x800c3ca0: 'OSPanic',
0x80104208: 'puts',
0x80104dec: 'printf',
0x800c3880: 'OSGetStackPointer',
0x802f1b8c: 'gameSubmodeRequest',
0x80093A84: 'func_80093A84'
}

# fileOffset -> {addr, type}
relocations = {}

# index -> {offset, flags, length, is_bss, name}
sectionInfo = []

R_PPC_NONE        = 0
R_PPC_ADDR32      = 1
R_PPC_ADDR24      = 2
R_PPC_ADDR16_LO   = 4
R_PPC_ADDR16_HA   = 6
R_PPC_REL24       = 10
R_DOLPHIN_SECTION = 202
R_DOLPHIN_END     = 203

relocationTypeNames = {
    R_PPC_NONE:        'R_PPC_NONE',
    R_PPC_ADDR32:      'R_PPC_ADDR32',
    R_PPC_ADDR24:      'R_PPC_ADDR24',
    R_PPC_ADDR16_LO:   'R_PPC_ADDR16_LO',
    R_PPC_ADDR16_HA:   'R_PPC_ADDR16_HA',
    R_PPC_REL24:       'R_PPC_REL24',
    R_DOLPHIN_SECTION: 'R_DOLPHIN_SECTION',
    R_DOLPHIN_END:     'R_DOLPHIN_END'
}

def read_u8(offset):
    return filecontent[offset]

def read_u16(offset):
    return (filecontent[offset + 0] << 8) | filecontent[offset + 1]

def read_u32(offset):
    return (filecontent[offset + 0] << 24) | (filecontent[offset + 1] << 16) | (filecontent[offset + 2] << 8) | filecontent[offset + 3]

with open(sys.argv[1], 'rb') as file:
    filecontent = bytearray(file.read())

id = read_u32(0)
print("id: %i" % id)

numSections = read_u32(0x0C)
sectionInfoOffset = read_u32(0x10)
nameOffset = read_u32(0x14)
nameSize = read_u32(0x18)
bssSize = read_u32(0x20)
relOffset = read_u32(0x24)
impOffset = read_u32(0x28)
impSize = read_u32(0x2C)
prologSection = read_u8(0x30)
epilogSection = read_u8(0x31)
prolog = read_u32(0x34)
epilog = read_u32(0x38)

print("nameoffset: 0x%X" % nameOffset)

print("%i sections:" % numSections)
# Read sections
for i in range(0, numSections):
    o = sectionInfoOffset + i * 8
    section = {
        'offset': read_u32(o + 0) & ~3,
        'flags': read_u32(o + 0) & 3,
        'length': read_u32(o + 4)
    }
    if section['offset'] == 0 and section['length'] > 0:
        section['is_bss'] = True
    else:
        section['is_bss'] = False
    # Hack: if bss, then set file offset to something unique as to not
    # clash with other symbols
    if section['is_bss']:
        section['offset'] = len(filecontent)
    # Determine name
    if section['is_bss']:
        section['name'] = '.bss%i' % i
    elif section['flags'] & 1:
        section['name'] = '.text%i' % i
    else:
        section['name'] = '.data%i' % i
    sectionInfo.append(section)
    print("offset: 0x%08X\tlength: 0x%08X\tflags: %i" %
        (section['offset'], section['length'], section['flags']))

# Add labels for prologue and epilogue
if prologSection != 0:
    labels[sectionInfo[prologSection]['offset'] + prolog] = 'prologue'
if epilogSection != 0:
    labels[sectionInfo[epilogSection]['offset'] + epilog] = 'epilogue'

def read_relocation_info(module, o):
    currSection = None
    while True:
        offset = read_u16(o + 0)
        type = read_u8(o + 2)
        section = read_u8(o + 3)
        addend = read_u32(o + 4)

        # Get address of symbol and add label
        symAddr = 0
        if type == R_DOLPHIN_SECTION:  # R_DOLPHIN_SECTION
            currSection = sectionInfo[section]
            relocOffset = currSection['offset']
        if type < 200:
            if module == 0:  # dol
                symAddr = addend
                if symAddr not in labels:
                    labels[symAddr] = 'dol_%08X' % symAddr  # TODO: look it up in map file
            else:  # rel
                symAddr = sectionInfo[section]['offset'] + addend
                labels[symAddr] = 'lbl_%08X' % symAddr

        # Get file offset for relocation
        relocOffset += offset

        if type < 200:
            reloc = {
                'addr': symAddr,
                'type': type,
            }
            relocations[relocOffset] = reloc

        print(" offset: 0x%04X\ttype: %s\tsection: %i\tsym_addr: 0x%08X" % (relocOffset, relocationTypeNames[type], section, symAddr))
        if type == R_DOLPHIN_END:
            break
        o += 8

numImpEntries = impSize / 8
print("%i imports" % numImpEntries)
for i in range(0, numImpEntries):
    o = impOffset + i * 8
    module = read_u32(o + 0)
    relocation = read_u32(o + 4)
    print("module: %i, offset: 0x%08X" % (module, relocation))
    read_relocation_info(module, relocation)


cs = Cs(CS_ARCH_PPC, CS_MODE_32 | CS_MODE_BIG_ENDIAN)
cs.detail = True
cs.imm_unsigned = False


def get_relocation_for_code_offset(o):
    for i in range(o, o + 4):
        if i in relocations:
            return relocations[i]
    return None


def get_label(addr):
    if addr in labels:
        return labels[addr]
    return '0x%08X' % addr

def print_label(label):
    print('\n%s:' % label)


def disassemble_insn(o, reloc):
    insn = next(cs.disasm(filecontent[o : o+4], o))
    if reloc:
        relocType = reloc['type']
    else:
        relocType = -1

    if insn.id == PPC_INS_BL and relocType == R_PPC_REL24:
        return '%s %s' % (insn.mnemonic, get_label(reloc['addr']))
    if insn.id == PPC_INS_LIS and relocType == R_PPC_ADDR16_HA:
        return '%s %s, %s@ha' % (insn.mnemonic, insn.reg_name(insn.operands[0].reg), get_label(reloc['addr']))
    if insn.id == PPC_INS_ADDI and relocType == R_PPC_ADDR16_LO:
        return '%s %s, %s, %s@l' % (insn.mnemonic, insn.reg_name(insn.operands[0].reg), insn.reg_name(insn.operands[0].reg), get_label(reloc['addr']))
    if insn.id in {PPC_INS_LWZ, PPC_INS_LHZ, PPC_INS_LBZ, PPC_INS_LHA, PPC_INS_STW, PPC_INS_STH, PPC_INS_STB} \
     and relocType == R_PPC_ADDR16_LO:
        return '%s %s, %s@l(%s)' % (insn.mnemonic, insn.reg_name(insn.operands[0].reg), get_label(reloc['addr']), insn.reg_name(insn.operands[1].mem.base))
    if reloc:
        relocComment = '\t;# %s:%s' % (get_label(reloc['addr']), relocationTypeNames[reloc['type']])
    else:
        relocComment = ''
    return '%s %s%s' % (insn.mnemonic, insn.op_str, relocComment)


def dump_code(o, size):
    end = o + size
    code = filecontent[o : end]
    while o < end:
        if o in labels:
            print_label(labels[o])
        asm = disassemble_insn(o, get_relocation_for_code_offset(o))
        print('/* %08X %08X */ %s' % (o, read_u32(o), asm))
        o += 4
    if o < end:
        print('incomplete')

# returns True if value is 4-byte aligned
def is_aligned(num):
    return num % 4 == 0

def align(num):
    return (num + 3) & ~3

def is_ascii(code):
    if code >= 0x20 and code <= 0x7E:  # normal characters
        return True
    if code in [0x09, 0x0A]:  # tab, newline
        return True
    return False

# returns True if all elements are zero
def is_all_zero(arr):
    for val in arr:
        if val != 0:
            return False
    return True

# reads a string starting at pos
def read_string(data, pos):
    text = ''
    while pos < len(data) and is_ascii(data[pos]):
        text += chr(data[pos])
        pos += 1
    if pos < len(data) and data[pos] == 0:
        return text
    return ''

# escapes special characters in the string for use in a C string literal
def escape_string(text):
    return text.replace('\\','\\\\').replace('"','\\"').replace('\n','\\n').replace('\t','\\t')

def output_data_range(o, end):
    print('    # 0x%X' % o)
    if not is_aligned(o):
        # TODO:
        print('unaligned')
        o = align(o)
    while o < (end & ~3):
        # Try to see if this is a string.
        string = read_string(filecontent, o)
        if len(string) >= 4:
            strEnd = o + len(string)
            if is_aligned(strEnd) or is_all_zero(filecontent[strEnd:align(strEnd)-strEnd]):
                print('    .asciz \"%s"' % escape_string(string))
                print('    .balign 4')
                o = align(strEnd)
                continue
        # Not a string
        print('    .4byte 0x%08X' % read_u32(o))
        o += 4
    while o < end:
        # TODO:
        print('unaligned')
    return


def dump_data(o, size):
    end = o + size
    lastPos = o
    while o < end:
        if o in labels:
            if o - lastPos > 0:
                output_data_range(lastPos, o)
            print_label(labels[o])
            lastPos = o
        o += 1
    if o - lastPos > 0:
        output_data_range(lastPos, o)
    return


def output_bss_range(start, end):
    print('    .skip 0x%X' % (end - start))

def dump_bss(o, size):
    end = o + size
    lastPos = o
    while o < end:
        if o in labels:
            if o - lastPos > 0:
                output_bss_range(lastPos, o)
            print_label(labels[o])
            lastPos = o
        o += 1
    if o - lastPos > 0:
        output_bss_range(lastPos, o)
    return


for i in range(0, numSections):
    section = sectionInfo[i]
    if section['offset'] == 0 and section['length'] == 0:
        continue
    print('.section %s' % section['name'])
    if section['is_bss']:
        # bss section
        dump_bss(section['offset'], section['length'])
    elif section['flags'] & 1:
        # code section
        dump_code(section['offset'], section['length'])
    elif section['offset'] != 0:
        # data section
        dump_data(section['offset'], section['length'])
    print('')
    
