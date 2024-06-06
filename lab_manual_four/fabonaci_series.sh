
echo "Enter the number of terms for Fibonacci series:"
read N

# First Number of the Fibonacci Series
a=0

# Second Number of the Fibonacci Series
b=1

echo "The Fibonacci series is : "

i=0
while [ $i -lt $N ]  # Using while loop with arithmetic comparison
do
    echo -n "$a "
    fn=$((a + b))
    a=$b
    b=$fn
    i=$((i + 1))
done
