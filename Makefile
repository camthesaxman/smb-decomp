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

INCLUDE_DIRS := src
SYSTEM_INCLUDE_DIRS := include

RUNTIME_INCLUDE_DIRS := src/lib/Runtime.PPCEABI.H/Runtime/Inc

ASFLAGS      := -mgekko -I asm
CFLAGS       := -O4,p -nodefaults -proc gekko -fp hard -Cpp_exceptions off -enum int
CPPFLAGS     = $(addprefix -i ,$(INCLUDE_DIRS)) -I- $(addprefix -i ,$(SYSTEM_INCLUDE_DIRS))
LDFLAGS      := -fp hard -nodefaults

HOSTCFLAGS   := -Wall -O3 -s

CC_CHECK     := $(GCC) -Wall -Wextra -Wno-unused -Wno-main -Wno-unknown-pragmas -Wno-unused-variable -Wno-unused-parameter -Wno-sign-compare -Wno-missing-field-initializers -fsyntax-only -fno-builtin -nostdinc $(addprefix -I ,$(INCLUDE_DIRS) $(SYSTEM_INCLUDE_DIRS)) -DNONMATCHING

#-------------------------------------------------------------------------------
# Files
#-------------------------------------------------------------------------------

BASEROM  := baserom.bin
DOL      := supermonkeyball.dol
ELF      := $(DOL:.dol=.elf)
MAP      := $(DOL:.dol=.map)
LDSCRIPT := ldscript.lcf
# NOTE: the order of files listed here determines the link order
SOURCE_FILES := \
	asm/c++_exception_data.s \
	src/main.c \
	src/init.c \
	src/init_2.c \
	src/mathutil.c \
	src/game.c \
	asm/game.s \
	src/event.c \
	src/polydisp.c \
	asm/polydisp.s \
	src/camera.c \
	asm/code_0.s \
	asm/code_1.s \
	src/trig_tables.c \
	src/input.c \
	asm/input.s \
	src/perf.c \
	asm/sound.s \
	asm/code_2.s \
	asm/nl2ngc.s \
	asm/motload.s \
	asm/ball.s \
	asm/code.s \
	src/stage.c \
	asm/stage.s \
	src/background.c \
	asm/background.s \
	src/sprite.c \
	asm/sprite.s \
	asm/ord_tbl.s \
	asm/mot_ape.s \
	src/avdisp.c \
	src/load.c \
	asm/load.s \
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
O_FILES := $(addsuffix .o,$(basename $(SOURCE_FILES)))
DEP_FILES := $(addsuffix .dep,$(basename $(SOURCE_FILES)))

#-------------------------------------------------------------------------------
# Recipes
#-------------------------------------------------------------------------------

.PHONY: default

default: $(DOL)
	$(QUIET) $(SHA1SUM) -c supermonkeyball.sha1

$(DOL): $(ELF) $(ELF2DOL)
	@echo Converting $< to $@
	$(QUIET) $(ELF2DOL) $(ELF) $(DOL)

$(ELF): $(LDSCRIPT) $(O_FILES)
	@echo Linking ELF $@
	$(QUIET) $(LD) $(LDFLAGS) $(O_FILES) -map $(MAP) -lcf $(LDSCRIPT) -o $@
# The Metrowerks linker doesn't generate physical addresses in the ELF program headers. This fixes it somehow.
	$(QUIET) $(OBJCOPY) $(ELF) $(ELF)

%.o: %.s
	@echo Assembling $<
	$(QUIET) $(AS) $(ASFLAGS) -o $@ $<

# Canned recipe for compiling C or C++
# Uses CC_CHECK to check syntax and generate dependencies, compiles the file,
# then disassembles the object file
define COMPILE =
@echo Compiling $<
$(QUIET) $(CC_CHECK) -MMD -MF $(@:.o=.dep) -MT $@ $<
$(QUIET) $(CC) -c $(CFLAGS) $(CPPFLAGS) -o $@ $<
$(QUIET) $(OBJDUMP) -Drz $@ > $(@:.o=.dump)
endef

%.o: %.c
	$(COMPILE)
%.o: %.cpp
	$(COMPILE)
%.o: %.cp
	$(COMPILE)

clean:
	$(RM) $(DOL) $(ELF) $(MAP) $(ELF2DOL)
	find . -name '*.o' -exec rm {} +
	find . -name '*.dep' -exec rm {} +
	find . -name '*.dump' -exec rm {} +

# File-specific compiler flags
src/camera.o: CFLAGS += -inline auto
src/mathutil.o: CFLAGS += -inline auto
src/sprite.o:   CFLAGS += -inline auto
src/avdisp.o:   CFLAGS += -inline auto
src/DEMOPuts.o: CFLAGS += -inline auto
src/memcard.o: CFLAGS += -inline auto
src/stage.o: CFLAGS += -inline auto

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
-include $(DEP_FILES)

#-------------------------------------------------------------------------------
# Tool Recipes
#-------------------------------------------------------------------------------

$(ELF2DOL): tools/elf2dol.c
	@echo Building tool $@
	$(QUIET) $(HOSTCC) $(HOSTCFLAGS) -o $@ $^

print-% : ; $(info $* is a $(flavor $*) variable set to [$($*)]) @true
