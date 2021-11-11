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
    if ($line =~ /glabel lbl_80177264/) {
        print("got label\n");
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

    if ($gotLabel && $line =~ /\.*byte/) {
        #print("asdf");
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
    
    if ((scalar @b) == 0xC) {
        print("{");
        printf("%s, ", float(@b[0...3]));
        printf("%s, ", float(@b[4...7]));
        printf("%s", float(@b[8...11]));
        print("},\n");
        @b = ();
    }
    
    if ($line =~ /lbl_801772AC:/) {
        break;
    }
}
