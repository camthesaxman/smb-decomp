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
	asm/lib/base/PPCArch.s \
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
	asm/lib/PowerPC_EABI_Support/Runtime/Src/__va_arg.s \
	asm/lib/PowerPC_EABI_Support/Runtime/Src/global_destructor_chain.s \
	asm/lib/PowerPC_EABI_Support/Runtime/Src/ExceptionPPC.s \
	asm/lib/PowerPC_EABI_Support/Runtime/Src/runtime.s \
	asm/lib/PowerPC_EABI_Support/Runtime/Src/__init_cpp_exceptions.s \
	asm/lib/PowerPC_EABI_Support/Msl/MSL_C/MSL_Common/Src/abort_exit.s \
	asm/lib/PowerPC_EABI_Support/Msl/MSL_C/MSL_Common_Embedded/Src/ansi_fp.s \
	asm/lib/PowerPC_EABI_Support/Msl/MSL_C/MSL_Common/Src/buffer_io.s \
	asm/lib/PowerPC_EABI_Support/Msl/MSL_C/MSL_Common/Src/char_io.s \
	asm/lib/PowerPC_EABI_Support/Msl/MSL_C/PPC_EABI/SRC/critical_regions.ppc_eabi.s \
	asm/lib/PowerPC_EABI_Support/Msl/MSL_C/MSL_Common/Src/ctype.s \
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
	asm/lib/TRK_MINNOW_DOLPHIN/mem_TRK.s \
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
