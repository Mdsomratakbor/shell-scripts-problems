echo "Enter number:"
read n
if [ `expr $n % 2` -eq 0 ]
then
    echo "Number is even"
else
    echo "Number is odd"
fi