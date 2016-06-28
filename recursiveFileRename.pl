use warnings;
use Getopt::Long;

my $filename='';
my $filemin='';
my $filemax='';
#Get options
  GetOptions (
  'filename'=s => \$filename,
  'filemin'=i => \$filemin,
  'filemax'=i => \$filemax,
);
