#ifndef _DOLPHIN_GXDISPLIST_H_
#define _DOLPHIN_GXDISPLIST_H_

void GXBeginDisplayList(void *list, u32 size);
u32 GXEndDisplayList(void);
void GXCallDisplayList( void *list, u32 nbytes);

#endif
