echo "Enter n value:"
read n

sumodd=0
sumeven=0
i=0

while [ $i -lt $n ]
do
    echo "Enter Number:"
    read num

    if [ `expr $num % 2` -eq 0 ]
    then
        sumeven=`expr $sumeven + $num`
    else
        sumodd=`expr $sumodd + $num`
    fi

    i=`expr $i + 1`
done

echo "Sum of odd numbers = $sumodd"
echo "Sum of even numbers = $sumeven"
