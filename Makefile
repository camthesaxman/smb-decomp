ifneq (,$(findstring Windows,$(OS)))
  EXE := .exe
else
  WINE ?= wine
endif

### Tools ###
COMPILER_DIR := mwcc_compiler/1.0
AS      := $(DEVKITPPC)/bin/powerpc-eabi-as
CC      := $(WINE) $(COMPILER_DIR)/mwcceppc.exe
LD      := $(WINE) $(COMPILER_DIR)/mwldeppc.exe
OBJCOPY := $(DEVKITPPC)/bin/powerpc-eabi-objcopy
OBJDUMP := $(DEVKITPPC)/bin/powerpc-eabi-objdump
HOSTCC  := cc
SHA1SUM := sha1sum
ELF2DOL := tools/elf2dol

ASFLAGS  := -mgekko -I asm
CFLAGS   := -O4,p -nodefaults -proc gekko -fp hard -fp fmadd -fp_contract on -Cpp_exceptions off -msgstyle gcc -enum int
CPPFLAGS := -i src -I- -i include
LDFLAGS  := -fp hard -nodefaults

### Files ###
BASEROM  := baserom.bin
DOL      := supermonkeyball.dol
ELF      := $(DOL:.dol=.elf)
MAP      := $(DOL:.dol=.map)
LDSCRIPT := ldscript.lcf
# NOTE: the order of files listed here determines the link order
SOURCE_FILES := \
	asm/init.s \
	src/main.c \
	src/init.c \
	src/init_2.c \
	asm/mathutil.s \
	asm/game.s \
	asm/camera.s \
	asm/code_1.s \
	asm/sound.s \
	asm/code_2.s \
	asm/ball.s \
	asm/code.s \
	asm/lib_code.s \
	asm/data.s
O_FILES := $(addsuffix .o,$(basename $(SOURCE_FILES)))

#-------------------------------------------------------------------------------
# Recipes
#-------------------------------------------------------------------------------

.PHONY: tools

$(DOL): $(ELF) | tools
	$(ELF2DOL) $(ELF) $(DOL)
	$(SHA1SUM) -c supermonkeyball.sha1

$(ELF): $(LDSCRIPT) $(O_FILES)
	$(LD) $(LDFLAGS) $(O_FILES) -map $(MAP) -lcf $(LDSCRIPT) -o $@
# The Metrowerks linker doesn't generate physical addresses in the ELF program headers. This fixes it somehow.
	$(OBJCOPY) $(ELF) $(ELF)

%.o: %.s
	$(AS) $(ASFLAGS) -o $@ $<

%.o: %.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) -o $@ $<
	$(OBJDUMP) -D $@ > $(@:.o=.dump)

clean:
	$(RM) $(DOL) $(ELF) $(O_FILES) $(MAP)
	$(MAKE) -C tools clean

tools:
	$(MAKE) -C tools
