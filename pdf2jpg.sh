# covert a directory full of pdfs to jpgs

list_of_files=$(ls -1 *.pdf)

# output location 
output='/home/mgrobelny/Data/IB271/IB271_jpg/lab5/'

for pdf in $list_of_files
do
  echo $pdf
  jpg=".jpg"
  
  # append jpg output 
  jpg_file=$output${pdf:0:-4}$jpg
  echo $jpg_file
  # Requires ImageMagick 
  convert $pdf $jpg_file
done
