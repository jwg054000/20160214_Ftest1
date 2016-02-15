#!/usr/bin/perl
use strict;
use warnings;
#This is my first attempt at writing code to perform Fisher's exact test (two-tailed).

main(@ARGV);

#subroutine for shifting numbers
sub main { 
	
	my $file = '~/Documents/Fisher_test1.txt';

	if(-f $file) {
		print "Found file $file\n";
}
	else {
		print "File not found\n";
	}
}

#FISHER EXACT TEST (TWO-SIDED) TEST1

	#my ($a, $b, $c, $d, $ts) = @_;

	my $line = $_;

	if ($line =~ /chrom/) {
						#print intro lines
	}

                           # *   |   *   | r1 = a+b
    	               # --------+-------+----------
                           # *   |   *   | r2 = c+d
                       # --------+-------+----------
                          # c1   |   c2  |    N
                        # = a+c  | = b+d | = a+b+c+d

	else {
		my $a_fac = fac($a);
		my $b_fac = fac($b);
		my $c_fac = fac($c);
		my $d_fac = fac($d);
	
		my $n = $a+$b+$c+$d;	#total count in the pop
		my $n_fac = fac($n);
	
		my $ab = $a+$b; 	#row1, i.e. ref
		my $cd = $c+$d;		#row2, i.e. alt
		my $ac = $a+$c;		#col1, i.e. normal
		my $bd = $b+$d;		#col2, i.e. diseased
	
		my $ab_fac = fac($ab);
		my $cd_fac = fac($cd);
		my $ac_fac = fac($ac);
		my $bd_fac = fac($bd);
	
		my $fet_num = $ab_fac*$cd_fac*$ac_fac*$bd_fac;
		my $fet_denom = $a_fac*$b_fac*$c_fac*$d_fac*$n_fac;
		my $fet = $fet_num/$fet_denom;
	
		my $logp = -log($fet);
	
		print OUT "$fet\t$logp\n";
# 		print "FET is $fet\n";
# 		print "log is $logp\n";
	}

	

#sub sorting {
	
	#my @a = @genotype;
	#my @b = ();
	#@b = @$_;
	
	#foreach (@ia=0; $ia<scalar(@a);

}		

