# Taking input from user
echo "Enter the angles of triangle"
read A1
read A2
read A3

# storing the sum of angles in sum variable
sum=$((A1+A2+A3))

# checking if sum is equal to 180  
if [ $sum -eq 180 ]
  
# if condition is satisfied  
  then
   echo "Valid triangle"

# if condition is not satisfied  
else
  
   echo "Invalid triangle"

# end of if loop
fi
