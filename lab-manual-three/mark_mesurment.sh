echo "Enter student's score (out of 100):"
read score

# Function to calculate grade based on score
calculate_grade() {
    local score=$1
    case $score in
        90*|100) grade="A" ;;
        80*|89) grade="B" ;;
        70*|79) grade="C" ;;
        60*|69) grade="D" ;;
        *) grade="F" ;;
    esac
    echo "Student's grade: $grade"
}

# Check if the input score is valid
if [[ $score -ge 0 && $score -le 100 ]]; then
    calculate_grade $score
else
    echo "Invalid score. Please enter a score between 0 and 100."
fi
