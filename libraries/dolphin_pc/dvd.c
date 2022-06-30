#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <dolphin.h>

#define PATH_MAX 256

static char (*s_pathEntries)[PATH_MAX] = NULL;
static int s_pathEntriesCount = 0;

void DVDInit(void)
{
    chdir("GMBE8P/files");
}

BOOL DVDChangeDir(char *dir)
{
    //printf("DVDChangeDir: %s\n", dir);
    chdir(dir);
}

s32 DVDConvertPathToEntrynum(char *pathPtr)
{
    int i;
    FILE *f;

    printf("DVDConvertPathToEntrynum: %s\n", pathPtr);
    for (i = 0; i < s_pathEntriesCount; i++)
    {
        if (strcmp(pathPtr, s_pathEntries[i]) == 0)
            return i;
    }
    
    if (strlen(pathPtr) + 1 > PATH_MAX)
        return -1;
    
    // check if file exists
    f = fopen(pathPtr, "rb");
    if (f == NULL)
        return -1;
    fclose(f);
    
    // add new entry
    printf("size = %i\n", sizeof(*s_pathEntries));
    s_pathEntries = realloc(s_pathEntries, (s_pathEntriesCount + 1) * sizeof(*s_pathEntries));
    strcpy(s_pathEntries[s_pathEntriesCount], pathPtr);
    return s_pathEntriesCount++;
}

BOOL DVDOpen(char *fileName, DVDFileInfo *fileInfo)
{
    FILE *f;
    
    printf("DVDOpen: %s\n", fileName);
    f = fopen(fileName, "rb");
    if (f == NULL)
        return FALSE;
    fileInfo->cb.addr = f;
    fseek(f, 0, SEEK_END);
    fileInfo->length = ftell(f);
    return TRUE;
}

BOOL DVDClose(DVDFileInfo *fileInfo)
{
    FILE *f = fileInfo->cb.addr;
    
    if (f != NULL)
        fclose(f);
    fileInfo->cb.addr = NULL;
    return TRUE;
}
