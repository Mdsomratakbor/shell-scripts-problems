echo "Enter the length of the rectangle:"
read length

echo "Enter the width of the rectangle:"
read width

# Calculate area
area=$(echo "$length * $width" | bc)

# Calculate perimeter
perimeter=$(echo "2 * ($length + $width)" | bc)

echo "Area of the rectangle: $area"
echo "Perimeter of the rectangle: $perimeter"

