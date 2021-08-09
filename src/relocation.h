struct MinigameLinkInfo
{
    OSModuleInfo module;
    u32 bssSize;
    u8 filler24[0x34-0x24];
    void (*init)();
    void (*finish)();
};

struct MinigameLink
{
    struct MinigameLinkInfo *info;
    void *bss;
};

void minigame_link(char *name, struct MinigameLink *link);
void minigame_unlink(struct MinigameLink *link);
