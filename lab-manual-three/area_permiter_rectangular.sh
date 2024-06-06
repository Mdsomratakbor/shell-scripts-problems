echo "Enter the length of the rectangle"
read l
echo "Enter the breadth of the rectangle"
read b
echo "Enter the side of the square"
read a
areaR=`expr $l \* $b`
periR=`expr $l \* 2 + $b \* 2`
areaS=`expr $a \* $a`
periS=`expr 4 \* $a`
echo "Area of the rectangle = $areaR"
echo "Perimeter of the rectangle = $periR"
echo "Area of the square = $areaS"
echo "Perimeter of the square =$periS"
