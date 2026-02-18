#!/usr/bin/env bash

#######################
# function of script:
# take a CSV file delimited by ";" (first argument)
# remove the header
# make tab separated
# sort according to the 6th (numeric) column
# in descending order
# redirect to a file (second argument)

# Author: Weigang Qiu
# Date: Feb 4, 2026
#########################

# input file name as the 1st argument
in_file=$1 

# column number
col_num=$2

# column name
col_name=$(head -n 1 $in_file | cut -f $col_num -d ",")

# extract distinct values
col_value=$(tail -n +2 $in_file | cut -f $col_num -d "," | sort | uniq | wc -l)

# mini
min_value=$(tail -n +2 $in_file | cut -f $col_num -d "," | sort -n | head -1)

# max
max_value=$(tail -n +2 $in_file | cut -f $col_num -d "," | sort -n | tail -1)

echo -ne "column name\t$col_name\n";
echo -ne "distinct vals\t$col_value\n";
echo -ne "min\t$min_value\n";
echo -ne "max\t$max_value\n";

exit;
