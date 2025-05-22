
use strict;
use warnings;


my $seq  =  "ATGCCCTTAGAATAG";

#gen_kwdikas
my %code = (

    'ATG'=>'Meth', 'TAG'=>'_',  'TGA'=>'_', 'TAA'=>'_',
    'CCC'=>'Pro', 'TTA'=>'Leu', 'GAA'=>'Glu'
);

#diavasma allhloyxias
$seq =~ s/[^ACGTacgt]//g;
$seq = uc($seq);

#antistrofh allhloyxia

my $rev = reverse($seq);
$rev =~ tr/ACGT/TGCA/;

print "-- FORWARD --\n";
find_orfs($seq);

print "-- REVERSE --\n";
find_orfs($rev);

sub find_orfs {
    my ($dna) = @_;
    my $len = length($dna);

    for (my $i=0; $i<$len-2; $i++){
        my $start = substr($dna, $i, 3);
        if($start eq 'ATG'){

            my $orf=$start;
            my $protein = $code{$start} || 'X';

            for (my $j= $i + 3; $j < $len -2 ; $j+=3){
                my $codon = substr($dna, $j, 3);
                $orf .= $codon;

                if ($codon eq 'TAA' || $codon eq 'TAG' || $codon eq 'TGA'){

                    print "ORF found at $i: $orf\n";
                    print "The Protein is: $protein\n\n";
                    last;
                }

                my $aa = $code{$codon} || 'X';  # X για άγνωστα
                $protein .= "-$aa";
                
            }
        }
    }
}
  


