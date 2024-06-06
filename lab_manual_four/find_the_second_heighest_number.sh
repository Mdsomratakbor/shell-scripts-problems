numbers=(10 20 30 40 50 60 70)

# Initialize variables to store the highest and second highest numbers
highest=-9999999
second_highest=-9999999

# Loop through each number in the array
for number in "${numbers[@]}"
do
    # Check if the current number is greater than the highest number
    if [ "$number" -gt "$highest" ]; then
        # If yes, update both highest and second highest
        second_highest="$highest"
        highest="$number"
    # Check if the current number is greater than the second highest but not equal to the highest
    elif [ "$number" -gt "$second_highest" ] && [ "$number" -ne "$highest" ]; then
        # If yes, update the second highest number
        second_highest="$number"
    fi
done

# Print the second highest number
echo "Second highest number: $second_highest"
