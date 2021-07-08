struct ARAMBlock
{
    s32 unk0;
    s32 entryNum;
    u32 aramAddr;
    u32 aramSize;
};

struct File
{
    u32 unk0;
    DVDFileInfo dvdFile;
    struct ARAMBlock unk40;
};

BOOL file_open(char *filename, struct File *file);
BOOL file_close(struct File *file);
s32 file_read(struct File *file, void *dest, u32 size, u32 offset);
u32 file_size(struct File *file);
