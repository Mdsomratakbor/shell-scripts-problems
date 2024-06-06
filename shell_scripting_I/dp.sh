a=$((4+5))
echo $a
b=$((3*5))
echo $b
c=$(($b*$1))
echo $c
echo $(($c%$2*$a+$b))
((c++))
read -p "Enter the circle radius": r


area=`echo "scale=2; 3.1416*$r*$r" | bc`
echo "area of Circle :$area"

circunference=`echo "scale=2; 2*3.1416*$r" | bc`
echo "circumference of circle :$circunference"

echo "scale=5; 123.456789/345.345345" | bc
echo "scale=4;20+5/2" | bc

read -p "Enter degree celsius temperature: " celsius

fahrenheit=`echo "scale=4; $celsius*1.8 + 32" | bc`
echo "$celsius degree celsius is equal to $fahrenheit degree fahrenheit"


