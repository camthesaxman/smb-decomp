#!/usr/bin/env python3

################################################################################
#                                 Description                                  #
################################################################################
# calcprogress: Used to calculate the progress of the Sunshine decomp.         #
# Prints to stdout for now, but eventually will have some form of storage,     #
# i.e. CSV, so that it can be used for a webpage display.                      #
#                                                                              #
# Usage: No arguments needed                                                   #
################################################################################




###############################################
#                                             #
#                  Imports                    #
#                                             #
###############################################

import os
import sys
import math

###############################################
#                                             #
#                 Constants                   #
#                                             #
###############################################

# Section sizes (code)
SECTION_SIZE_INIT = 0x23c0   # .init
SECTION_SIZE_TEXT = 0x1092c0 # .text
SECTION_SIZE_CODE = SECTION_SIZE_INIT + SECTION_SIZE_TEXT
# All data sections added together
SECTION_SIZE_DATAS = (
    + 0x62ae0  # .rodata
    + 0x7b5a0  # .data
    + 0x1041c0 # .bss
    + 0x1900   # .sdata
    + 0xd15    # .sbss
    + 0x4480   # .sdata2
    + 0x0      # .sbss2
)

# Section names
SECTION_NAMES = ["init", "text", "rodata", "data", "bss", "sdata", "sbss", "sdata2", "sbss2"]

###############################################
#                                             #
#                  Classes                    #
#                                             #
###############################################

# Symbol class
class MWSymbol:
    # Constructor
    # 'mapLine' represents a line from the Metrowerks/Codewarrior symbol map
    def __init__(self, mapLine : str):
        tokens = mapLine.split()
        # Only symbols that will fail this check are "UNUSED"
        if (len(tokens) >= 6):
            self.unused = False
            self.Setup(tokens[0], tokens[1], tokens[2],
            tokens[4], tokens[5])
        else:
            self.unused = True

    # Does rest of constructor's work under the hood
    def Setup(self, localOfs : str, size : str,
    virtualOfs : str, symbol : str, sourceFile : str):
        if (self.unused == True): return
        self.localOfs = int(localOfs, 16)
        self.size = int(size, 16)
        self.virtualOfs = int(virtualOfs, 16)
        self.symbol = symbol
        self.sourceFile = sourceFile

    # Whether a given MWSymbol will be used for the progress calculation
    # 'section': String, name of the current section (init, data, etc.)
    # Filters out things like unused symbols, non-source (asm) symbols, etc.
    def IsNeeded(self) -> bool:
        if (self.unused == True): return False
        if (self.size == 0): return False
        if (self.localOfs == "UNUSED"): return False
        if (IsReserved(self.symbol)): return False
        if (self.symbol == "(entry") and (self.sourceFile == "of"): return False
        return True

###############################################
#                                             #
#                  Functions                  #
#                                             #
###############################################

def IsReserved(s : str) -> bool:
    for i in SECTION_NAMES:
        if (s.find(i) != -1): return True
    return False

###############################################
#                                             #
#                Entrypoint                   #
#                                             #
###############################################

if __name__ == "__main__":
    # Open map file
    mapfile = open("supermonkeyball.map", "r")
    symbols = mapfile.readlines()

    # Split code symbols from data symbols
    initStartIdx = symbols.index(".init section layout\n") + 4
    initEndIdx = symbols.index("_extab section layout\n") - 3
    # Remove unused symbols and symbols from assembly code
    initSymbols = [MWSymbol(s) for s in symbols[initStartIdx : initEndIdx] if MWSymbol(s).IsNeeded()]

    textStartIdx = symbols.index(".text section layout\n") + 4
    textEndIdx = symbols.index(".ctors section layout\n") - 3
    textSymbols = [MWSymbol(s) for s in symbols[textStartIdx : textEndIdx] if MWSymbol(s).IsNeeded()]

    dataStartIdx = symbols.index(".rodata section layout\n") + 4
    dataEndIdx = symbols.index("Memory map:\n") - 3
    dataSymbols = [MWSymbol(s) for s in symbols[dataStartIdx : dataEndIdx] if MWSymbol(s).IsNeeded()]

    # Sum size of decomp progress for code
    decompCodeSize = 0
    for i in initSymbols:
        decompCodeSize += i.size
    for i in textSymbols:
        decompCodeSize += i.size

    # Same for data
    decompDataSize = 0
    for i in dataSymbols:
        decompDataSize += i.size

    # Calculate percentages
    codeCompletionPcnt = (decompCodeSize / SECTION_SIZE_CODE)
    dataCompletionPcnt = (decompDataSize / SECTION_SIZE_DATAS)

    bytesPerStage = SECTION_SIZE_CODE / 118
    stageCount = math.floor(decompCodeSize / bytesPerStage)

    print("Progress:")
    print("\tCode sections: {} / {} bytes in src ({:%})".format(decompCodeSize, SECTION_SIZE_CODE, codeCompletionPcnt))
    print("\tData sections: {} / {} bytes in src ({:%})".format(decompDataSize, SECTION_SIZE_DATAS, dataCompletionPcnt))
    
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
