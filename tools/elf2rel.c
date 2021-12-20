#include <assert.h>
#include <stdarg.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>

#ifndef MAX
#define MAX(a, b)	(((a) > (b)) ? (a) : (b))
#endif

#ifndef MIN
#define MIN(a, b)	(((a) < (b)) ? (a) : (b))
#endif

#define ARRAY_COUNT(arr) (sizeof(arr)/sizeof((arr)[0]))

// Relevant portions of elf.h

typedef uint32_t Elf32_Addr;
typedef uint32_t Elf32_Off;
typedef uint32_t Elf32_Word;
typedef	int32_t  Elf32_Sword;
typedef uint16_t Elf32_Half;
typedef uint16_t Elf32_Section;

#define EI_NIDENT (16)

typedef struct
{
  unsigned char     e_ident[EI_NIDENT];        /* Magic number and other info */
  Elf32_Half        e_type;                        /* Object file type */
  Elf32_Half        e_machine;                /* Architecture */
  Elf32_Word        e_version;                /* Object file version */
  Elf32_Addr        e_entry;                /* Entry point virtual address */
  Elf32_Off         e_phoff;                /* Program header table file offset */
  Elf32_Off         e_shoff;                /* Section header table file offset */
  Elf32_Word        e_flags;                /* Processor-specific flags */
  Elf32_Half        e_ehsize;                /* ELF header size in bytes */
  Elf32_Half        e_phentsize;                /* Program header table entry size */
  Elf32_Half        e_phnum;                /* Program header table entry count */
  Elf32_Half        e_shentsize;                /* Section header table entry size */
  Elf32_Half        e_shnum;                /* Section header table entry count */
  Elf32_Half        e_shstrndx;                /* Section header string table index */
} Elf32_Ehdr;

#define EI_CLASS    4            /* File class byte index */
#define ELFCLASS32  1            /* 32-bit objects */

#define EI_DATA            5            /* Data encoding byte index */
#define ELFDATA2MSB 2            /* 2's complement, big endian */

#define EM_PPC            20        /* PowerPC */

typedef struct
{
  Elf32_Word        sh_name;                /* Section name (string tbl index) */
  Elf32_Word        sh_type;                /* Section type */
  Elf32_Word        sh_flags;                /* Section flags */
  Elf32_Addr        sh_addr;                /* Section virtual addr at execution */
  Elf32_Off        sh_offset;                /* Section file offset */
  Elf32_Word        sh_size;                /* Section size in bytes */
  Elf32_Word        sh_link;                /* Link to another section */
  Elf32_Word        sh_info;                /* Additional section information */
  Elf32_Word        sh_addralign;                /* Section alignment */
  Elf32_Word        sh_entsize;                /* Entry size if section holds table */
} Elf32_Shdr;

#define SHT_PROGBITS	  1		/* Program data */
#define SHT_SYMTAB	  2		/* Symbol table */
#define SHT_STRTAB	  3		/* String table */
#define SHT_RELA	  4		/* Relocation entries with addends */
#define SHT_NOBITS	  8		/* Program space with no data (bss) */

#define SHF_ALLOC	     (1 << 1)	/* Occupies memory during execution */
#define SHF_EXECINSTR             (1 << 2)        /* Executable */

typedef struct
{
  Elf32_Word        st_name;                /* Symbol name (string tbl index) */
  Elf32_Addr        st_value;                /* Symbol value */
  Elf32_Word        st_size;                /* Symbol size */
  unsigned char        st_info;                /* Symbol type and binding */
  unsigned char        st_other;                /* Symbol visibility */
  Elf32_Section        st_shndx;                /* Section index */
} Elf32_Sym;

#define ELF32_ST_TYPE(val)        ((val) & 0xf)

/* Legal values for ST_TYPE subfield of st_info (symbol type).  */

#define STT_NOTYPE	0		/* Symbol type is unspecified */
#define STT_FUNC    2            /* Symbol is a code object */

typedef struct
{
  Elf32_Addr	r_offset;		/* Address */
  Elf32_Word	r_info;			/* Relocation type and symbol index */
  Elf32_Sword	r_addend;		/* Addend */
} Elf32_Rela;

/* How to extract and insert information held in the r_info field.  */

#define ELF32_R_SYM(val)		((val) >> 8)
#define ELF32_R_TYPE(val)		((val) & 0xff)

#define R_PPC_NONE		0
#define R_PPC_ADDR32		1	/* 32bit absolute address */
#define R_PPC_ADDR24		2	/* 26bit address, 2 bits ignored.  */
#define R_PPC_ADDR16		3	/* 16bit absolute address */
#define R_PPC_ADDR16_LO		4	/* lower 16bit of absolute address */
#define R_PPC_ADDR16_HI		5	/* high 16bit of absolute address */
#define R_PPC_ADDR16_HA		6	/* adjusted high 16bit */
#define R_PPC_ADDR14		7	/* 16bit address, 2 bits ignored */
#define R_PPC_ADDR14_BRTAKEN	8
#define R_PPC_ADDR14_BRNTAKEN	9
#define R_PPC_REL24		10	/* PC relative 26 bit */
#define R_PPC_REL14		11	/* PC relative 16 bit */

#define R_DOLPHIN_SECTION 202
#define R_DOLPHIN_END     203

const char *reloc_type_name(int type)
{
#define NAMEENTRY(name) [name] = #name
    static const char *names[] =
    {
        NAMEENTRY(R_PPC_NONE),
        NAMEENTRY(R_PPC_ADDR32),
        NAMEENTRY(R_PPC_ADDR24),
        NAMEENTRY(R_PPC_ADDR16_LO),
        NAMEENTRY(R_PPC_ADDR16_HA),
        NAMEENTRY(R_PPC_REL24),
        NAMEENTRY(R_PPC_REL14),
    };
#undef NAMEENTRY
    if (type > ARRAY_COUNT(names) || names[type] == NULL)
        return "(unknown)";
    return names[type];
}

static int is_supported_reloc_type(int relocType)
{
    switch (relocType)
    {
    case R_PPC_ADDR32:
    case R_PPC_ADDR24:
    case R_PPC_ADDR16_LO:
    case R_PPC_ADDR16_HA:
    case R_PPC_REL24:
    case R_PPC_REL14:
        return 1;
    }
    return 0;
}

void fatal_error(const char *msg, ...)
{
    va_list args;

    va_start(args, msg);
    vfprintf(stderr, msg, args);
    va_end(args);
    exit(1);
}

// converts values to the proper byte order

static uint16_t read_u16be(uint16_t *n)
{
    union { uint16_t n; uint8_t b[2]; } u;
    u.n = *n;
    return (u.b[1]) | (u.b[0] << 8);
}

static uint32_t read_u32be(uint32_t *n)
{
    union { uint32_t n; uint8_t b[4]; } u;
    u.n = *n;
    return (u.b[3]) | (u.b[2] << 8) | (u.b[1] << 16) | (u.b[0] << 24);
}

static int32_t read_s32be(int32_t *n)
{
    union { int32_t n; uint8_t b[4]; } u;
    u.n = *n;
    return (u.b[3]) | (u.b[2] << 8) | (u.b[1] << 16) | (u.b[0] << 24);
}

static void write_u32be(uint32_t n, uint32_t *dest)
{
    uint8_t *b = (uint8_t *)dest;
    b[0] = n >> 24;
    b[1] = n >> 16;
    b[2] = n >> 8;
    b[3] = n >> 0;
}

static void write_u16be(uint16_t n, uint16_t *dest)
{
    uint8_t *b = (uint8_t *)dest;
    b[0] = n >> 8;
    b[1] = n >> 0;
}

static int read_checked(FILE *f, size_t offset, void *out, size_t size)
{
    return fseek(f, offset, SEEK_SET) == 0
        && fread(out, size, 1, f) == 1;
}

static int write_checked(FILE *f, size_t offset, void *in, size_t size)
{
    return fseek(f, offset, SEEK_SET) == 0
        && fwrite(in, size, 1, f) == 1;
}

struct RelHeader
{
    uint32_t moduleId;
    uint32_t nextModule;
    uint32_t prevModule;
    uint32_t sectionCount;
    uint32_t sectionInfoOffset;
    uint32_t moduleNameOffset;
    uint32_t moduleNameSize;
    uint32_t moduleVersion;
    uint32_t bssSize;
    uint32_t relocationTableOffset;
    uint32_t importTableOffset;
    uint32_t importTableSize;
    uint8_t prologSection;
    uint8_t epilogSection;
    uint8_t unresolvedSection;
    uint8_t pad33;
    uint32_t prologOffset;
    uint32_t epilogOffset;
    uint32_t unresolvedOffset;
};

struct RelRelocEntry
{
    size_t offset;
    int type;
    int relocSection;  // section which relocation patch applies to
    int section;       // section of symbol
    uint32_t symaddr;    // for dol symbols, absolute address. for rel symbols, section offset
};

struct RelImportEntry
{
    int moduleId;
    size_t relocsOffset;  // file offset to relocs
    struct RelRelocEntry *relocs;
    int relocsCount;
};

struct SymStringInfo
{
    int moduleId;
    Elf32_Sym *symtab;
    int symtabCount;
    char *strtab;
    size_t strtabSize;
};

static Elf32_Ehdr elfHeader;
static Elf32_Ehdr plfHeader;
static struct RelHeader relHdr;
static struct SymStringInfo elfInfo;
static struct SymStringInfo plfInfo;
static struct RelImportEntry *imports;
static int importsCount = 0;
static int *elfSec2DolSec = NULL;
static int minSectionCount = 0;

#define SWAPS32(n) n = read_s32be(&n)
#define SWAPU32(n) n = read_u32be(&n)
#define SWAPU16(n) n = read_u16be(&n)

static uint32_t align4(uint32_t n)
{
    return (n + 3) & ~3;
}

static uint32_t align(uint32_t n, unsigned int alignment)
{
    if (n % alignment == 0)
        return n;
    return n + alignment - (n % alignment);
}

static const char *symbol_name(const struct SymStringInfo *info, const Elf32_Sym *sym)
{
    if (sym->st_name >= info->strtabSize)
        return NULL;
    return info->strtab + sym->st_name;
}

static int get_symtab_entry(const struct SymStringInfo *info, int index, Elf32_Sym *sym)
{
    if (index >= info->symtabCount)
        return 0;
    *sym = info->symtab[index];
    SWAPU32(sym->st_name);
    SWAPU32(sym->st_value);
    SWAPU32(sym->st_size);
    SWAPU16(sym->st_shndx);
    return 1;
}

static int lookup_symbol_by_name(const struct SymStringInfo *info, const char *name, Elf32_Sym *sym)
{
    int i;

    //printf("looking up '%s'\n", name);
    for (i = 0; i < info->symtabCount; i++)
    {
        get_symtab_entry(info, i, sym);
        const char *n = symbol_name(info, sym);
        if (n != NULL && strcmp(name, n) == 0)
            return 1;
    }
    return 0;
}

static void insert_reloc(struct RelRelocEntry *reloc, int moduleId)
{
    int i;
    struct RelImportEntry *import = NULL;

    // Find import entry for module
    for (i = 0; i < importsCount; i++)
    {
        if (imports[i].moduleId == moduleId)
        {
            import = &imports[i];
            break;
        }
    }

    // Add module import entry if it does not exist.
    if (import == NULL)
    {
        imports = realloc(imports, (importsCount + 1) * sizeof(*imports));
        import = &imports[importsCount];
        importsCount++;

        import->moduleId = moduleId;
        import->relocs = NULL;
        import->relocsCount = 0;
    }

    // Add to list
    import->relocs = realloc(import->relocs, (import->relocsCount + 1) * sizeof(*import->relocs));
    import->relocs[import->relocsCount] = *reloc;
    import->relocsCount++;
}

// adds a rel relocation entry
static void add_reloc(const struct SymStringInfo *info, const Elf32_Rela *reloc, int relocSection)
{
    Elf32_Sym sym;
    int symIdx = ELF32_R_SYM(reloc->r_info);
    int relocType = ELF32_R_TYPE(reloc->r_info);
    struct RelRelocEntry rentry;
    rentry.relocSection = -1;

    // look up symbol in plf's symtab
    if (!get_symtab_entry(&plfInfo, symIdx, &sym))
        fatal_error("couldn't find symbol index %i\n", symIdx);

/*
    printf("sec: %i, offset: 0x%08X, sym: \"%s\" (0x%08X), rtype: %i, symtype: %i\n",
        relocSection,
        reloc->r_offset,
        symbol_name(&plfInfo, &sym),
        sym.st_value,
        relocType,
        ELF32_ST_TYPE(sym.st_info));
*/

    if (!is_supported_reloc_type(relocType))
        fatal_error("relocation type %i not supported\n", relocType);

    rentry.relocSection = relocSection;
    rentry.offset = reloc->r_offset;
    rentry.type = relocType;

    // find the module, section, and address of the symbol

    //if (ELF32_ST_TYPE(sym.st_info) == STT_NOTYPE)
    if (sym.st_shndx == 0)
    {
        const char *name = symbol_name(&plfInfo, &sym);

        // symbol is undefined; look for it in main elf
        //printf("looking for external symbol '%s'\n", name);
        if (!lookup_symbol_by_name(&elfInfo, name, &sym))
            fatal_error("symbol '%s' not found\n", name);
        //printf("section = %i, symaddr = 0x%08X\n", sym.st_shndx, sym.st_value);
        if (sym.st_shndx >= elfHeader.e_shnum)
            fatal_error("bad section index %i\n", sym.st_shndx);
        rentry.section = elfSec2DolSec[sym.st_shndx];
        rentry.symaddr = sym.st_value + reloc->r_addend;
        insert_reloc(&rentry, elfInfo.moduleId);
    }
    else
    {
        // symbol is located in this module
        rentry.section = sym.st_shndx;
        rentry.symaddr = sym.st_value + reloc->r_addend;  // this is the offset of the symbol in its section
        //printf("symaddr = 0x%08X\n", sym.st_value);
        insert_reloc(&rentry, info->moduleId);
    }
}

static void read_elf_section_header(FILE *f, const Elf32_Ehdr *ehdr, int secNum, Elf32_Shdr *shdr)
{
    size_t offset = ehdr->e_shoff + secNum * ehdr->e_shentsize;

    if (secNum >= ehdr->e_shnum)
        fatal_error("no such section index %i\n", secNum);
    if (!read_checked(f, offset, shdr, sizeof(*shdr)))
        fatal_error("error reading section header\n");

    SWAPU32(shdr->sh_name);
    SWAPU32(shdr->sh_type);
    SWAPU32(shdr->sh_flags);
    SWAPU32(shdr->sh_addr);
    SWAPU32(shdr->sh_offset);
    SWAPU32(shdr->sh_size);
    SWAPU32(shdr->sh_link);
    SWAPU32(shdr->sh_info);
    SWAPU32(shdr->sh_addralign);
    SWAPU32(shdr->sh_entsize);
}

static void read_elf_relocs(FILE *f, const Elf32_Ehdr *ehdr)
{
    int i;
    int j;
    for (i = 0; i < (int)ehdr->e_shnum; i++)
    {
        Elf32_Shdr shdr;
        Elf32_Shdr forSection;

        read_elf_section_header(f, ehdr, i, &shdr);
        if (shdr.sh_type == SHT_RELA)
        {
            size_t o = shdr.sh_offset;

            // ignore relocation info for ignored sections
            read_elf_section_header(f, ehdr, shdr.sh_info, &forSection);
            //printf("relocation section %i for %i. flags=%i\n", i, shdr.sh_info, forSection.sh_flags);
            if (!(forSection.sh_flags & SHF_ALLOC))
                continue;

            for (j = 0; j < shdr.sh_size / sizeof(Elf32_Rela); j++)
            {
                Elf32_Rela reloc;

                read_checked(f, o, &reloc, sizeof(reloc));

                SWAPU32(reloc.r_offset);
                SWAPU32(reloc.r_info);
                SWAPS32(reloc.r_addend);

                add_reloc(&plfInfo, &reloc, shdr.sh_info);

                o += sizeof(reloc);
            }
        }
    }
}

static int read_elf_symstringinfo(FILE *f, const Elf32_Ehdr *ehdr, struct SymStringInfo *info)
{
    int i;

    //printf("%i sections\n", ehdr->e_shnum);
    for (i = 0; i < (int)ehdr->e_shnum; i++)
    {
        Elf32_Shdr shdr;

        read_elf_section_header(f, ehdr, i, &shdr);
        if (shdr.sh_type == SHT_SYMTAB && info->symtab == NULL)
        {
            info->symtabCount = shdr.sh_size / sizeof(Elf32_Sym);
            info->symtab = malloc(shdr.sh_size);
            if (!read_checked(f, shdr.sh_offset, info->symtab, shdr.sh_size))
                fatal_error("error reading symbol table\n");
        }
        else if (shdr.sh_type == SHT_STRTAB && i != ehdr->e_shstrndx && info->strtab == NULL)
        {
            info->strtabSize = shdr.sh_size;
            info->strtab = malloc(shdr.sh_size);
            if (!read_checked(f, shdr.sh_offset, info->strtab, shdr.sh_size))
                fatal_error("error reading string table\n");
        }
    }

    return info->strtab != NULL && info->symtab != NULL;
}

int read_elf_header(FILE *f, Elf32_Ehdr *ehdr)
{
    if (!read_checked(f, 0, ehdr, sizeof(*ehdr)))
        fatal_error("error reading ELF header\n");
    if (memcmp(ehdr->e_ident, "\x7F""ELF", 4) != 0)
        fatal_error("not a valid ELF file\n");

    SWAPU16(ehdr->e_type);
    SWAPU16(ehdr->e_machine);
    SWAPU32(ehdr->e_version);
    SWAPU32(ehdr->e_entry);
    SWAPU32(ehdr->e_phoff);
    SWAPU32(ehdr->e_shoff);
    SWAPU32(ehdr->e_flags);
    SWAPU16(ehdr->e_ehsize);
    SWAPU16(ehdr->e_phentsize);
    SWAPU16(ehdr->e_phnum);
    SWAPU16(ehdr->e_shentsize);
    SWAPU16(ehdr->e_shnum);
    SWAPU16(ehdr->e_shstrndx);

    if (ehdr->e_shentsize < sizeof(Elf32_Shdr))
        fatal_error("invalid section header size");

    return 1;
}

//static int get_symtab_entry(const struct SymStringInfo *info, int index, Elf32_Sym *sym)

// searches for the special functions "_prolog", "_epliog", and "_unresolved"
void find_entry_points(FILE *f, const Elf32_Ehdr *ehdr, const struct SymStringInfo *info)
{
    int i;

    //puts("finding entry points");
    for (i = 0; i < info->symtabCount; i++)
    {
        Elf32_Sym sym;
        Elf32_Shdr shdr;
        const char *name;

        get_symtab_entry(info, i, &sym);
        name = symbol_name(info, &sym);
        if (name == NULL)
            continue;
        if (strcmp(name, "_prolog") == 0)
        {
            read_elf_section_header(f, ehdr, sym.st_shndx, &shdr);
            relHdr.prologSection = sym.st_shndx;
            relHdr.prologOffset = sym.st_value - shdr.sh_addr;
        }
        else if (strcmp(name, "_epilog") == 0)
        {
            read_elf_section_header(f, ehdr, sym.st_shndx, &shdr);
            relHdr.epilogSection = sym.st_shndx;
            relHdr.epilogOffset = sym.st_value - shdr.sh_addr;
        }
        else if (strcmp(name, "_unresolved") == 0)
        {
            read_elf_section_header(f, ehdr, sym.st_shndx, &shdr);
            relHdr.unresolvedSection = sym.st_shndx;
            relHdr.unresolvedOffset = sym.st_value - shdr.sh_addr;
        }
    }
}

// Removes unnecessary relocations from function calls within this module
void remove_redundant_relocs(int sectionId, uint8_t *sectionData, size_t size)
{
    struct RelImportEntry *import = NULL;
    struct RelRelocEntry *reloc;
    int i;

    // find the import directory for this module
    for (i = 0; i < importsCount; i++)
    {
        if (imports[i].moduleId == plfInfo.moduleId)
        {
            import = &imports[i];
            break;
        }
    }
    assert(import != NULL);
    
    for (i = 0, reloc = &import->relocs[0]; i < import->relocsCount; i++, reloc++)
    {
        if (reloc->relocSection == sectionId && reloc->type == R_PPC_REL24)
        {
            assert(reloc->offset < size);
            /*
            printf("removing reloc: section %i, offset 0x%08X, type %s\n",
                reloc->relocSection,
                reloc->offset,
                reloc_type_name(reloc->type));
            */  
            uint32_t insn = read_u32be((uint32_t *)(sectionData + reloc->offset));
            assert(((insn >> 26) & 0x3F) == 18);  // TODO: do other instructions besides bl use R_PPC_REL24?
            uint32_t offsetMask = 0x03FFFFFC;  // bits of instruction that contain the offset
            int32_t branchOffset = reloc->symaddr - reloc->offset;  // relative branch
            insn = (insn & ~offsetMask) | (branchOffset & offsetMask);
            //printf("patching unresolved 0x%08X\n", insn);
            write_u32be(insn, (uint32_t *)(sectionData + reloc->offset));
            
            // remove the relocation
            reloc->type = R_PPC_NONE;
        }
    }
}

// Patches all external function calls to point to the _unresolved function by default.
// TODO: should this also patch pointers to external functions in .data?
void patch_unresolved(int sectionId, uint8_t *sectionData, size_t size)
{
    struct RelImportEntry *import = NULL;
    struct RelRelocEntry *reloc;
    int i;

    if (relHdr.unresolvedSection == 0)  // doesn't have an _unresolved function
    {
        //puts("_unresolved not found");
        return;
    }

    //printf("patching section %i\n", sectionId);
    //printf("%i import dirs\n", importsCount);
    // Find the import directory for module 0
    for (i = 0; i < importsCount; i++)
    {
        if (imports[i].moduleId == 0)
        {
            import = &imports[i];
            break;
        }
    }
    assert(import != NULL);

    for (i = 0, reloc = &import->relocs[0]; i < import->relocsCount; i++, reloc++)
    {
        /*
        printf("reloc: section %i, offset 0x%08X, type %s\n",
            reloc->relocSection,
            reloc->offset,
            reloc_type_name(reloc->type));
        */
        if (reloc->relocSection == sectionId && reloc->type == R_PPC_REL24)
        {
            assert(reloc->offset < size);
            uint32_t insn = read_u32be((uint32_t *)(sectionData + reloc->offset));
            assert(((insn >> 26) & 0x3F) == 18);  // TODO: do other instructions besides bl use R_PPC_REL24?
            uint32_t offsetMask = 0x03FFFFFC;  // bits of instruction that contain the offset
            int32_t branchOffset = relHdr.unresolvedOffset - reloc->offset;  // relative branch
            insn = (insn & ~offsetMask) | (branchOffset & offsetMask);
            //printf("patching unresolved 0x%08X\n", insn);
            write_u32be(insn, (uint32_t *)(sectionData + reloc->offset));
        }
    }
}

#undef SWAPU32
#undef SWAPU16
#undef SWAPS32

// Writes rel sections and fills in:
//   sectionInfoOffset
//   sectionCount
void write_rel_sections(FILE *fin, Elf32_Ehdr *ehdr, FILE *fout)
{
    int i;
    size_t sectionOffset;

    // section info table follows header
    relHdr.sectionInfoOffset = sizeof(struct RelHeader);
    relHdr.sectionCount = MAX(ehdr->e_shnum, minSectionCount);

    // sections follow section info table
    sectionOffset = relHdr.sectionInfoOffset + relHdr.sectionCount * 8;
    //printf("writing %i sections at 0x%X\n", relHdr.sectionCount, relHdr.sectionInfoOffset);

    for (i = 0; i < ehdr->e_shnum; i++)
    {
        Elf32_Shdr shdr;
        struct { uint32_t offset; uint32_t size; } ent;

        read_elf_section_header(fin, ehdr, i, &shdr);
        if (shdr.sh_type == SHT_PROGBITS && (shdr.sh_flags & SHF_ALLOC))
        {
            //size_t sizeAligned = align(shdr.sh_size, shdr.sh_addralign);
            size_t sizeAligned = align4(shdr.sh_size);
            sectionOffset = align(sectionOffset, shdr.sh_addralign);
            uint32_t execflg = (shdr.sh_flags & SHF_EXECINSTR) ? 1 : 0;
            // write table entry
            write_u32be(sectionOffset | execflg, &ent.offset);  // offset
            write_u32be(shdr.sh_size,            &ent.size);  // size
            write_checked(fout, relHdr.sectionInfoOffset + i * 8, &ent, sizeof(ent));

            // write section data
            if (shdr.sh_size > 0)
            {
                uint8_t *data = calloc(sizeAligned, 1);
                //printf("offset: 0x%X, size: 0x%X, flg: %i\n", shdr.sh_offset, shdr.sh_size, shdr.sh_flags);
                if (!read_checked(fin, shdr.sh_offset, data, shdr.sh_size))
                    fatal_error("error reading section\n");
                if (execflg)  // patch external function calls to _unresolved
                {
                    remove_redundant_relocs(i, data, sizeAligned);
                    patch_unresolved(i, data, sizeAligned);
                }
                if (!write_checked(fout, sectionOffset, data, shdr.sh_size))
                    fatal_error("error writing rel section\n");
                free(data);
                sectionOffset += shdr.sh_size;
            }
        }
        else
        {
            // write table entry
            ent.offset = 0;  // offset
            ent.size = 0;  // size
            if (shdr.sh_flags & SHF_ALLOC)
                write_u32be(align4(shdr.sh_size), &ent.size);
            write_checked(fout, relHdr.sectionInfoOffset + i * 8, &ent, sizeof(ent));
        }
    }

    // relocation data follows section data
    relHdr.relocationTableOffset = sectionOffset;
}

static int cmp_by_section(const void *a, const void *b)
{
    const struct RelRelocEntry *relocA = a;
    const struct RelRelocEntry *relocB = b;

    // if sections are different, sort them
    if (relocA->relocSection != relocB->relocSection)
        return relocA->relocSection - relocB->relocSection;
    // otherwise, leave the order alone
    return (uintptr_t)a - (uintptr_t)b;
}

static int cmp_by_module_id(const void *a, const void *b)
{
    const struct RelImportEntry *impA = a;
    const struct RelImportEntry *impB = b;

    return impA->moduleId - impB->moduleId;
}

void write_rel_imports(FILE *fout)
{
    int i, j;
    struct RelImportEntry *imp;
    struct RelRelocEntry *reloc;
    size_t relocsOffset = relHdr.relocationTableOffset;

    qsort(imports, importsCount, sizeof(struct RelImportEntry), cmp_by_module_id);

    for (i = 0, imp = &imports[0]; i < importsCount; i++, imp++)
    {
        int currSection = -1;
        size_t lastOffset = 0;
        struct
        {
            uint16_t offset;
            uint8_t  type;
            uint8_t  section;
            uint32_t symaddr;
        } ent;

        qsort(imp->relocs, imp->relocsCount, sizeof(struct RelRelocEntry), cmp_by_section);
        imp->relocsOffset = relocsOffset;

        //printf("writing %i relocs for module %i at 0x%X\n", imp->relocsCount, imp->moduleId, relocsOffset);
        for (j = 0, reloc = &imp->relocs[0]; j < imp->relocsCount; j++, reloc++)
        {
            if (reloc->type == R_PPC_NONE)  // removed reloc
                continue;
            
            if (reloc->relocSection != currSection)
            {
                // write section change
                currSection = reloc->relocSection;
                write_u16be(0, &ent.offset);
                ent.type = R_DOLPHIN_SECTION;
                ent.section = reloc->relocSection;
                write_u32be(0, &ent.symaddr);
                if (!write_checked(fout, relocsOffset, &ent, sizeof(ent)))
                    fatal_error("error writing relocation entry");
                relocsOffset += sizeof(ent);
                lastOffset = 0;
            }

            // write relocation
            assert(reloc->offset >= lastOffset);
            write_u16be(reloc->offset - lastOffset, &ent.offset);
            ent.type = reloc->type;
            ent.section = reloc->section;
            write_u32be(reloc->symaddr, &ent.symaddr);
            if (!write_checked(fout, relocsOffset, &ent, sizeof(ent)))
                fatal_error("error writing relocation entry");
            relocsOffset += sizeof(ent);
            lastOffset = reloc->offset;
        }

        // write end
        write_u16be(0, &ent.offset);
        ent.type = R_DOLPHIN_END;
        ent.section = 0;
        write_u32be(0, &ent.symaddr);
        if (!write_checked(fout, relocsOffset, &ent, sizeof(ent)))
            fatal_error("error writing relocation entry");
        relocsOffset += sizeof(ent);
    }

    relHdr.importTableOffset = relocsOffset;
    //printf("writing %i imports at 0x%X\n", importsCount, relHdr.importTableOffset);

    // write import table
    for (i = 0, imp = &imports[0]; i < importsCount; i++, imp++)
    {
        // write import table entry
        struct
        {
            uint32_t moduleId;
            uint32_t relocsOffset;
        } ent;

        write_u32be(imp->moduleId,     &ent.moduleId);
        write_u32be(imp->relocsOffset, &ent.relocsOffset);
        write_checked(fout, relHdr.importTableOffset + i * 8, &ent, sizeof(ent));
    }

    relHdr.importTableSize = importsCount * 8;
}

static void write_rel_header(FILE *fout)
{
    //printf("id = %u\n", relHdr.moduleId);
#define SWAP32(n) write_u32be(n, &n)
    SWAP32(relHdr.moduleId);
    SWAP32(relHdr.sectionCount);
    SWAP32(relHdr.sectionInfoOffset);
    SWAP32(relHdr.moduleNameOffset);
    SWAP32(relHdr.moduleNameSize);
    SWAP32(relHdr.moduleVersion);
    SWAP32(relHdr.bssSize);
    SWAP32(relHdr.relocationTableOffset);
    SWAP32(relHdr.importTableOffset);
    SWAP32(relHdr.importTableSize);
    SWAP32(relHdr.prologOffset);
    SWAP32(relHdr.epilogOffset);
    SWAP32(relHdr.unresolvedOffset);
#undef SWAP32

    write_checked(fout, 0, &relHdr, sizeof(relHdr));
}

static int parse_number(const char *str, int *n)
{
    char *end;
    *n = strtol(str, &end, 0);
    return end > str;
}

int main(int argc, char **argv)
{
    const char *plfName = NULL;
    const char *elfName = NULL;
    const char *relName = NULL;
    FILE *plf;
    FILE *elf;
    FILE *rel;
    int i;
    int dolSecNum = 1;
    int moduleId = -1;
    int nameOffset = 0;
    int nameLen = 0;

    for (i = 1; i < argc; i++)
    {
        if (strcmp(argv[i], "-c") == 0 || strcmp(argv[i], "--pad-section-count") == 0)
        {
            if (i + 1 < argc && parse_number(argv[i + 1], &minSectionCount))
                i++;
            else
                goto usage;
        }
        else if (strcmp(argv[i], "-i") == 0 || strcmp(argv[i], "--module-id") == 0)
        {
            if (i + 1 < argc && parse_number(argv[i + 1], &moduleId))
                i++;
            else
                goto usage;
        }
        else if (strcmp(argv[i], "-o") == 0 || strcmp(argv[i], "--name-offset") == 0)
        {
            if (i + 1 < argc && parse_number(argv[i + 1], &nameOffset))
                i++;
            else
                goto usage;
        }
        else if (strcmp(argv[i], "-l") == 0 || strcmp(argv[i], "--name-length") == 0)
        {
            if (i + 1 < argc && parse_number(argv[i + 1], &nameLen))
                i++;
            else
                goto usage;
        }
        else
        {
            if (plfName == NULL)
                plfName = argv[i];
            else if (elfName == NULL)
                elfName = argv[i];
            else if (relName == NULL)
                relName = argv[i];
            else
                goto usage;
        }
    }
    if (plfName == NULL || elfName == NULL || relName == NULL)
        goto usage;

    plf = fopen(plfName, "rb");
    if (plf == NULL)
    {
        fprintf(stderr, "could not open %s for reading: %s\n", plfName, strerror(errno));
        return 1;
    }

    elf = fopen(elfName, "rb");
    if (elf == NULL)
    {
        fprintf(stderr, "could not open %s for reading: %s\n", elfName, strerror(errno));
        return 1;
    }

    if (read_elf_header(plf, &plfHeader))
    {
        if (plfHeader.e_ident[EI_CLASS] != ELFCLASS32
         || plfHeader.e_ident[EI_DATA] != ELFDATA2MSB
         || plfHeader.e_machine != EM_PPC)
            fatal_error("%s: wrong architecture. expected PowerPC 32-bit big endian.\n", plfName);
    }

    if (read_elf_header(elf, &elfHeader))
    {
        if (elfHeader.e_ident[EI_CLASS] != ELFCLASS32
         || elfHeader.e_ident[EI_DATA] != ELFDATA2MSB
         || elfHeader.e_machine != EM_PPC)
            fatal_error("%s: wrong architecture. expected PowerPC 32-bit big endian.\n", elfName);
    }

    if (!read_elf_symstringinfo(elf, &elfHeader, &elfInfo))
        fatal_error("%s contains no symbols\n", elfName);
    if (!read_elf_symstringinfo(plf, &plfHeader, &plfInfo))
        fatal_error("%s contains no symbols\n", plfName);

    elfInfo.moduleId = 0;

    plfInfo.moduleId = moduleId;
    // TODO: how is this determined. seems to randomly point inside section data
    relHdr.moduleNameOffset = nameOffset;
    relHdr.moduleNameSize = nameLen;

    // TODO: not really sure how these section numbers from the rel map here,
    // but this seems to work.
    elfSec2DolSec = calloc(elfHeader.e_shnum, sizeof(*elfSec2DolSec));
    for (i = 0; i < elfHeader.e_shnum; i++)
    {
        Elf32_Shdr shdr;
        read_elf_section_header(elf, &elfHeader, i, &shdr);
        if (shdr.sh_flags & SHF_ALLOC)
            elfSec2DolSec[i] = dolSecNum++;
    }

    // get bss size for rel
    relHdr.bssSize = 0;
    for (i = 0; i < plfHeader.e_shnum; i++)
    {
        Elf32_Shdr shdr;
        read_elf_section_header(plf, &plfHeader, i, &shdr);
        if ((shdr.sh_flags & SHF_ALLOC) && shdr.sh_type == SHT_NOBITS)
            relHdr.bssSize += shdr.sh_size;
    }

    read_elf_relocs(plf, &plfHeader);

    find_entry_points(plf, &plfHeader, &plfInfo);

    relHdr.moduleVersion = 1;
    relHdr.moduleId = plfInfo.moduleId;

    rel = fopen(relName, "wb");
    if (rel == NULL)
    {
        fprintf(stderr, "could not open %s for reading: %s\n", relName, strerror(errno));
        return 1;
    }

    write_rel_sections(plf, &plfHeader, rel);
    write_rel_imports(rel);
    write_rel_header(rel);

    fclose(plf);
    fclose(elf);
    fclose(rel);

    free(elfSec2DolSec);
    free(elfInfo.strtab);
    free(elfInfo.symtab);
    for (i = 0; i < importsCount; i++)
        free(imports[i].relocs);
    free(imports);
    return 0;

usage:
    fprintf(stderr,
        "usage: %s reloc_elf static_elf rel_file\n"
        "options:\n"
        "  -i, --module-id <n>          sets the module ID in the rel header to <n>\n"
        "  -c, --pad-section-count <n>  ensures that the rel will have at least <n>\n"
        "                               sections\n"
        "  -o, --name-offset <offset>   sets the name offset in the rel header to\n"
        "                               <offset>\n"
        "  -l, --name-length <len>      sets the name length in the rel header to <len>\n",
        argv[0]);
    return 1;
}
