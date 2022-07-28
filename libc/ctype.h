#ifndef _CTYPE_H_
#define _CTYPE_H_

#define CTYPE_CNTRL  (1 << 0)
#define CTYPE_SPACE  (1 << 1)
#define CTYPE_BLANK  (1 << 2)
#define CTYPE_PUNCT  (1 << 3)
#define CTYPE_DIGIT  (1 << 4)
#define CTYPE_XDIGIT (1 << 5)
#define CTYPE_LOWER  (1 << 6)
#define CTYPE_UPPER  (1 << 7)

int tolower(int c);

#endif
