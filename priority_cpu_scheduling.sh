
arrangePriority(){
    i=0
    while [ $i -lt $n ]
    do
        j=$((i+1))
        while [ $j -lt $n ]
        do
            if  [ ${priority[$i]} -gt ${priority[$j]} ]
            then
                temp=${arrival_time[$j]} 
                arrival_time[$j]=${arrival_time[$i]}   
                arrival_time[$i]=$temp 
                
                temp=${burst_time[$j]} 
                burst_time[$j]=${burst_time[$i]}   
                burst_time[$i]=$temp
                
                temp=${priority[$j]} 
                priority[$j]=${priority[$i]}   
                priority[$i]=$temp
                
                temp=${pid[$j]} 
                pid[$j]=${pid[$i]}   
                pid[$i]=$temp
            fi
            j=$((j+1))
        done
        i=$((i+1))
    done
}

findWaitingTime(){
    service_time[0]=0
    waiting_time[0]=0
    i=1
    while [ $i -lt $n ]
    do
        waiting_time[$i]=$(( ${tat[$(($i-1))]} ))
        i=$((i+1))
    done
}


findTurnAroundTime() {
    tat[0]=${burst_time[0]}
    i=1
    while [ $i -lt $n ]
    do
        tat[$i]=$(( tat[$i-1] + ${burst_time[$i]} ))
        i=$((i+1))
    done
}

border(){
    z=100
    i=0
    while [ $i -lt $z ]
    do
        echo -n "-"
        i=$((i+1))
    done
    echo ""
}


echo -n "Enter the number of processes: "
read n

declare -a pid
declare -a arrival_time
declare -a burst_time
declare -a priority

i=0
while [ $i -lt $n ]
do
    echo -n "Enter Process Id: "
    read pid[$i]
    # echo -n "Enter arrival time: "
    # read arrival_time[$i]
    echo -n "Enter burst time: "
    read burst_time[$i]
    echo -n "Enter priority: "
    read priority[$i]
    i=$((i+1))
done

arrangePriority

findTurnAroundTime
findWaitingTime




total_wt=0
total_tat=0
i=0
while [ $i -lt $n ]
do
    total_wt=$(( $total_wt + ${waiting_time[$i]} ))
    total_tat=$(( $total_tat + ${tat[$i]} ))
    i=$((i+1))
done



border
printf "|%-18s|%-20s|%-18s|%-20s|%-18s|\n" "Process Id" "Burst time" "Waiting time" "Turn around time" "Completion time"
border

# Display process details
i=0
while [ $i -lt $n ]
do
    completion_time=$(( ${arrival_time[$i]} + ${tat[$i]} ))
    printf "|%-18s|%-20s|%-18s|%-20s|%-18s|\n" ${pid[$i]} ${burst_time[$i]} ${waiting_time[$i]} ${tat[$i]} $completion_time
    i=$((i+1))
done

# Display table footer
border

# Calculate and display average waiting time and average turnaround time
avgwt=$((total_wt / n))
echo "Average waiting time = $avgwt"
avgtat=$((total_tat / n))
echo "Average turn around time = $avgtat"


