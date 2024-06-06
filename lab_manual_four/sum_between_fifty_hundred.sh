number=50
sum=0

# Loop while number is less than or equal to 100
while [ $number -le 100 ]
do
    # Check if the number is divisible by 3 and not divisible by 5
    if [ $((number % 3)) -eq 0 ] && [ $((number % 5)) -ne 0 ]; then
        # If conditions are met, add the number to the sum
        sum=$((sum + number))
    fi

    # Increment the number
    number=$((number + 1))
done

# Print the sum
echo "Sum of numbers between 50 and 100, divisible by 3 and not divisible by 5: $sum"
