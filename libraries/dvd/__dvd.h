struct bb2struct
{
	u32 _00;
	u32 _04;
	s32 _08;  // size?
	u32 FSTMaxLength;
	void* FSTLocationInRam;
};

void DVDReadAbsAsyncForBS(void *, struct bb2struct *, int, int, void (*)());
void DVDReset(void);
void DVDReadDiskID(void *, DVDDiskID *, void (*)());
