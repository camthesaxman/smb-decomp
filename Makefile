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

RUNTIME_INCLUDE_DIRS := libraries/PowerPC_EABI_Support/Runtime/Inc

ASFLAGS     := -mgekko -I asm
CFLAGS      := -O4,p -inline auto -nodefaults -proc gekko -fp hard -Cpp_exceptions off -enum int -warn pragmas -pragma 'cats off'
CPPFLAGS     = $(addprefix -i ,$(INCLUDE_DIRS) $(dir $^)) -I- $(addprefix -i ,$(SYSTEM_INCLUDE_DIRS))
DOL_LDFLAGS := -nodefaults -fp hard
REL_LDFLAGS := -nodefaults -fp hard -r1 -m _prolog -g

HOSTCFLAGS   := -Wall -O3 -s

CC_CHECK     := $(GCC) -Wall -Wextra -Wno-unused -Wno-main -Wno-unknown-pragmas -Wno-unused-variable -Wno-unused-parameter -Wno-sign-compare -Wno-missing-field-initializers -Wno-char-subscripts -fsyntax-only -fno-builtin -nostdinc $(addprefix -I ,$(INCLUDE_DIRS) $(SYSTEM_INCLUDE_DIRS)) -DNONMATCHING

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
	src/mode_2.c \
	src/event.c \
	src/polydisp.c \
	src/adv.c \
	src/code_5.c \
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
	src/nl2ngc.c \
	src/motload.c \
	src/motload_2.c \
	asm/motload.s \
	src/ball.c \
	src/mathutil_vec_cross_prod.c \
	asm/code.s \
	src/stage.c \
	asm/stage.s \
	asm/recplay.s \
	src/background.c \
	asm/background.s \
	src/item.c \
	src/item_coin.c \
	src/item_pilot.c \
	asm/stobj.s \
	src/sprite.c \
	asm/code_5.s \
	asm/minimap.s \
	src/ord_tbl.c \
	asm/code_3.s \
	asm/mot_ape.s \
	src/lzs_decompress.c \
	src/avdisp.c \
	src/load.c \
	asm/load.s \
	asm/mini.s \
	asm/mouse.s \
	asm/rend_efc.s \
	src/relocation.c \
	src/gxutil.c \
	asm/mini_commend.s \
	asm/tevutil.s \
	src/memcard.c \
	src/DEMOPuts.c \
	src/view.c \
	src/code_6.c \
	asm/mini_ranking.s \
	src/preview.c \
	asm/code_4.s \
	libraries/base/asm/PPCArch.s \
	libraries/os/__start.c \
	libraries/os/asm/OS.s \
	libraries/os/asm/OSAlarm.s \
	libraries/os/asm/OSAlloc.s \
	libraries/os/asm/OSArena.s \
	libraries/os/asm/OSAudioSystem.s \
	libraries/os/asm/OSCache.s \
	libraries/os/asm/OSContext.s \
	libraries/os/OSError.c \
	libraries/os/asm/OSExi.s \
	libraries/os/asm/OSFont.s \
	libraries/os/asm/OSInterrupt.s \
	libraries/os/asm/OSLink.s \
	libraries/os/asm/OSMemory.s \
	libraries/os/OSMutex.c \
	libraries/os/asm/OSReboot.s \
	libraries/os/asm/OSReset.s \
	libraries/os/asm/OSResetSW.s \
	libraries/os/asm/OSRtc.s \
	libraries/si/asm/SIBios.s \
	libraries/os/asm/OSSync.s \
	libraries/os/asm/OSThread.s \
	libraries/os/asm/OSTime.s \
	libraries/exi/asm/EXIUart.s \
	libraries/os/__ppc_eabi_init.c \
	libraries/db/db.c \
	libraries/mtx/asm/mtx.s \
	libraries/mtx/asm/mtx44.s \
	libraries/mtx/asm/vec.s \
	libraries/dvd/asm/dvdlow.s \
	libraries/dvd/asm/dvdfs.s \
	libraries/dvd/asm/dvd.s \
	libraries/dvd/asm/dvdqueue.s \
	libraries/dvd/asm/dvderror.s \
	libraries/dvd/fstload.c \
	libraries/vi/asm/vi.s \
	libraries/demo/DEMOFont.c \
	libraries/pad/asm/Pad.s \
	libraries/ai/asm/ai.s \
	libraries/ar/asm/ar.s \
	libraries/ar/asm/arq.s \
	libraries/dsp/dsp.c \
	libraries/dsp/dsp_debug.c \
	libraries/dsp/asm/dsp_task.s \
	libraries/card/asm/CARDBios.s \
	libraries/card/asm/CARDUnlock.s \
	libraries/card/asm/CARDRdwr.s \
	libraries/card/asm/CARDBlock.s \
	libraries/card/asm/CARDDir.s \
	libraries/card/asm/CARDCheck.s \
	libraries/card/asm/CARDMount.s \
	libraries/card/asm/CARDFormat.s \
	libraries/card/asm/CARDOpen.s \
	libraries/card/asm/CARDCreate.s \
	libraries/card/asm/CARDRead.s \
	libraries/card/asm/CARDWrite.s \
	libraries/card/asm/CARDDelete.s \
	libraries/card/asm/CARDStat.s \
	libraries/card/asm/CARDRename.s \
	libraries/hio/hio.c \
	libraries/gx/asm/GXInit.s \
	libraries/gx/asm/GXFifo.s \
	libraries/gx/asm/GXAttr.s \
	libraries/gx/asm/GXMisc.s \
	libraries/gx/asm/GXGeometry.s \
	libraries/gx/asm/GXFrameBuf.s \
	libraries/gx/asm/GXLight.s \
	libraries/gx/asm/GXTexture.s \
	libraries/gx/asm/GXBump.s \
	libraries/gx/asm/GXTev.s \
	libraries/gx/asm/GXPixel.s \
	libraries/gx/asm/GXDraw.s \
	libraries/gx/asm/GXStubs.s \
	libraries/gx/GXDisplayList.c \
	libraries/gx/asm/GXTransform.s \
	libraries/gx/GXPerf.c \
	libraries/perf/asm/perf.s \
	libraries/perf/asm/perfdraw.s \
	libraries/musyx/asm/seq.s \
	libraries/musyx/asm/synth.s \
	libraries/musyx/asm/seq_api.s \
	libraries/musyx/asm/snd_synthapi.s \
	libraries/musyx/asm/stream.s \
	libraries/musyx/asm/synthdata.s \
	libraries/musyx/asm/synthmacros.s \
	libraries/musyx/asm/synthvoice.s \
	libraries/musyx/asm/synth_ac.s \
	libraries/musyx/asm/synth_adsr.s \
	libraries/musyx/asm/synth_dbtab.s \
	libraries/musyx/asm/s_data.s \
	libraries/musyx/asm/hw_dspctrl.s \
	libraries/musyx/asm/hw_volconv.s \
	libraries/musyx/asm/snd3d.s \
	libraries/musyx/asm/synth_2.s \
	libraries/musyx/asm/snd_math.s \
	libraries/musyx/asm/snd_midictrl.s \
	libraries/musyx/asm/snd_service.s \
	libraries/musyx/asm/HARDWARE.s \
	libraries/musyx/asm/hw_aramdma.s \
	libraries/musyx/asm/hw_dolphin.s \
	libraries/musyx/asm/hw_memory.s \
	libraries/musyx/asm/reverb_fx.s \
	libraries/musyx/asm/reverb.s \
	libraries/musyx/asm/chorus_fx.s \
	libraries/dtk/asm/dtk.s \
	libraries/PowerPC_EABI_Support/Runtime/Src/__mem.c \
	libraries/PowerPC_EABI_Support/Runtime/Src/__va_arg.c \
	libraries/PowerPC_EABI_Support/Runtime/Src/global_destructor_chain.c \
	libraries/PowerPC_EABI_Support/Runtime/Src/ExceptionPPC.cp \
	libraries/PowerPC_EABI_Support/asm/Runtime/Src/runtime.s \
	libraries/PowerPC_EABI_Support/Runtime/Src/__init_cpp_exceptions.cpp \
	libraries/PowerPC_EABI_Support/asm/Msl/MSL_C/MSL_Common/Src/abort_exit.s \
	libraries/PowerPC_EABI_Support/asm/Msl/MSL_C/MSL_Common_Embedded/Src/ansi_fp.s \
	libraries/PowerPC_EABI_Support/asm/Msl/MSL_C/MSL_Common/Src/buffer_io.s \
	libraries/PowerPC_EABI_Support/asm/Msl/MSL_C/MSL_Common/Src/char_io.s \
	libraries/PowerPC_EABI_Support/Msl/MSL_C/PPC_EABI/SRC/critical_regions.ppc_eabi.c \
	libraries/PowerPC_EABI_Support/Msl/MSL_C/MSL_Common/Src/ctype.c \
	libraries/PowerPC_EABI_Support/asm/Msl/MSL_C/MSL_Common/Src/direct_io.s \
	libraries/PowerPC_EABI_Support/asm/Msl/MSL_C/MSL_Common/Src/mbstring.s \
	libraries/PowerPC_EABI_Support/Msl/MSL_C/MSL_Common/Src/mem.c \
	libraries/PowerPC_EABI_Support/asm/Msl/MSL_C/MSL_Common/Src/mem_funcs.s \
	libraries/PowerPC_EABI_Support/Msl/MSL_C/MSL_Common/Src/misc_io.c \
	libraries/PowerPC_EABI_Support/asm/Msl/MSL_C/MSL_Common/Src/printf.s \
	libraries/PowerPC_EABI_Support/asm/Msl/MSL_C/MSL_Common/Src/float.s \
	libraries/PowerPC_EABI_Support/Msl/MSL_C/MSL_Common/Src/rand.c \
	libraries/PowerPC_EABI_Support/asm/Msl/MSL_C/MSL_Common/Src/string.s \
	libraries/PowerPC_EABI_Support/Msl/MSL_C/MSL_Common/Src/wchar_io.c \
	libraries/PowerPC_EABI_Support/asm/math/e_rem_pio2.s \
	libraries/PowerPC_EABI_Support/asm/math/fminmaxdim.s \
	libraries/PowerPC_EABI_Support/asm/math/k_cos.s \
	libraries/PowerPC_EABI_Support/asm/math/k_rem_pio2.s \
	libraries/PowerPC_EABI_Support/asm/math/k_sin.s \
	libraries/PowerPC_EABI_Support/asm/math/s_copysign.s \
	libraries/PowerPC_EABI_Support/asm/math/s_cos.s \
	libraries/PowerPC_EABI_Support/asm/math/s_floor.s \
	libraries/PowerPC_EABI_Support/asm/math/s_frexp.s \
	libraries/PowerPC_EABI_Support/asm/math/s_ldexp.s \
	libraries/PowerPC_EABI_Support/asm/math/s_sin.s \
	libraries/PowerPC_EABI_Support/asm/math/inverse_trig.s \
	libraries/PowerPC_EABI_Support/asm/math/trigf.s \
	libraries/PowerPC_EABI_Support/asm/Msl/MSL_C/MSL_Common_Embedded/Math/Single_precision/common_float_tables.s \
	libraries/PowerPC_EABI_Support/asm/Msl/MSL_C/MSL_Common_Embedded/Math/Single_precision/exponentialsf.s \
	libraries/TRK_MINNOW_DOLPHIN/asm/mainloop.s \
	libraries/TRK_MINNOW_DOLPHIN/asm/nubevent.s \
	libraries/TRK_MINNOW_DOLPHIN/asm/nubinit.s \
	libraries/TRK_MINNOW_DOLPHIN/asm/msg.s \
	libraries/TRK_MINNOW_DOLPHIN/asm/msgbuf.s \
	libraries/TRK_MINNOW_DOLPHIN/asm/serpoll.s \
	libraries/TRK_MINNOW_DOLPHIN/asm/usr_put.s \
	libraries/TRK_MINNOW_DOLPHIN/asm/dispatch.s \
	libraries/TRK_MINNOW_DOLPHIN/asm/msghndlr.s \
	libraries/TRK_MINNOW_DOLPHIN/asm/support.s \
	libraries/TRK_MINNOW_DOLPHIN/asm/mutex_TRK.s \
	libraries/TRK_MINNOW_DOLPHIN/asm/notify.s \
	libraries/TRK_MINNOW_DOLPHIN/asm/flush_cache.s \
	libraries/TRK_MINNOW_DOLPHIN/Portable/mem_TRK.c \
	libraries/TRK_MINNOW_DOLPHIN/asm/targimpl.s \
	libraries/TRK_MINNOW_DOLPHIN/asm/__exception.s \
	libraries/TRK_MINNOW_DOLPHIN/asm/dolphin_trk.s \
	libraries/TRK_MINNOW_DOLPHIN/asm/mpc_7xx_603e.s \
	libraries/TRK_MINNOW_DOLPHIN/asm/main_TRK.s \
	libraries/TRK_MINNOW_DOLPHIN/asm/dolphin_trk_glue.s \
	libraries/TRK_MINNOW_DOLPHIN/asm/targcont.s \
	libraries/amcstubs/asm/AmcExi2Stubs.s \
	libraries/odemustubs/asm/odemustubs.s \
	libraries/amcnotstub/amcnotstub.c
O_FILES := $(addsuffix .o,$(basename $(SOURCES)))
ALL_O_FILES := $(O_FILES)
$(ELF): $(O_FILES)

# mkbe.sel_ngc.rel sources
SOURCES := \
	src/sel_ngc_rel.c \
	asm/sel_ngc_rel.s
O_FILES := $(addsuffix .o,$(basename $(SOURCES)))
ALL_O_FILES += $(O_FILES)
mkbe.sel_ngc.plf: $(O_FILES)
mkbe.sel_ngc.rel: ELF2REL_ARGS := -i 1 -o 0x0 -l 0x1D -c 18
ALL_RELS += mkbe.sel_ngc.rel

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

# mkbe.rel_mini_fight.rel sources
SOURCES := \
	asm/mini_fight.s
O_FILES := $(addsuffix .o,$(basename $(SOURCES)))
ALL_O_FILES += $(O_FILES)
mkbe.rel_mini_fight.plf: $(O_FILES)
mkbe.rel_mini_fight.rel: ELF2REL_ARGS := -i 5 -o 0x85 -l 0x24 -c 17
ALL_RELS += mkbe.rel_mini_fight.rel

# mkbe.rel_mini_pilot.rel sources
SOURCES := \
	src/mini_pilot.c \
	asm/mini_pilot.s
O_FILES := $(addsuffix .o,$(basename $(SOURCES)))
ALL_O_FILES += $(O_FILES)
mkbe.rel_mini_pilot.plf: $(O_FILES)
mkbe.rel_mini_pilot.rel: ELF2REL_ARGS := -i 6 -o 0xA9 -l 0x24 -c 18
ALL_RELS += mkbe.rel_mini_pilot.rel

# mkbe.rel_mini_golf.rel sources
SOURCES := \
	src/mini_golf.s \
	asm/mini_golf.s
O_FILES := $(addsuffix .o,$(basename $(SOURCES)))
ALL_O_FILES += $(O_FILES)
mkbe.rel_mini_golf.plf: $(O_FILES)
mkbe.rel_mini_golf.rel: ELF2REL_ARGS := -i 7 -o 0xCD -l 0x23 -c 17
ALL_RELS += mkbe.rel_mini_golf.rel

# mkbe.rel_mini_billiards.rel sources
SOURCES := \
	src/mini_billiards.c \
	asm/mini_billiards.s
O_FILES := $(addsuffix .o,$(basename $(SOURCES)))
ALL_O_FILES += $(O_FILES)
mkbe.rel_mini_billiards.plf: $(O_FILES)
mkbe.rel_mini_billiards.rel: ELF2REL_ARGS := -i 8 -o 0xF0 -l 0x28 -c 17
ALL_RELS += mkbe.rel_mini_billiards.rel

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

#-------------------------------------------------------------------------------
# Test Recipes
#-------------------------------------------------------------------------------

EMULATOR ?= dolphin-emu-nogui
DVD_ROOT := GMBE8P/files
DVD_SYS  := GMBE8P/sys
DVD_FILES := $(DVD_SYS)/main.dol $(addprefix $(DVD_ROOT)/test/,$(ALL_RELS))

$(DVD_ROOT)/test/%.rel: %.rel
	cp $< $@
$(DVD_SYS)/main.dol: $(DOL)
	cp $< $@

test: $(DVD_FILES)
	$(EMULATOR) $(DVD_SYS)/main.dol

# These need an extra include directory and are incompatible with gcc
RUNTIME_OBJECTS := \
	libraries/os/__start.o \
	libraries/os/__ppc_eabi_init.o \
	libraries/PowerPC_EABI_Support/Runtime/Src/__mem.o \
	libraries/PowerPC_EABI_Support/Runtime/Src/ExceptionPPC.o \
	libraries/PowerPC_EABI_Support/Runtime/Src/__init_cpp_exceptions.o \
	libraries/PowerPC_EABI_Support/Runtime/Src/global_destructor_chain.o

$(RUNTIME_OBJECTS): CC_CHECK := true
$(RUNTIME_OBJECTS): SYSTEM_INCLUDE_DIRS += $(RUNTIME_INCLUDE_DIRS)

libraries/TRK_MINNOW_DOLPHIN/Portable/mem_TRK.o: CC_CHECK := true

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
