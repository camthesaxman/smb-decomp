#!/usr/bin/env python3

#################################################################################
#                                 Description                                   #
#################################################################################
# calcprogress: Used to calculate the progress of the Super Monkey Ball decomp. #
# Prints to stdout for now, but eventually will have some form of storage,      #
# i.e. CSV, so that it can be used for a webpage display.                       #
#                                                                               #
# Usage: No arguments needed                                                    #
#################################################################################




###############################################
#                                             #
#                  Imports                    #
#                                             #
###############################################

import os
import sys
import struct
import re
import math

###############################################
#                                             #
#                 Constants                   #
#                                             #
###############################################

DOL_PATH = "baserom.dol"
MAP_PATH = "supermonkeyball.map"

MEM1_HI = 0x81200000
MEM1_LO = 0x80004000

MW_WII_SYMBOL_REGEX = r"^\s*"\
r"(?P<SectOfs>\w{8})\s+"\
r"(?P<Size>\w{6})\s+"\
r"(?P<VirtOfs>\w{8})\s+"\
r"(?P<FileOfs>\w{8})\s+"\
r"(\w{1,2})\s+"\
r"(?P<Symbol>[0-9A-Za-z_<>$@.*]*)\s*"\
r"(?P<Object>\S*)"

MW_GC_SYMBOL_REGEX = r"^\s*"\
r"(?P<SectOfs>\w{8})\s+"\
r"(?P<Size>\w{6})\s+"\
r"(?P<VirtOfs>\w{8})\s+"\
r"(\w{1,2})\s+"\
r"(?P<Symbol>[0-9A-Za-z_<>$@.*]*)\s*"\
r"(?P<Object>\S*)"

REGEX_TO_USE = MW_GC_SYMBOL_REGEX

TEXT_SECTIONS = ["init", "text"]
DATA_SECTIONS = [
"rodata", "data", "bss", "sdata", "sbss", "sdata2", "sbss2", "file",
"ctors", "_ctors", "dtors", "ctors$99", "_ctors$99", "ctors$00", "dtors$99",
"_extab", "_extabindex"
]

# DOL info
TEXT_SECTION_COUNT = 7
DATA_SECTION_COUNT = 11

SECTION_TEXT = 0
SECTION_DATA = 1

###############################################
#                                             #
#                Entrypoint                   #
#                                             #
###############################################

if __name__ == "__main__":
    # Sum up DOL section sizes
    dol_handle = open(DOL_PATH, "rb")

    # Seek to virtual addresses
    dol_handle.seek(0x48)
    
    # Read virtual addresses
    text_starts = list()
    for i in range(TEXT_SECTION_COUNT):
        text_starts.append(int.from_bytes(dol_handle.read(4), byteorder='big'))
    data_starts = list()
    for i in range(DATA_SECTION_COUNT):
        data_starts.append(int.from_bytes(dol_handle.read(4), byteorder='big'))

    # Read lengths
    text_sizes = list()
    for i in range(TEXT_SECTION_COUNT):
        text_sizes.append(int.from_bytes(dol_handle.read(4), byteorder='big'))
    data_sizes = list()
    for i in range(DATA_SECTION_COUNT):
        data_sizes.append(int.from_bytes(dol_handle.read(4), byteorder='big'))



    # BSS address + length
    bss_start = int.from_bytes(dol_handle.read(4), byteorder='big')
    bss_size = int.from_bytes(dol_handle.read(4), byteorder='big')
    bss_end = bss_start + bss_size


    dol_code_size = 0
    dol_data_size = 0
    for i in range(DATA_SECTION_COUNT):
        # Ignore sections inside BSS
        if (data_starts[i] >= bss_start) and (data_starts[i] + data_sizes[i] <= bss_end): continue
        dol_data_size += data_sizes[i]

    dol_data_size += bss_size

    for i in text_sizes:
        dol_code_size += i

    # Open map file
    mapfile = open(MAP_PATH, "r")
    symbols = mapfile.readlines()

    decomp_code_size = 0
    decomp_data_size = 0
    section_type = None

    # Find first section
    first_section = 0
    while (symbols[first_section].startswith(".") == False and "section layout" not in symbols[first_section]): first_section += 1
    assert(first_section < len(symbols)), "Map file contains no sections!!!"

    for i in range(first_section, len(symbols)):
        # New section
        if (symbols[i].startswith(".") == True or "section layout" in symbols[i]):
            # Grab section name (i.e. ".init section layout" -> "init")
            sectionName = re.search(r"\.*(?P<Name>\w+)\s", symbols[i]).group("Name")
            # Determine type of section
            section_type = SECTION_DATA if (sectionName in DATA_SECTIONS) else SECTION_TEXT
        # Parse symbols until we hit the next section declaration
        else:
            if ("entry of" in symbols[i]) or ("UNUSED" in symbols[i]): continue
            assert(section_type != None), f"Symbol found outside of a section!!!\n{symbols[i]}"
            match_obj = re.search(REGEX_TO_USE, symbols[i])
            # Should be a symbol in ASM (so we discard it)
            if (match_obj == None): continue
            # Is the symbol a file-wide section?
            symb = match_obj.group("Symbol")
            if (symb.startswith("*fill*")) or (symb.startswith(".") and symb[1:] in TEXT_SECTIONS or symb[1:] in DATA_SECTIONS): continue
            # For sections that don't start with "."
            if (symb in DATA_SECTIONS): continue
            # If not, we accumulate the file size
            if (section_type == SECTION_TEXT):
                decomp_code_size += int(match_obj.group("Size"), 16)
            else:
                decomp_data_size += int(match_obj.group("Size"), 16)

    # Calculate percentages
    codeCompletionPcnt = (decomp_code_size / dol_code_size)
    dataCompletionPcnt = (decomp_data_size / dol_data_size)
    
    bytesPerStage = dol_code_size / 118
    stageCount = math.floor(decomp_code_size / bytesPerStage)

    print("Progress:")
    print(f"\tCode sections: {decomp_code_size} / {dol_code_size} bytes in src ({codeCompletionPcnt:%})")
    print(f"\tData sections: {decomp_data_size} / {dol_data_size} bytes in src ({dataCompletionPcnt:%})")
    
    # ------------------------------------------------
    # 118 stages. Calculate the current stage.
    # ------------------------------------------------
    
    # Stage constants
    ST_BEGINNER = 0
    ST_BEGINNER_EX = ST_BEGINNER + 10
    ST_ADVANCED = ST_BEGINNER_EX + 3
    ST_ADVANCED_EX = ST_ADVANCED + 30
    ST_EXPERT = ST_ADVANCED_EX + 5
    ST_EXPERT_EX = ST_EXPERT + 50
    ST_MASTER = ST_EXPERT_EX + 10
    
    if stageCount >= ST_MASTER:
        stageName = "Master %i." % (stageCount - ST_MASTER  + 1)
    elif stageCount >= ST_EXPERT_EX:
        stageName = "Expert Extra %i." % (stageCount - ST_EXPERT_EX + 1)
    elif stageCount >= ST_EXPERT:
        stageName = "Expert %i." % (stageCount - ST_EXPERT + 1)
    elif stageCount >= ST_ADVANCED_EX:
        stageName = "Advanced Extra %i." % (stageCount - ST_ADVANCED_EX + 1)
    elif stageCount >= ST_ADVANCED:
        stageName = "Advanced %i." % (stageCount - ST_ADVANCED + 1)
    elif stageCount >= ST_BEGINNER_EX:
        stageName = "Beginner Extra %i." % (stageCount - ST_BEGINNER_EX + 1)
    elif stageCount >= ST_BEGINNER:
        stageName = "Beginner %i." % (stageCount - ST_BEGINNER + 1)
        
    print("You are currently on", stageName)
