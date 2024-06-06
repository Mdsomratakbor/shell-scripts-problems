for((i=2000; i<=2036; i++))do
if [ `expr $i % 2` -eq 0 ]
then
echo "$i is a leap year"
elif [ `expr $i % 4` -eq 0 `expr $i % 100` != 0 ]
then
echo "$i is a leap year"
fi
done