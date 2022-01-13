.include "macros.inc"

.section .sbss

.global ResetCallback
ResetCallback:
	.skip 0x4
.global Down
Down:
	.skip 0x4
.global LastState
LastState:
	.skip 0x8
.global HoldUp
HoldUp:
	.skip 0x4
.global lbl_802F233C
lbl_802F233C:
	.skip 0x4
.global HoldDown
HoldDown:
	.skip 0x4
.global lbl_802F2344
lbl_802F2344:
	.skip 0x4
.global RunQueueBits
RunQueueBits:
	.skip 0x4
.global RunQueueHint
RunQueueHint:
	.skip 0x4
.global Reschedule
Reschedule:
	.skip 0x8
.global serEnabled
serEnabled:
	.skip 0x8
.global __DBInterface
__DBInterface:
	.skip 0x4
.global DBVerbose
DBVerbose:
	.skip 0x4
.global StopAtNextInt
StopAtNextInt:
	.skip 0x4
.global LastLength
LastLength:
	.skip 0x4
.global _DVDLow_Callback
_DVDLow_Callback:
	.skip 0x4
.global ResetCoverCallback
ResetCoverCallback:
	.skip 0x4
.global LastResetEnd
LastResetEnd:
	.skip 0x4
.global lbl_802F237C
lbl_802F237C:
	.skip 0x4
.global ResetOccurred
ResetOccurred:
	.skip 0x4
.global WaitingCoverClose
WaitingCoverClose:
	.skip 0x4
.global Breaking
Breaking:
	.skip 0x4
.global WorkAroundType
WorkAroundType:
	.skip 0x4
.global WorkAroundSeekLocation
WorkAroundSeekLocation:
	.skip 0x8
.global LastReadFinished
LastReadFinished:
	.skip 0x4
.global lbl_802F239C
lbl_802F239C:
	.skip 0x4
.global LastReadIssued
LastReadIssued:
	.skip 0x4
.global lbl_802F23A4
lbl_802F23A4:
	.skip 0x4
.global LastCommandWasRead
LastCommandWasRead:
	.skip 0x4
.global NextCommandNumber
NextCommandNumber:
	.skip 0x4
.global _DVDFS_BootInfo
_DVDFS_BootInfo:
	.skip 0x4
.global FstStart
FstStart:
	.skip 0x4
.global FstStringStart
FstStringStart:
	.skip 0x4
.global MaxEntryNum
MaxEntryNum:
	.skip 0x4
.global currentDirectory
currentDirectory:
	.skip 0x4
.global __DVDLongFileNameFlag
__DVDLongFileNameFlag:
	.skip 0x4
.global __DVDThreadQueue
__DVDThreadQueue:
	.skip 0x8
.global executing
executing:
	.skip 0x4
.global currID
currID:
	.skip 0x4
.global bootInfo
bootInfo:
	.skip 0x4
.global PauseFlag
PauseFlag:
	.skip 0x4
.global PausingFlag
PausingFlag:
	.skip 0x4
.global AutoFinishing
AutoFinishing:
	.skip 0x4
.global FatalErrorFlag
FatalErrorFlag:
	.skip 0x4
.global CurrCommand
CurrCommand:
	.skip 0x4
.global Canceling
Canceling:
	.skip 0x4
.global CancelCallback
CancelCallback:
	.skip 0x4
.global ResumeFromHere
ResumeFromHere:
	.skip 0x4
.global CancelLastError
CancelLastError:
	.skip 0x4
.global LastError
LastError:
	.skip 0x4
.global NumInternalRetry
NumInternalRetry:
	.skip 0x4
.global ResetRequired
ResetRequired:
	.skip 0x4
.global FirstTimeInBootrom
FirstTimeInBootrom:
	.skip 0x4
.global DVDInitialized
DVDInitialized:
	.skip 0x4
.global _DVD_LastState
_DVD_LastState:
	.skip 0x4
.global status
status:
	.skip 0x4
.global bb2
bb2:
	.skip 0x4
.global idTmp
idTmp:
	.skip 0x8
.global retraceCount
retraceCount:
	.skip 0x4
.global shdwChangeMode
shdwChangeMode:
	.skip 0x4
.global flushFlag
flushFlag:
	.skip 0x4
.global retraceQueue
retraceQueue:
	.skip 0x8
.global PreCB
PreCB:
	.skip 0x4
.global PostCB
PostCB:
	.skip 0x4
.global encoderType
encoderType:
	.skip 0x4
.global displayOffsetH
displayOffsetH:
	.skip 0x2
.global displayOffsetV
displayOffsetV:
	.skip 0x6
.global changeMode
changeMode:
	.skip 0x4
.global changed
changed:
	.skip 0x4
.global shdwChanged
shdwChanged:
	.skip 0x4
.global lbl_802F245C
lbl_802F245C:
	.skip 0x4
.global Initialized
Initialized:
	.skip 0x8
.global lbl_802F2468
lbl_802F2468:
	.skip 0x4
.global EnabledBits
EnabledBits:
	.skip 0x4
.global ResettingBits
ResettingBits:
	.skip 0x4
.global ProbingBits
ProbingBits:
	.skip 0x4
.global RecalibrateBits
RecalibrateBits:
	.skip 0x4
.global WaitingBits
WaitingBits:
	.skip 0x4
.global CheckingBits
CheckingBits:
	.skip 0x4
.global cmdTypeAndStatus
cmdTypeAndStatus:
	.skip 0x4
.global recalibrated
recalibrated:
	.skip 0x4
.global __PADSpec
__PADSpec:
	.skip 0x4
.global __PADFixBits
__PADFixBits:
	.skip 0x8
.global __AIS_Callback
__AIS_Callback:
	.skip 0x4
.global __AID_Callback
__AID_Callback:
	.skip 0x4
.global __CallbackStack
__CallbackStack:
	.skip 0x4
.global __OldStack
__OldStack:
	.skip 0x4
.global __AI_init_flag
__AI_init_flag:
	.skip 0x8
.global bound_32KHz
bound_32KHz:
	.skip 0x4
.global lbl_802F24B4
lbl_802F24B4:
	.skip 0x4
.global bound_48KHz
bound_48KHz:
	.skip 0x4
.global lbl_802F24BC
lbl_802F24BC:
	.skip 0x4
.global min_wait
min_wait:
	.skip 0x4
.global lbl_802F24C4
lbl_802F24C4:
	.skip 0x4
.global max_wait
max_wait:
	.skip 0x4
.global lbl_802F24CC
lbl_802F24CC:
	.skip 0x4
.global buffer
buffer:
	.skip 0x4
.global lbl_802F24D4
lbl_802F24D4:
	.skip 0x4
.global __AR_Callback
__AR_Callback:
	.skip 0x4
.global __AR_Size
__AR_Size:
	.skip 0x4
.global __AR_StackPointer
__AR_StackPointer:
	.skip 0x4
.global __AR_FreeBlocks
__AR_FreeBlocks:
	.skip 0x4
.global __AR_BlockLength
__AR_BlockLength:
	.skip 0x4
.global __AR_init_flag
__AR_init_flag:
	.skip 0x4
.global __ARQRequestQueueHi
__ARQRequestQueueHi:
	.skip 0x4
.global __ARQRequestTailHi
__ARQRequestTailHi:
	.skip 0x4
.global __ARQRequestQueueLo
__ARQRequestQueueLo:
	.skip 0x4
.global __ARQRequestTailLo
__ARQRequestTailLo:
	.skip 0x4
.global __ARQRequestPendingHi
__ARQRequestPendingHi:
	.skip 0x4
.global __ARQRequestPendingLo
__ARQRequestPendingLo:
	.skip 0x4
.global __ARQCallbackHi
__ARQCallbackHi:
	.skip 0x4
.global __ARQCallbackLo
__ARQCallbackLo:
	.skip 0x4
.global __ARQChunkSize
__ARQChunkSize:
	.skip 0x4
.global __ARQ_init_flag
__ARQ_init_flag:
	.skip 0x4
.global __DSP_init_flag
__DSP_init_flag:
	.skip 0x4
.global __DSP_tmp_task
__DSP_tmp_task:
	.skip 0x4
.global __DSP_curr_task
__DSP_curr_task:
	.skip 0x4
.global __DSP_last_task
__DSP_last_task:
	.skip 0x4
.global __DSP_first_task
__DSP_first_task:
	.skip 0x8
.global __DSP_rude_task_pending
__DSP_rude_task_pending:
	.skip 0x4
.global __DSP_rude_task
__DSP_rude_task:
	.skip 0x4
.global __CARDDiskID
__CARDDiskID:
	.skip 0x8
.global __piReg
__piReg:
	.skip 0x4
.global __cpReg
__cpReg:
	.skip 0x4
.global __peReg
__peReg:
	.skip 0x4
.global __memReg
__memReg:
	.skip 0x4
.global __GXCurrentThread
__GXCurrentThread:
	.skip 0x4
.global CPGPLinked
CPGPLinked:
	.skip 0x4
.global GXOverflowSuspendInProgress
GXOverflowSuspendInProgress:
	.skip 0x4
.global BreakPointCB
BreakPointCB:
	.skip 0x4
.global __GXOverflowCount
__GXOverflowCount:
	.skip 0x4
.global GPFifo
GPFifo:
	.skip 0x4
.global CPUFifo
CPUFifo:
	.skip 0x8
.global TokenCB
TokenCB:
	.skip 0x4
.global DrawDoneCB
DrawDoneCB:
	.skip 0x4
.global DrawDone
DrawDone:
	.skip 0x4
.global FinishQueue
FinishQueue:
	.skip 0xC
.global OldCPUFifo
OldCPUFifo:
	.skip 0x8
.global magic
magic:
	.skip 0x4
.global PerfAlloc
PerfAlloc:
	.skip 0x4
.global PerfFree
PerfFree:
	.skip 0x4
.global DSCB
DSCB:
	.skip 0x4
.global PERFCurrSample
PERFCurrSample:
	.skip 0x4
.global PERFCurrFrame
PERFCurrFrame:
	.skip 0x4
.global PERFEvents
PERFEvents:
	.skip 0x4
.global PERFFrames
PERFFrames:
	.skip 0x4
.global PERFNumSamples
PERFNumSamples:
	.skip 0x4
.global PERFNumEvents
PERFNumEvents:
	.skip 0x4
.global PERFNumFrames
PERFNumFrames:
	.skip 0x8
.global DrawFrameMax
DrawFrameMax:
	.skip 0x4
.global DrawFrameH
DrawFrameH:
	.skip 0x4
.global MaxBusTransactions
MaxBusTransactions:
	.skip 0x4
.global bDrawBWBarKey
bDrawBWBarKey:
	.skip 0x4
.global lastx
lastx:
	.skip 0x4
.global GameDrawInit
GameDrawInit:
	.skip 0x4
.global cseq
cseq:
	.skip 0x4
.global noteFree
noteFree:
	.skip 0x4
.global curSeqId
curSeqId:
	.skip 0x4
.global curFadeOutState
curFadeOutState:
	.skip 0x4
.global seq_next_id
seq_next_id:
	.skip 0x4
.global seqFreeRoot
seqFreeRoot:
	.skip 0x4
.global seqPausedRoot
seqPausedRoot:
	.skip 0x4
.global seqActiveRoot
seqActiveRoot:
	.skip 0x4
.global sndActive_2
sndActive_2:
	.skip 0x1
.global synthJobTableIndex
synthJobTableIndex:
	.skip 0x3
.global synthITDDefault
synthITDDefault:
	.skip 0x8
.global synthAuxBMIDISet
synthAuxBMIDISet:
	.skip 0x4
.global synthAuxBMIDI
synthAuxBMIDI:
	.skip 0x4
.global synthAuxAMIDISet
synthAuxAMIDISet:
	.skip 0x4
.global synthAuxAMIDI
synthAuxAMIDI:
	.skip 0x4
.global synthMasterFaderPauseActiveFlags
synthMasterFaderPauseActiveFlags:
	.skip 0x4
.global synthMasterFaderActiveFlags
synthMasterFaderActiveFlags:
	.skip 0x4
.global synthFlags
synthFlags:
	.skip 0x1
.global lbl_802F261D
lbl_802F261D:
	.skip 0x3
.global synthVoice
synthVoice:
	.skip 0x4
.global synthMessageCallback
synthMessageCallback:
	.skip 0x4
.global synthIdleWaitActive
synthIdleWaitActive:
	.skip 0x8
.global synthRealTime
synthRealTime:
	.skip 0x4
.global lbl_802F2634
lbl_802F2634:
	.skip 0x4
.global streamCallCnt
streamCallCnt:
	.skip 0x1
.global streamCallDelay
streamCallDelay:
	.skip 0x3
.global nextPublicID
nextPublicID:
	.skip 0x4
.global dataSmpSDirNum
dataSmpSDirNum:
	.skip 0x2
.global dataCurveNum
dataCurveNum:
	.skip 0x2
.global dataKeymapNum
dataKeymapNum:
	.skip 0x2
.global dataLayerNum
dataLayerNum:
	.skip 0x2
.global dataMacTotal
dataMacTotal:
	.skip 0x2
.global dataFXGroupNum
dataFXGroupNum:
	.skip 0x2
.global lbl_802F264C
lbl_802F264C:
	.skip 0x4
.global lbl_802F2650
lbl_802F2650:
	.skip 0x4
.global lbl_802F2654
lbl_802F2654:
	.skip 0x8
.global lbl_802F265C
lbl_802F265C:
	.skip 0x4
.global lbl_802F2660
lbl_802F2660:
	.skip 0x4
.global lbl_802F2664
lbl_802F2664:
	.skip 0x4
.global lbl_802F2668
lbl_802F2668:
	.skip 0x8
.global lbl_802F2670
lbl_802F2670:
	.skip 0x4
.global lbl_802F2674
lbl_802F2674:
	.skip 0x8
.global lbl_802F267C
lbl_802F267C:
	.skip 0x4
.global lbl_802F2680
lbl_802F2680:
	.skip 0x8
.global DebugMacroSteps
DebugMacroSteps:
	.skip 0x4
.global macActiveMacroRoot
macActiveMacroRoot:
	.skip 0x4
.global macTimeQueueRoot
macTimeQueueRoot:
	.skip 0x8
.global macRealTime
macRealTime:
	.skip 0x4
.global lbl_802F269C
lbl_802F269C:
	.skip 0x4
.global cstep
cstep:
	.skip 0x8
.global vidCurrentId
vidCurrentId:
	.skip 0x4
.global vidRoot
vidRoot:
	.skip 0x4
.global vidFree
vidFree:
	.skip 0x4
.global voicePrioSortRootListRoot
voicePrioSortRootListRoot:
	.skip 0x2
.global voiceMusicRunning
voiceMusicRunning:
	.skip 0x1
.global voiceFxRunning
voiceFxRunning:
	.skip 0x1
.global voiceListInsert
voiceListInsert:
	.skip 0x1
.global voiceListRoot
voiceListRoot:
	.skip 0x7
.global lbl_802F26C0
lbl_802F26C0:
	.skip 0x8
.global dspARAMZeroBuffer
dspARAMZeroBuffer:
	.skip 0x4
.global dspCmdLastLoad
dspCmdLastLoad:
	.skip 0x4
.global dspCmdLastBase
dspCmdLastBase:
	.skip 0x4
.global dspCmdLastSize
dspCmdLastSize:
	.skip 0x4
.global dspCmdCurBase
dspCmdCurBase:
	.skip 0x4
.global dspCmdMaxPtr
dspCmdMaxPtr:
	.skip 0x4
.global dspCmdPtr
dspCmdPtr:
	.skip 0x4
.global dspCmdFirstSize
dspCmdFirstSize:
	.skip 0x4
.global dspCmdList
dspCmdList:
	.skip 0x4
.global dspHRTFOn
dspHRTFOn:
	.skip 0x4
.global dspHrtfHistoryBuffer
dspHrtfHistoryBuffer:
	.skip 0x4
.global dspSurround
dspSurround:
	.skip 0x4
.global dspITDBuffer
dspITDBuffer:
	.skip 0x4
.global dspVoice
dspVoice:
	.skip 0x4
.global salMessageCallback
salMessageCallback:
	.skip 0x8
.global s3dCallCnt
s3dCallCnt:
	.skip 0x4
.global s3dEmitterRoot
s3dEmitterRoot:
	.skip 0x4
.global s3dListenerRoot
s3dListenerRoot:
	.skip 0x4
.global s3dRoomRoot
s3dRoomRoot:
	.skip 0x4
.global s3dDoorRoot
s3dDoorRoot:
	.skip 0x4
.global snd_used_studios
snd_used_studios:
	.skip 0x4
.global snd_base_studio
snd_base_studio:
	.skip 0x1
.global snd_max_studios
snd_max_studios:
	.skip 0x1
.global startGroupNum
startGroupNum:
	.skip 0x1
.global startListNumnum
startListNumnum:
	.skip 0x1
.global runListNum
runListNum:
	.skip 0x4
.global salTimeOffset
salTimeOffset:
	.skip 0x4
.global salHooks
salHooks:
	.skip 0x4
.global lbl_802F2730
lbl_802F2730:
	.skip 0x4
.global salNumVoices
salNumVoices:
	.skip 0x1
.global salAuxFrame
salAuxFrame:
	.skip 0x1
.global salFrame
salFrame:
	.skip 0x2
.global aramTop
aramTop:
	.skip 0x4
.global aramWrite
aramWrite:
	.skip 0x4
.global aramStream
aramStream:
	.skip 0x4
.global aramQueueWrite
aramQueueWrite:
	.skip 0x1
.global aramQueueValid
aramQueueValid:
	.skip 0x3
.global aramUsedStreamBuffers
aramUsedStreamBuffers:
	.skip 0x4
.global aramFreeStreamBuffers
aramFreeStreamBuffers:
	.skip 0x4
.global aramIdleStreamBuffers
aramIdleStreamBuffers:
	.skip 0x8
.global userCallback
userCallback:
	.skip 0x4
.global salAIBufferBase
salAIBufferBase:
	.skip 0x4
.global salDspIsDone
salDspIsDone:
	.skip 0x4
.global salLogicIsWaiting
salLogicIsWaiting:
	.skip 0x4
.global salLogicActive
salLogicActive:
	.skip 0x4
.global salLastTick
salLastTick:
	.skip 0x4
.global salDspInitIsDone
salDspInitIsDone:
	.skip 0x4
.global hwIrqLevel
hwIrqLevel:
	.skip 0x4
.global oldState
oldState:
	.skip 0x4
.global salAIBufferIndex
salAIBufferIndex:
	.skip 0x4
.global __DTKCurrentTrack
__DTKCurrentTrack:
	.skip 0x4
.global __DTKPlayListHead
__DTKPlayListHead:
	.skip 0x4
.global __DTKPlayListTail
__DTKPlayListTail:
	.skip 0x4
.global __DTKState
__DTKState:
	.skip 0x4
.global __DTKTempState
__DTKTempState:
	.skip 0x4
.global __DTKRepeatMode
__DTKRepeatMode:
	.skip 0x4
.global __DTKPosition
__DTKPosition:
	.skip 0x4
.global __DTKInterruptFrequency
__DTKInterruptFrequency:
	.skip 0x4
.global __DTKVolumeL
__DTKVolumeL:
	.skip 0x1
.global __DTKVolumeR
__DTKVolumeR:
	.skip 0x3
.global __DTKTrackEnded
__DTKTrackEnded:
	.skip 0x4
.global __global_destructor_chain
__global_destructor_chain:
	.skip 0x8
.global __aborting
__aborting:
	.skip 0x4
.global atexit_curr_func
atexit_curr_func:
	.skip 0x4
.global __atexit_curr_func
__atexit_curr_func:
	.skip 0x4
.global __stdio_exit
__stdio_exit:
	.skip 0x4
.global __console_exit
__console_exit:
	.skip 0x8
.global initialized_60
initialized_60:
	.skip 0xC
.global fExi2Selected
fExi2Selected:
	.skip 0x4
.global TRK_Callback
TRK_Callback:
	.skip 0x8
.global MTRCallback
MTRCallback:
	.skip 0x4
.global DBGCallback
DBGCallback:
	.skip 0x4
.global SendMailData
SendMailData:
	.skip 0x4
.global RecvDataLeng
RecvDataLeng:
	.skip 0x4
.global pEXIInputFlag
pEXIInputFlag:
	.skip 0x4
.global EXIInputFlag
EXIInputFlag:
	.skip 0x1

.section .bss

.global Ecb
Ecb:
	.skip 0xB8
.global Header
Header:
	.skip 0x20
.global Scb
Scb:
	.skip 0x58
.global Packet
Packet:
	.skip 0x80
.global Alarm
Alarm:
	.skip 0xA0
.global lbl_802C6E78
lbl_802C6E78:
	.skip 0x9E8
.global CommandList
CommandList:
	.skip 0x68
.global AlarmForTimeout
AlarmForTimeout:
	.skip 0x78
.global tmpBuffer
tmpBuffer:
	.skip 0x80
.global DummyCommandBlock
DummyCommandBlock:
	.skip 0x58
.global WaitingQueue
WaitingQueue:
	.skip 0x20
.global bb2Buf
bb2Buf:
	.skip 0x40
.global block
block:
	.skip 0x30
.global regs
regs:
	.skip 0x78
.global shdwRegs
shdwRegs:
	.skip 0x78
.global HorVer
HorVer:
	.skip 0x58
.global PADType
PADType:
	.skip 0x10
.global Type
Type:
	.skip 0x10
.global Origin
Origin:
	.skip 0x50
.global __CARDBlock
__CARDBlock:
	.skip 0x210
.global __CARDDiskNone
__CARDDiskNone:
	.skip 0x20
.global gxData
gxData:
	.skip 0x578
.global lbl_802C8408
lbl_802C8408:
	.skip 0x288
.global lbl_802C8690
lbl_802C8690:
	.skip 0x518
.global PERFAlarm
PERFAlarm:
	.skip 0x28
.global mId
mId:
	.skip 0x90
.global seqNote
seqNote:
	.skip 0x1400
.global lbl_802CA060
lbl_802CA060:
	.skip 0xBD20
.global lbl_802D5D80
lbl_802D5D80:
	.skip 0x100
.global lbl_802D5E80
lbl_802D5E80:
	.skip 0x3C0
.global lbl_802D6240
lbl_802D6240:
	.skip 0x214
.global lbl_802D6454
lbl_802D6454:
	.skip 0x600
.global lbl_802D6A54
lbl_802D6A54:
	.skip 0x40
.global lbl_802D6A94
lbl_802D6A94:
	.skip 0x10
.global lbl_802D6AA4
lbl_802D6AA4:
	.skip 0x10
.global lbl_802D6AB4
lbl_802D6AB4:
	.skip 0x10
.global lbl_802D6AC4
lbl_802D6AC4:
	.skip 0x10
.global lbl_802D6AD4
lbl_802D6AD4:
	.skip 0x40
.global lbl_802D6B14
lbl_802D6B14:
	.skip 0x240
.global lbl_802D6D54
lbl_802D6D54:
	.skip 0x244
.global lbl_802D6F98
lbl_802D6F98:
	.skip 0x1800
.global lbl_802D8798
lbl_802D8798:
	.skip 0x600
.global lbl_802D8D98
lbl_802D8D98:
	.skip 0x4000
.global lbl_802DCD98
lbl_802DCD98:
	.skip 0x1400
.global lbl_802DE198
lbl_802DE198:
	.skip 0x4800
.global lbl_802E2998
lbl_802E2998:
	.skip 0x438
.global lbl_802E2DD0
lbl_802E2DD0:
	.skip 0x20
.global lbl_802E2DF0
lbl_802E2DF0:
	.skip 0x800
.global lbl_802E35F0
lbl_802E35F0:
	.skip 0x80
.global lbl_802E3670
lbl_802E3670:
	.skip 0x640
.global lbl_802E3CB0
lbl_802E3CB0:
	.skip 0x100
.global lbl_802E3DB0
lbl_802E3DB0:
	.skip 0x400
.global lbl_802E41B0
lbl_802E41B0:
	.skip 0x6E0
.global lbl_802E4890
lbl_802E4890:
	.skip 0x50
.global lbl_802E48E0
lbl_802E48E0:
	.skip 0x6D0
.global lbl_802E4FB0
lbl_802E4FB0:
	.skip 0x80
.global lbl_802E5030
lbl_802E5030:
	.skip 0x40
.global lbl_802E5070
lbl_802E5070:
	.skip 0x4300
.global lbl_802E9370
lbl_802E9370:
	.skip 0x2180
.global lbl_802EB4F0
lbl_802EB4F0:
	.skip 0x80
.global lbl_802EB570
lbl_802EB570:
	.skip 0x40
.global lbl_802EB5B0
lbl_802EB5B0:
	.skip 0x200
.global lbl_802EB7B0
lbl_802EB7B0:
	.skip 0x80
.global lbl_802EB830
lbl_802EB830:
	.skip 0x40
.global lbl_802EB870
lbl_802EB870:
	.skip 0x200
.global lbl_802EBA70
lbl_802EBA70:
	.skip 0x410
.global lbl_802EBE80
lbl_802EBE80:
	.skip 0x2060
.global __block_for_run_callback
__block_for_run_callback:
	.skip 0x30
.global __block_for_prep_callback
__block_for_prep_callback:
	.skip 0x30
.global __block_for_stream_status
__block_for_stream_status:
	.skip 0x30
.global __block_for_ais_isr
__block_for_ais_isr:
	.skip 0x30
.global __block_for_set_state
__block_for_set_state:
	.skip 0x30
.global __block_for_next_track
__block_for_next_track:
	.skip 0x30
.global __block_for_prev_track
__block_for_prev_track:
	.skip 0x30
.global fragmentinfo
fragmentinfo:
	.skip 0x10
.global lbl_802EE040
lbl_802EE040:
	.skip 0x100
.global lbl_802EE140
lbl_802EE140:
	.skip 0x100
.global lbl_802EE240
lbl_802EE240:
	.skip 0x28
.global lbl_802EE268
lbl_802EE268:
	.skip 0x8
.global lbl_802EE270
lbl_802EE270:
	.skip 0x19B0
.global lbl_802EFC20
lbl_802EFC20:
	.skip 0x14
.global lbl_802EFC34
lbl_802EFC34:
	.skip 0x4
.global lbl_802EFC38
lbl_802EFC38:
	.skip 0x8
.global lbl_802EFC40
lbl_802EFC40:
	.skip 0x4
.global lbl_802EFC44
lbl_802EFC44:
	.skip 0x94
.global lbl_802EFCD8
lbl_802EFCD8:
	.skip 0x10
.global gTRKState
gTRKState:
	.skip 0xA8
.global gTRKCPUState
gTRKCPUState:
	.skip 0x430
.global lbl_802F01C0
lbl_802F01C0:
	.skip 0x8
.global lbl_802F01C8
lbl_802F01C8:
	.skip 0x18
