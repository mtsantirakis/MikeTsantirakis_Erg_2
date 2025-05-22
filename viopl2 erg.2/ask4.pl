$protein_line = "MNVEHE _123! LLVEE \$";

$protein_line =~ s/[^A-Z]//g;

print "Cleaned sequence: $protein_line"

