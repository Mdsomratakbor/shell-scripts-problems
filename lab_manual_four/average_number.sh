echo "Enter the number of elements: "
read n

sum=0
count=0

echo "Enter the numbers: "
while [ $count -lt $n ]
do
    read num
    sum=$((sum + num))
    count=$((count + 1))
done

average=$(echo "scale=2; $sum / $n" | bc)

echo "The average of the $n numbers is: $average"
