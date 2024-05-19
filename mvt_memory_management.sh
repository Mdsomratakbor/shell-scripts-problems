echo -n "Enter the total memory available (in Bytes): "
read totalMemory

declare -a allocatedProcessMemory
declare -a notAllocatedProcessMemory
declare -a notAllocatedProcess

i=1
totalAllocatedMemory=0
continueAllocating="yes"

while [ $totalAllocatedMemory -lt $totalMemory ] && [ "$continueAllocating" = "yes" ]
do
    echo -n "Enter memory required for Process $i (in Bytes): "
    read inputProcessMemory

    if [ $inputProcessMemory -le $((totalMemory - totalAllocatedMemory)) ]
    then
        allocatedProcessMemory[$i]=$inputProcessMemory
        totalAllocatedMemory=$((totalAllocatedMemory + inputProcessMemory))
        echo "Process $i memory allocated successfully."

        echo -n "Do you want to continue allocating memory? (yes/no): "
        read continueAllocating
    else
        notAllocatedProcess[$i]=$inputProcessMemory
        notAllocatedProcessMemory[$i]=$inputProcessMemory
        echo "Process $i memory allocation failed. Not enough memory."
    fi

    i=$((i+1))
done


border() {
    for ((j=0; j<62; j++))
    do
        echo -n "-"
    done
    echo ""
}




externalFragmentation=$((totalMemory - totalAllocatedMemory))

echo "Memory Allocation Summary:"
echo "--------------------------"
echo "Total Memory Available: $totalMemory Bytes"

echo "PROCESS ---------- MEMORY-ALLOCATED"

# echo "Allocated Process Memory: ${allocatedProcessMemory[@]} Bytes"

# echo "Processes with Unallocated Memory: ${notAllocatedProcess[@]} Bytes"

border
    printf "|%-18s|%-20s|%-20s|\n" "Process Id" "Allocated Memory" "Not Allocated Memory"
border


for ((p=1; p<$i; p++))
do
    printf "|%-18s|%-20s|%-20s|\n" "P$p" "${allocatedProcessMemory[p]}"  "${notAllocatedProcess[p]}"
done
border


echo "Total Allocated Memory is: $totalAllocatedMemory Bytes"
echo "Total External Fragmentation is: $externalFragmentation Bytes"