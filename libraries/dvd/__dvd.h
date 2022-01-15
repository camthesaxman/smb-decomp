struct bb2struct
{
	u32 _00;
	u32 _04;
	s32 _08;  // size?
	u32 FSTMaxLength;
	void* FSTLocationInRam;
};

extern u8 bb2Buf[0x3F];
extern u8 block[0x30];

void DVDReadAbsAsyncForBS(void *, struct bb2struct *, int, int, void (*)());
void DVDReset(void);
void DVDReadDiskID(void *, DVDDiskID *, void (*)());
