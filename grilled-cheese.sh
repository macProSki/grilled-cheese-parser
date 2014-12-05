#!/bin/bash
# FILES=//Users/user/Desktop/files/*
# MONKEY=//Users/user/Desktop/monkey/*

 echo "Select your from folder (the one with all the stuff in it!)\n"
 read fromFolder
  echo "Select your to folder (the one which will have all the stuff in it!)\n"
 read toFolder
  echo "Please enter your cheese ingredient to search (keyword - case sensitive)\n"
 read keyword

  echo "Processing the cheese files..."

for f in $FILES
do
	parallel --pipe --block 2M grep $keyword < $f  >> //Users/user/Desktop/monkey/results.txt
	echo "having a little nibble of $f"	

done
  echo "Done nibbling that cheese!"	
  echo "Grilling the cheese..."	

grep -E -o ".{8}[-].{4}[-].{4}[-].{4}[-].{12}" //Users/user/Desktop/monkey/results.txt >> //Users/user/Desktop/monkey/$keyword.txt

  echo "Sorting the cheese..."	

cat //Users/user/Desktop/monkey/$keyword.txt | sort | uniq -c | sort -rn >> //Users/user/Desktop/monkey/sorted-$keyword.txt

  echo "eating the crust..."	

cat //Users/user/Desktop/monkey/sorted-$keyword.txt| awk '{print $2}' >> //Users/user/Desktop/monkey/sorted-unique-$keyword.txt

  echo "eating the grilled cheese..."	

mv //Users/user/Desktop/monkey/sorted-unique-$keyword.txt //Users/user/Desktop/done/$keyword.txt

echo "doing the washing up - god i hate the washing up..."

rm $MONKEY

echo "nice..."