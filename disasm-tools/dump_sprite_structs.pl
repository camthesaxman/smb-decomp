#!/usr/bin/env perl

my $line;
my $gotLabel = 0;
my $gotEndif = 0;
my $offset = 0;

my @b = ();

sub float {
    my $val = unpack "f", pack "L", ($_[0]<<24) | ($_[1]<<16) | ($_[2]<<8) | ($_[3]);
    return sprintf("%.10g", $val);
}

sub u32 {
    my $val = ($_[0]<<24) | ($_[1]<<16) | ($_[2]<<8) | ($_[3]);
    return sprintf("%i", $val);
}

while ($line = <>) {
    if ($line =~ /^lbl_801BE4B0/) {
        $gotLabel = 1;
        next;
    }
    if ($line =~ /^\.asciz/) {
        $gotLabel = 0;
        next;
    }
    if ($gotLabel && $line =~ /^\.endif/) {
        $gotEndif = 1;
        next;
    }

    if ($gotLabel && $gotEndif && $line =~ /\.*byte/) {
        if ($line =~ /\.byte (0x..), (0x..), (0x..), (0x..)/) {
            push(@b, hex($1), hex($2), hex($3), hex($4));
        }
        elsif ($line =~ /\.4byte (\w+)/) {
            my $val = hex($1);
            push(@b,
                ($val >> 24) & 0xFF,
                ($val >> 16) & 0xFF,
                ($val >> 8) & 0xFF,
                ($val >> 0) & 0xFF,
            );
            #print("$val\n");
        }
        else {
            print("bad\n");
        }
        #print($line);
    }
    
    if ((scalar @b) == 0x24) {
        print("{");
        printf("%i, ", ($b[0]<<8) | $b[1]);
        printf("%i, %i, ", $b[2], $b[3]);
        printf("%s, ", u32(@b[4...7]));
        printf("%s, ", u32(@b[8...11]));
        printf("%i, ", $b[12]);
        printf("%i, ", $b[13]);
        printf("%s, ", float(@b[16...19]));
        printf("%s, ", float(@b[20...23]));
        printf("%s, ", float(@b[24...27]));
        printf("%s, ", float(@b[28...31]));
        printf("%i, ", $b[32]);
        printf("%i, ", $b[33]);
        printf("%i, ", $b[34]);
        printf("%i", $b[35]);
        print("},\n");
        @b = ();
    }
}
