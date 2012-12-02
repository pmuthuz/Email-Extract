use strict;
use warnings;

use Email::Address;
use IO::File;
use Getopt::Long;

my ($ifile, $ofile);
my $result = GetOptions ( "inputfile=s" => \$ifile, "outputfile=s" => \$ofile );

my $fh = new IO::File $ifile, "r";
my $fo = new IO::File $ofile, "w";

while (my $line = <$fh> ) {
    my @addresses = Email::Address->parse($line);
    if ( @addresses ) {
         print $fo join "\n", @addresses;
         print $fo "\n";
    }
}
$fh->close;
$fo->close;
exit;
