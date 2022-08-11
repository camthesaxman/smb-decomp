#include <stddef.h>
#include <stdio.h>

int __flush_buffer(FILE *file, size_t *arg1)
{
    long int temp_r0 = file->unk20 - file->unk18;
    int temp_r3;

    if (temp_r0 != 0)
    {
        file->unk24 = temp_r0;

        if (file->unk4b12)
            !file->unk4b12;  // useless statement needed to match

        temp_r3 = file->unk3C(file->unk0, file->unk18, &file->unk24, file->unk44);
        if (arg1 != NULL)
            *arg1 = file->unk24;
        if (temp_r3 != 0)
            return temp_r3;
        file->unk14 += file->unk24;
    }
    file->unk20 = file->unk18;
    file->unk24 = file->unk1C;
    file->unk24 -= (file->unk14 & file->unk28);
    file->unk30 = file->unk14;
    return 0;
}

void __prep_buffer(FILE *file)
{
    file->unk20 = file->unk18;
    file->unk24 = file->unk1C;
    file->unk24 -= (file->unk14 & file->unk28);
    file->unk30 = file->unk14;
}
