echo "Enter the numbers separated by spaces:"
read a numbers

# Initialize smallest to the first number
smallest=${numbers[0]}

# Loop through the numbers to find the smallest
for num in "${numbers[@]}"
do
    if [ "$num" -lt "$smallest" ]; then
        smallest=$num
    fi
done

echo "The smallest number is: $smallest"
