use warnings;

if (($ARGV[0] eq "-h")||($ARGV[0] eq "--help")){
  print(
  " File Renaming Script\n\n
  This script will renames all files in a directory, starting from first to last, to:\n
  filename + [range of value (filemin to filemax)] + file_extension \n
  \n

  All parameters and defaults are:\n
  Defaults= []\n

  filename= [No default require]-- Name of file\n
  filemin='0' -- Lowest file number\n
  filemax= [total number of files] -- Highest file number (ie to the last file)\n
  file_ext= [optional no default]\n
  verbose= [FAlSE] -- print each file rename operation \n
  \n
  Example usage:\n
  perl recursiveFileRename.pl -filename Sequence -file_ext .xb.seq -v TRUE \n
  "
  );
  die;
};

use Getopt::Long;
# Get current directory
my $current_dir= `pwd`;
chomp($current_dir);

#collect file names in directory
my @filenames_in_dir = `ls`;
#my @filenames_in_dir= split(/""/, $filenames_in_dir);

#some init variables
my $filename='';
my $filemin='0';
my $filemax=scalar(@filenames_in_dir);
print($filemax);
my $file_ext='';
my $verbose='FAlSE';


#Get options
  GetOptions(
  'filename=s' => \$filename,
  'filemin:i' => \$filemin,
  'filemax:i'=> \$filemax,
  'file_ext:s'=> \$file_ext,
  'v:s'=> \$verbose
);

#change directory
chdir "$current_dir";

for ($filemin_start = $filemin ;  $filemin_start < $filemax; $filemin_start=$filemin_start+1) {
  my $it_filename= $filename . $filemin_start . $file_ext;
   my $file_to_change=$filenames_in_dir[$filemin_start];
   chomp($file_to_change);
  if ($verbose eq "TRUE") {
    print("Now renaming $file_to_change to $it_filename \n");
    system("mv -n -v $file_to_change $it_filename");
  }
  system("mv -n -v $file_to_change $it_filename");
}
@filenames_in_dir = `ls`;
$filemax=scalar(@filenames_in_dir);
print("$filemax\n");
die;
