calculate_circle_perimeter() {
    echo "Enter the radius of the circle:"
    read radius
    perimeter=$(echo "scale=2; 2 * 3.14159 * $radius" | bc)
    echo "Perimeter of the circle with radius $radius is: $perimeter"
}

calculate_rectangle_perimeter() {
    echo "Enter the length of the rectangle:"
    read length
    echo "Enter the width of the rectangle:"
    read width
    perimeter=$(echo "scale=2; 2 * ($length + $width)" | bc)
    echo "Perimeter of the rectangle with length $length and width $width is: $perimeter"
}


calculate_triangle_perimeter() {
    echo "Enter the length of side 1 of the triangle:"
    read side1
    echo "Enter the length of side 2 of the triangle:"
    read side2
    echo "Enter the length of side 3 of the triangle:"
    read side3
    perimeter=$(echo "scale=2; $side1 + $side2 + $side3" | bc)
    echo "Perimeter of the triangle with side lengths $side1, $side2, and $side3 is: $perimeter"
}


while true; do
    echo "Choose a shape to calculate perimeter:"
    echo "1. Circle"
    echo "2. Rectangle"
    echo "3. Triangle"
    echo "4. Exit"

    read choice

    case $choice in
        1) calculate_circle_perimeter ;;
        2) calculate_rectangle_perimeter ;;
        3) calculate_triangle_perimeter ;;
        4) echo "Exiting..."; break ;;
        *) echo "Invalid choice. Please enter a number between 1 and 4."
    esac
done
 
S
