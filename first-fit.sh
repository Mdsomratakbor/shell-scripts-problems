#!/bin/bash

# Input
read -p "Enter the number of blocks: " num_blocks
read -p "Enter the number of files: " num_files

# Read block sizes
declare -a blocks
declare -a original_blocks
echo "Enter the size of the blocks:-"
for (( i=1; i<=num_blocks; i++ ))
do
    read -p "Block $i: " size
    blocks[$i]=$size
    original_blocks[$i]=$size
done

# Read file sizes
declare -a files
echo "Enter the size of the files:-"
for (( i=1; i<=num_files; i++ ))
do
    read -p "File $i: " size
    files[$i]=$size
done

# Output with borders
printf "%-10s %-10s %-10s %-10s %-10s\n" "File_no" "File_size" "Block_no" "Block_size" "Fragment"
printf "%-10s %-10s %-10s %-10s %-10s\n" "--------" "---------" "--------" "----------" "--------"

# Initialize totals
total_fragment=0
total_file_size=0
total_block_size=0

# Allocate files to blocks and calculate fragmentation
for (( i=1; i<=num_files; i++ ))
do
    for (( j=1; j<=num_blocks; j++ ))
    do
        if (( ${files[$i]} <= ${blocks[$j]} ))
        then
            fragment=$((blocks[j] - files[i]))
            total_fragment=$((total_fragment + fragment))
            total_file_size=$((total_file_size + files[i]))
            total_block_size=$((total_block_size + original_blocks[j]))
            printf "%-10s %-10s %-10s %-10s %-10s\n" "$i" "${files[$i]}" "$j" "${original_blocks[$j]}" "$fragment"
            blocks[$j]=0  # Mark the block as used
            break
        fi
    done
done

# Display totals
printf "%-10s %-10s %-10s %-10s %-10s\n" "Total" "$total_file_size" "" "$total_block_size" "$total_fragment"
