ifneq (,$(findstring Windows,$(OS)))
  EXE := .exe
else
  WINE ?= wine
endif

COMPILER_VERSION ?= 1.1

VERBOSE ?= 0

# Don't echo build commands unless VERBOSE is set
ifeq ($(VERBOSE),0)
  QUIET := @
endif

# default recipe
default: all

#-------------------------------------------------------------------------------
# Tools
#-------------------------------------------------------------------------------

COMPILER_DIR := mwcc_compiler/$(COMPILER_VERSION)
AS      := $(DEVKITPPC)/bin/powerpc-eabi-as
CC      := $(WINE) $(COMPILER_DIR)/mwcceppc.exe
LD      := $(WINE) $(COMPILER_DIR)/mwldeppc.exe
OBJCOPY := $(DEVKITPPC)/bin/powerpc-eabi-objcopy
OBJDUMP := $(DEVKITPPC)/bin/powerpc-eabi-objdump
GCC     := $(DEVKITPPC)/bin/powerpc-eabi-gcc
HOSTCC  := cc
SHA1SUM := sha1sum
ELF2DOL := tools/elf2dol$(EXE)
ELF2REL := tools/elf2rel$(EXE)
LZSS    := tools/lzss$(EXE)

INCLUDE_DIRS := src
SYSTEM_INCLUDE_DIRS := include

RUNTIME_INCLUDE_DIRS := src/lib/Runtime.PPCEABI.H/Runtime/Inc

ASFLAGS     := -mgekko -I asm
CFLAGS      := -O4,p -nodefaults -proc gekko -fp hard -Cpp_exceptions off -enum int -warn pragmas -pragma 'cats off'
CPPFLAGS     = $(addprefix -i ,$(INCLUDE_DIRS)) -I- $(addprefix -i ,$(SYSTEM_INCLUDE_DIRS))
DOL_LDFLAGS := -nodefaults -fp hard
REL_LDFLAGS := -nodefaults -fp hard -r1 -m _prolog -g

HOSTCFLAGS   := -Wall -O3 -s

CC_CHECK     := $(GCC) -Wall -Wextra -Wno-unused -Wno-main -Wno-unknown-pragmas -Wno-unused-variable -Wno-unused-parameter -Wno-sign-compare -Wno-missing-field-initializers -fsyntax-only -fno-builtin -nostdinc $(addprefix -I ,$(INCLUDE_DIRS) $(SYSTEM_INCLUDE_DIRS)) -DNONMATCHING

#-------------------------------------------------------------------------------
# Files
#-------------------------------------------------------------------------------

BASEROM  := baserom.bin
DOL      := supermonkeyball.dol
ELF      := $(DOL:.dol=.elf)
MAP      := $(DOL:.dol=.map)

DOL_LCF := static.lcf
REL_LCF := partial.lcf

# main dol sources
SOURCES := \
	asm/c++_exception_data.s \
	src/main.c \
	src/init.c \
	src/init_2.c \
	src/mathutil.c \
	src/mode.c \
	asm/mode.s \
	src/event.c \
	src/polydisp.c \
	asm/polydisp.s \
	asm/adv.s \
	src/sel.c \
	asm/game.s \
	src/camera.c \
	asm/code_0.s \
	asm/code_1.s \
	src/input.c \
	src/bitmap.c \
	src/bmp_list_com.c \
	src/bmp_list_adv.c \
	src/bmp_list_end.c \
	src/bmp_list_rnk.c \
	src/bmp_list_sel.c \
	src/bmp_list_nml.c \
	src/bmp_list_bwl.c \
	src/bmp_list_rac.c \
	src/bmp_list_bil.c \
	src/bmp_list_fgt.c \
	src/bmp_list_glf.c \
	src/bmp_list_tgt.c \
	src/bmp_list_how.c \
	src/bmp_list_cmd.c \
	src/trig_tables.c \
	src/perf.c \
	asm/sound.s \
	asm/code_2.s \
	asm/nl2ngc.s \
	src/motload.c \
	asm/motload.s \
	src/ball.c \
	src/mathutil_vec_cross_prod.c \
	asm/code.s \
	src/stage.c \
	asm/stage.s \
	src/background.c \
	asm/background.s \
	src/sprite.c \
	asm/sprite.s \
	asm/ord_tbl.s \
	asm/mot_ape.s \
	src/lzs_decompress.c \
	src/avdisp.c \
	src/load.c \
	asm/load.s \
	asm/mini.s \
	src/relocation.c \
	asm/code_3.s \
	asm/mini_commend.s \
	src/memcard.c \
	src/DEMOPuts.c \
	asm/view.s \
	src/preview.c \
	asm/code_4.s \
	asm/lib/base/PPCArch.s \
	src/lib/os/__start.c \
	src/lib/os/__ppc_eabi_init.c \
	asm/lib/os/OS.s \
	asm/lib/os/OSAlarm.s \
	asm/lib/os/OSAlloc.s \
	asm/lib/os/OSArena.s \
	asm/lib/os/OSAudioSystem.s \
	asm/lib/os/OSCache.s \
	asm/lib/os/OSContext.s \
	asm/lib/os/OSError.s \
	asm/lib/os/OSInterrupt.s \
	asm/lib/exi/EXIBios.s \
	asm/lib/os/OSFont.s \
	asm/lib/os/OSInterrupt_2.s \
	asm/lib/os/OSLink.s \
	asm/lib/os/OSMemory.s \
	asm/lib/os/OSMutex.s \
	asm/lib/os/OSReboot.s \
	asm/lib/os/OSReset.s \
	asm/lib/os/OSResetSW.s \
	asm/lib/os/OSRtc.s \
	asm/lib/si/SIBios.s \
	asm/lib/os/OSSync.s \
	asm/lib/os/OSThread.s \
	asm/lib/os/OSTime.s \
	asm/lib/exi/EXIUart.s \
	asm/lib/os/__ppc_eabi_init.s \
	asm/lib/db/db.s \
	asm/lib/mtx/mtx.s \
	asm/lib/mtx/mtx44.s \
	asm/lib/mtx/vec.s \
	asm/lib/dvd/dvdlow.s \
	asm/lib/dvd/dvdfs.s \
	asm/lib/dvd/dvd.s \
	asm/lib/dvd/dvdqueue.s \
	asm/lib/dvd/dvderror.s \
	asm/lib/dvd/fstload.s \
	asm/lib/vi/vi.s \
	asm/lib/pad/Pad.s \
	asm/lib/ai/ai.s \
	asm/lib/ar/ar.s \
	asm/lib/ar/arq.s \
	asm/lib/dsp/dsp.s \
	asm/lib/dsp/dsp_debug.s \
	asm/lib/dsp/dsp_task.s \
	asm/lib/card/CARDBios.s \
	asm/lib/card/CARDUnlock.s \
	asm/lib/card/CARDRdwr.s \
	asm/lib/card/CARDBlock.s \
	asm/lib/card/CARDDir.s \
	asm/lib/card/CARDCheck.s \
	asm/lib/card/CARDMount.s \
	asm/lib/card/CARDFormat.s \
	asm/lib/card/CARDOpen.s \
	asm/lib/card/CARDCreate.s \
	asm/lib/card/CARDRead.s \
	asm/lib/card/CARDWrite.s \
	asm/lib/card/CARDDelete.s \
	asm/lib/card/CARDStat.s \
	asm/lib/card/CARDRename.s \
	asm/lib/hio/hio.s \
	asm/lib/gx/GXInit.s \
	asm/lib/gx/GXFifo.s \
	asm/lib/gx/GXAttr.s \
	asm/lib/gx/GXMisc.s \
	asm/lib/gx/GXGeometry.s \
	asm/lib/gx/GXFrameBuf.s \
	asm/lib/gx/GXLight.s \
	asm/lib/gx/GXTexture.s \
	asm/lib/gx/GXBump.s \
	asm/lib/gx/GXTev.s \
	asm/lib/gx/GXPixel.s \
	asm/lib/gx/GXDraw.s \
	asm/lib/gx/GXStubs.s \
	asm/lib/gx/GXDisplayList.s \
	asm/lib/gx/GXTransform.s \
	asm/lib/gx/GXPerf.s \
	asm/lib/perf/perf.s \
	asm/lib/perf/perfdraw.s \
	asm/lib/musyx/seq.s \
	asm/lib/musyx/synth.s \
	asm/lib/musyx/seq_api.s \
	asm/lib/musyx/snd_synthapi.s \
	asm/lib/musyx/stream.s \
	asm/lib/musyx/synthdata.s \
	asm/lib/musyx/synthmacros.s \
	asm/lib/musyx/synthvoice.s \
	asm/lib/musyx/synth_ac.s \
	asm/lib/musyx/synth_adsr.s \
	asm/lib/musyx/s_data.s \
	asm/lib/musyx/hw_dspctrl.s \
	asm/lib/musyx/hw_volconv.s \
	asm/lib/musyx/snd3d.s \
	asm/lib/musyx/synth_2.s \
	asm/lib/musyx/snd_math.s \
	asm/lib/musyx/snd_midictrl.s \
	asm/lib/musyx/snd_service.s \
	asm/lib/musyx/HARDWARE.s \
	asm/lib/musyx/hw_aramdma.s \
	asm/lib/musyx/hw_dolphin.s \
	asm/lib/musyx/hw_memory.s \
	asm/lib/musyx/reverb_fx.s \
	asm/lib/musyx/reverb.s \
	asm/lib/musyx/chorus_fx.s \
	asm/lib/dtk/dtk.s \
	src/lib/Runtime.PPCEABI.H/Runtime/Src/__mem.c \
	asm/lib/PowerPC_EABI_Support/Runtime/Src/__va_arg.s \
	src/lib/Runtime.PPCEABI.H/Runtime/Src/global_destructor_chain.c \
	src/lib/Runtime.PPCEABI.H/Runtime/Src/ExceptionPPC.cp \
	asm/lib/PowerPC_EABI_Support/Runtime/Src/runtime.s \
	src/lib/Runtime.PPCEABI.H/Runtime/Src/__init_cpp_exceptions.cpp \
	asm/lib/PowerPC_EABI_Support/Msl/MSL_C/MSL_Common/Src/abort_exit.s \
	asm/lib/PowerPC_EABI_Support/Msl/MSL_C/MSL_Common_Embedded/Src/ansi_fp.s \
	asm/lib/PowerPC_EABI_Support/Msl/MSL_C/MSL_Common/Src/buffer_io.s \
	asm/lib/PowerPC_EABI_Support/Msl/MSL_C/MSL_Common/Src/char_io.s \
	asm/lib/PowerPC_EABI_Support/Msl/MSL_C/PPC_EABI/SRC/critical_regions.ppc_eabi.s \
	src/lib/PowerPC_EABI_Support/Msl/MSL_C/MSL_Common/Src/ctype.c \
	asm/lib/PowerPC_EABI_Support/Msl/MSL_C/MSL_Common/Src/direct_io.s \
	asm/lib/PowerPC_EABI_Support/Msl/MSL_C/MSL_Common/Src/mbstring.s \
	asm/lib/PowerPC_EABI_Support/Msl/MSL_C/MSL_Common/Src/mem.s \
	asm/lib/PowerPC_EABI_Support/Msl/MSL_C/MSL_Common/Src/mem_funcs.s \
	asm/lib/PowerPC_EABI_Support/Msl/MSL_C/MSL_Common/Src/misc_io.s \
	asm/lib/PowerPC_EABI_Support/Msl/MSL_C/MSL_Common/Src/printf.s \
	asm/lib/PowerPC_EABI_Support/Msl/MSL_C/MSL_Common/Src/rand.s \
	asm/lib/PowerPC_EABI_Support/Msl/MSL_C/MSL_Common/Src/string.s \
	asm/lib/PowerPC_EABI_Support/Msl/MSL_C/MSL_Common/Src/wchar_io.s \
	asm/lib/PowerPC_EABI_Support/math/e_rem_pio2.s \
	asm/lib/PowerPC_EABI_Support/math/fminmaxdim.s \
	asm/lib/PowerPC_EABI_Support/math/k_cos.s \
	asm/lib/PowerPC_EABI_Support/math/k_rem_pio2.s \
	asm/lib/PowerPC_EABI_Support/math/k_sin.s \
	asm/lib/PowerPC_EABI_Support/math/s_copysign.s \
	asm/lib/PowerPC_EABI_Support/math/s_cos.s \
	asm/lib/PowerPC_EABI_Support/math/s_floor.s \
	asm/lib/PowerPC_EABI_Support/math/s_frexp.s \
	asm/lib/PowerPC_EABI_Support/math/s_ldexp.s \
	asm/lib/PowerPC_EABI_Support/math/s_sin.s \
	asm/lib/PowerPC_EABI_Support/math/inverse_trig.s \
	asm/lib/PowerPC_EABI_Support/math/trigf.s \
	asm/lib/PowerPC_EABI_Support/Msl/MSL_C/MSL_Common_Embedded/Math/Single_precision/exponentialsf.s \
	asm/lib/TRK_MINNOW_DOLPHIN/mainloop.s \
	asm/lib/TRK_MINNOW_DOLPHIN/nubevent.s \
	asm/lib/TRK_MINNOW_DOLPHIN/nubinit.s \
	asm/lib/TRK_MINNOW_DOLPHIN/msg.s \
	asm/lib/TRK_MINNOW_DOLPHIN/msgbuf.s \
	asm/lib/TRK_MINNOW_DOLPHIN/serpoll.s \
	asm/lib/TRK_MINNOW_DOLPHIN/usr_put.s \
	asm/lib/TRK_MINNOW_DOLPHIN/dispatch.s \
	asm/lib/TRK_MINNOW_DOLPHIN/msghndlr.s \
	asm/lib/TRK_MINNOW_DOLPHIN/support.s \
	asm/lib/TRK_MINNOW_DOLPHIN/mutex_TRK.s \
	asm/lib/TRK_MINNOW_DOLPHIN/notify.s \
	asm/lib/TRK_MINNOW_DOLPHIN/flush_cache.s \
	src/lib/TRK_MINNOW_DOLPHIN/Portable/mem_TRK.c \
	asm/lib/TRK_MINNOW_DOLPHIN/targimpl.s \
	asm/lib/TRK_MINNOW_DOLPHIN/dolphin_trk.s \
	asm/lib/TRK_MINNOW_DOLPHIN/mpc_7xx_603e.s \
	asm/lib/TRK_MINNOW_DOLPHIN/main_TRK.s \
	asm/lib/TRK_MINNOW_DOLPHIN/dolphin_trk_glue.s \
	asm/lib/TRK_MINNOW_DOLPHIN/targcont.s \
	asm/lib/amcstubs/AmcExi2Stubs.s \
	asm/lib/odemustubs/odemustubs.s \
	asm/lib/amcnotstub/amcnotstub.s \
	asm/lib/data.s \
	asm/init.s
O_FILES := $(addsuffix .o,$(basename $(SOURCES)))
ALL_O_FILES := $(O_FILES)
$(ELF): $(O_FILES)

# mkbe.sel_stage.rel sources
SOURCES := \
	src/sel_stage_rel.c \
	src/sel_stage_rel_2.c \
	src/sel_stage_rel_3.c
O_FILES := $(addsuffix .o,$(basename $(SOURCES)))
ALL_O_FILES += $(O_FILES)
mkbe.sel_stage.plf: $(O_FILES)
mkbe.sel_stage.rel: ELF2REL_ARGS := -i 2 -o 0x1D -l 0x1F
ALL_RELS += mkbe.sel_stage.rel

# mkbe.rel_mini_race.rel sources
SOURCES := \
	src/mini_race.c \
	asm/mini_race.s
O_FILES := $(addsuffix .o,$(basename $(SOURCES)))
ALL_O_FILES += $(O_FILES)
mkbe.rel_mini_race.plf: $(O_FILES)
mkbe.rel_mini_race.rel: ELF2REL_ARGS := -i 3 -o 0x3C -l 0x23 -c 18
ALL_RELS += mkbe.rel_mini_race.rel

# mkbe.rel_mini_bowling.rel sources
SOURCES := \
	src/mini_bowling.c \
	asm/mini_bowling.s
O_FILES := $(addsuffix .o,$(basename $(SOURCES)))
ALL_O_FILES += $(O_FILES)
mkbe.rel_mini_bowling.plf: $(O_FILES)
mkbe.rel_mini_bowling.rel: ELF2REL_ARGS := -i 4 -o 0x5F -l 0x26 -c 18
ALL_RELS += mkbe.rel_mini_bowling.rel

# mkbe.rel_mini_pilot.rel sources
SOURCES := \
	src/mini_pilot.c \
	asm/mini_pilot.s
O_FILES := $(addsuffix .o,$(basename $(SOURCES)))
ALL_O_FILES += $(O_FILES)
mkbe.rel_mini_pilot.plf: $(O_FILES)
mkbe.rel_mini_pilot.rel: ELF2REL_ARGS := -i 6 -o 0xA9 -l 0x24 -c 18
ALL_RELS += mkbe.rel_mini_pilot.rel

# mkbe.rel_sample.rel sources
SOURCES := \
	src/rel_sample.c
O_FILES := $(addsuffix .o,$(basename $(SOURCES)))
ALL_O_FILES += $(O_FILES)
mkbe.rel_sample.plf: $(O_FILES)
mkbe.rel_sample.rel: ELF2REL_ARGS := -i 9 -o 0x118 -l 0x20
ALL_RELS += mkbe.rel_sample.rel

# mkbe.test_mode.rel sources
SOURCES := \
	src/test_mode.c \
	asm/test_mode.s
O_FILES := $(addsuffix .o,$(basename $(SOURCES)))
ALL_O_FILES += $(O_FILES)
mkbe.test_mode.plf: $(O_FILES)
mkbe.test_mode.rel: ELF2REL_ARGS := -i 10 -o 0x138 -l 0x1F -c 18
ALL_RELS += mkbe.test_mode.rel

# mkbe.option.rel sources
SOURCES := \
	src/option.c \
	asm/option.s
O_FILES := $(addsuffix .o,$(basename $(SOURCES)))
ALL_O_FILES += $(O_FILES)
mkbe.option.plf: $(O_FILES)
mkbe.option.rel: ELF2REL_ARGS := -i 11 -o 0x157 -l 0x1C -c 17
ALL_RELS += mkbe.option.rel

#-------------------------------------------------------------------------------
# Recipes
#-------------------------------------------------------------------------------

.PHONY: all default

all: $(DOL) $(ALL_RELS)
	$(QUIET) $(SHA1SUM) -c supermonkeyball.sha1

# static module (.dol file)
%.dol: %.elf $(ELF2DOL)
	@echo Converting $< to $@
	$(QUIET) $(ELF2DOL) $(filter %.elf,$^) $@

%.elf: $(DOL_LCF)
	@echo Linking static module $@
	$(QUIET) $(LD) -lcf $(DOL_LCF) $(DOL_LDFLAGS) $(filter %.o,$^) -map $(@:.elf=.map) -o $@

# relocatable module (.rel file)
%.rel: %.plf $(ELF) $(ELF2REL)
	@echo Converting $(filter %.plf,$^) to $@
	$(QUIET) $(ELF2REL) $(filter %.plf,$^) $(ELF) $@ $(ELF2REL_ARGS)

%.plf: $(REL_LCF)
	@echo Linking relocatable module $@
	$(QUIET) $(LD) -lcf $(REL_LCF) $(REL_LDFLAGS) $(filter %.o,$^) -map $(@:.plf=.map) -o $@

# Canned recipe for compiling C or C++
# Uses CC_CHECK to check syntax and generate dependencies, compiles the file,
# then disassembles the object file
define COMPILE =
@echo Compiling $<
$(QUIET) $(CC_CHECK) -MMD -MF $(@:.o=.dep) -MT $@ $<
$(QUIET) $(CC) -c $(CFLAGS) $(CPPFLAGS) -o $@ $<
$(QUIET) $(OBJDUMP) -Drz $@ > $(@:.o=.dump)
endef

# relocatable modules must not use the small data sections
%.plf: CFLAGS += -sdata 0 -sdata2 0 -g

%.o: %.c
	$(COMPILE)
%.o: %.cpp
	$(COMPILE)
%.o: %.cp
	$(COMPILE)

%.o: %.s
	@echo Assembling $<
	$(QUIET) $(AS) $(ASFLAGS) -o $@ $<

clean:
	$(RM) $(DOL) $(ELF) $(MAP) $(ALL_RELS) $(ELF2DOL) $(ELF2REL)
	find . -name '*.o' -exec rm {} +
	find . -name '*.dep' -exec rm {} +
	find . -name '*.dump' -exec rm {} +

# File-specific compiler flags
src/ball.o:     CFLAGS += -inline auto
src/bitmap.o:   CFLAGS += -inline auto
src/camera.o:   CFLAGS += -inline auto
src/mathutil.o: CFLAGS += -inline auto
src/sprite.o:   CFLAGS += -inline auto
src/avdisp.o:   CFLAGS += -inline auto
src/DEMOPuts.o: CFLAGS += -inline auto
src/memcard.o:  CFLAGS += -inline auto
src/stage.o:    CFLAGS += -inline auto

# These need an extra include directory and are incompatible with gcc
RUNTIME_OBJECTS := \
	src/lib/os/__start.o \
	src/lib/os/__ppc_eabi_init.o \
	src/lib/Runtime.PPCEABI.H/Runtime/Src/__mem.o \
	src/lib/Runtime.PPCEABI.H/Runtime/Src/ExceptionPPC.o \
	src/lib/Runtime.PPCEABI.H/Runtime/Src/__init_cpp_exceptions.o \
	src/lib/Runtime.PPCEABI.H/Runtime/Src/global_destructor_chain.o

$(RUNTIME_OBJECTS): CC_CHECK := true
$(RUNTIME_OBJECTS): SYSTEM_INCLUDE_DIRS += $(RUNTIME_INCLUDE_DIRS)

src/lib/TRK_MINNOW_DOLPHIN/Portable/mem_TRK.o: CC_CHECK := true

# Automatic dependency files
DEP_FILES := $(addsuffix .dep,$(basename $(ALL_O_FILES)))
-include $(DEP_FILES)

#-------------------------------------------------------------------------------
# Tool Recipes
#-------------------------------------------------------------------------------

$(ELF2DOL): tools/elf2dol.c
	@echo Building tool $@
	$(QUIET) $(HOSTCC) $(HOSTCFLAGS) -o $@ $^

$(ELF2REL): tools/elf2rel.c
	@echo Building tool $@
	$(QUIET) $(HOSTCC) $(HOSTCFLAGS) -o $@ $^

# Original source for lzss can be found at
# https://web.archive.org/web/19990203141013/http://oak.oakland.edu/pub/simtelnet/msdos/arcutils/lz_comp2.zip
$(LZSS): tools/lzss.c
	@echo Building tool $@
	$(QUIET) $(HOSTCC) $(HOSTCFLAGS) -o $@ $^

print-% : ; $(info $* is a $(flavor $*) variable set to [$($*)]) @true
