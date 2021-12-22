#!/usr/bin/env perl

my $line;
my $gotLabel = 0;
my $gotEndif = 0;
my $offset = 0;

my @b = ();

sub float {
    my $val = unpack "f", pack "L", ($_[0]<<24) | ($_[1]<<16) | ($_[2]<<8) | ($_[3]);
    my $str = sprintf("%.10g", $val);
    if ($str !~ /\./) {
        $str = $str . '.0';
    }
    return $str . 'f';
}

sub u32 {
    my $val = ($_[0]<<24) | ($_[1]<<16) | ($_[2]<<8) | ($_[3]);
    return sprintf("%i", $val);
}

sub u16 {
    my $val = ($_[0]<<8) | ($_[1]);
    return sprintf("%i", $val);
}

while ($line = <>) {
    if ($line =~ /glabel lbl_0000C88C/) {
        print("got label\n");
        $gotLabel = 1;
        next;
    }
    
    if (!$gotLabel) {
        next;
    }
    
    if ($line =~ /^\.asciz/) {
        $gotLabel = 0;
        next;
    }
    if ($line =~ /^\.endif/) {
        $gotEndif = 1;
        next;
    }

    if ($line =~ /\.*byte/) {
        #print("line $line");
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
    
    if ((scalar @b) == 16) {
        print("{");
        printf(" %s,", float(@b[0..3]));
        printf(" %s},\n", u16(@b[2..3]));
#        printf("    %s,\n", float(@b[4...7]));
#        printf("    %s,\n", float(@b[8...11]));
#        printf("    %s,\n", float(@b[12...15]));
#        printf("    %s,\n", float(@b[16...19]));
#        printf("    %s,\n", float(@b[20...23]));
#        printf("    %s,\n", float(@b[24...27]));
#        print("},\n");
        @b = ();
    }
    
    print("asdf");
    if ($line =~ /.*lbl_0000C91C.*/) {
        print("done");
        exit;
    }
}
