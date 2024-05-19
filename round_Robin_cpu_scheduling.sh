#!/bin/bash

arrangePriority() {
  # No priority sorting needed for RR
  return 0
}

findWaitingTime() {
  local remaining_time=()
  for ((i=0; i<n; i++)); do
    remaining_time[$i]=${burst_time[$i]}
  done

  local current_time=0
  while : ; do
    done_flag=true
    for ((i=0; i<n; i++)); do
      if [[ ${remaining_time[$i]} -gt 0 ]]; then
        done_flag=false

        if [[ ${remaining_time[$i]} -gt $time_quantum ]]; then
          current_time=$((current_time + time_quantum))
          remaining_time[$i]=$((remaining_time[$i] - time_quantum))
        else
          current_time=$((current_time + remaining_time[$i]))
          waiting_time[$i]=$((current_time - ${burst_time[$i]}))
          remaining_time[$i]=0
          completion_time[$i]=$current_time
        fi
      fi
    done
    if $done_flag; then
      break
    fi
  done
}

findTurnAroundTime() {
  for ((i=0; i<n; i++)); do
    tat[$i]=$((waiting_time[$i] + ${burst_time[$i]}))
  done
}

border() {
  z=100
  i=0
  while [ $i -lt $z ]; do
    echo -n "-"
    i=$((i+1))
  done
  echo ""
}

echo -n "Enter the number of processes: "
read n

declare -a pid
declare -a burst_time
declare -a waiting_time
declare -a tat
declare -a completion_time

for ((i=0; i<n; i++)); do
  echo -n "Enter Process Id: "
  read pid[$i]
  echo -n "Enter burst time: "
  read burst_time[$i]
done

echo -n "Enter time quantum: "
read time_quantum

findWaitingTime
findTurnAroundTime

total_wt=0
total_tat=0
for ((i=0; i<n; i++)); do
  total_wt=$((total_wt + waiting_time[$i]))
  total_tat=$((total_tat + tat[$i]))
done

border
printf "|%-18s|%-20s|%-18s|%-20s|%-18s|\n" "Process Id" "Burst time" "Waiting time" "Turn around time" "Completion time"
border

for ((i=0; i<n; i++)); do
  printf "|%-18s|%-20s|%-18s|%-20s|%-18s|\n" ${pid[$i]} ${burst_time[$i]} ${waiting_time[$i]} ${tat[$i]} ${completion_time[$i]}
done

border

avgwt=$((total_wt / n))
echo "Average waiting time = $avgwt"
avgtat=$((total_tat / n))
echo "Average turn around time = $avgtat"
