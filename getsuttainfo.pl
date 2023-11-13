use strict;
use warnings;

# declarations
# check input argument
my $inputfile = "";
my $sutta_offset = 0;
my $head_tag = "h3";
if (@ARGV) {
	$inputfile = "$ARGV[0]";
	$sutta_offset = $ARGV[1] ? $ARGV[1] : 0;
	$head_tag = $ARGV[2] ? $ARGV[2] : "h3";
} else {
	exit 1;
}
my @head = ();
my @first_pnum = ();
my @last_pnum = ();
my $lastnum = 0;
my $headstart = 0;

open INPUT, "zcat gz/cst-s-" . $inputfile . ".gz |" or die;

# read all lines
while (<INPUT>) {
	chomp;
	# collect sutta head and paranum
	if (m/^<$head_tag>/) {
		s/<\/?$head_tag>//g;
		push @head, $_;
		$headstart = 1;
	} elsif ($headstart && /^\d/) {
		s/[-.].*$//;
		push @first_pnum, $_;
		$headstart = 0;
	}
	# find the last paranum
	if (/^\d/) {
		s/[-.].*$//;
		$lastnum = $_;
	}
}
# generate last paranum for each sutta
@last_pnum = @first_pnum;
shift @last_pnum;
foreach (@last_pnum) {
	$_--;
}
push @last_pnum, $lastnum;

# print out in JSON
for (my $i = 0; $i <= $#head; $i++) {
	print " {\n";
	print "  \"file\": \"cst-s-$inputfile\",\n";
	print "  \"name\": \"$head[$i]\",\n";
	print "  \"number\": " . ($i+$sutta_offset+1) . ",\n";
	print "  \"paranum\": [ $first_pnum[$i], $last_pnum[$i] ]\n";
	print " },\n";
}
close INPUT;
