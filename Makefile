ifneq (,$(findstring Windows,$(OS)))
  EXE := .exe
else
  WINE := wine
endif

### Tools ###
COMPILER_DIR := mwcc_compiler
AS      := $(DEVKITPPC)/bin/powerpc-eabi-as
LD      := $(WINE) $(COMPILER_DIR)/mwldeppc.exe
OBJCOPY := $(DEVKITPPC)/bin/powerpc-eabi-objcopy
HOSTCC  := cc
SHA1SUM := sha1sum
ELF2DOL := tools/elf2dol

ASFLAGS := -mgekko

### Files ###
BASEROM  := baserom.bin
DOL      := supermonkeyball.dol
ELF      := $(DOL:.dol=.elf)
MAP      := ssbm.map
LDSCRIPT := ldscript.lcf
S_FILES  := asm/code.s
C_FILES  :=
O_FILES  := $(S_FILES:.s=.o) $(C_FILES:.c=.o)

#-------------------------------------------------------------------------------
# Recipes
#-------------------------------------------------------------------------------

.PHONY: tools

$(DOL): $(ELF) | tools
	$(ELF2DOL) $(ELF) $(DOL)
	$(SHA1SUM) -c supermonkeyball.sha1

$(ELF): $(LDSCRIPT) $(O_FILES)
	$(LD) $(O_FILES) -map disasm.map -lcf $(LDSCRIPT) -o $@
# The Metrowerks linker doesn't generate physical addresses in the ELF program headers. This fixes it somehow.
	$(OBJCOPY) $(ELF) $(ELF)

%.o: %.s
	$(AS) $(ASFLAGS) -o $@ $<

clean:
	$(RM) $(DOL) $(ELF) $(O_FILES)
	$(MAKE) -C tools clean

tools:
	$(MAKE) -C tools
