# Function to print a border
border() {
    z=82
    i=0
    while [ $i -lt $z ]; do
        echo -n "-"
        i=$((i + 1))
    done
    echo ""
}

# Function to allocate memory blocks to processes
allocate_memory() {
    local blocks=("$@")
    local processes=("$@")

    border
    printf "|%-10s| %-15s| %-10s| %-15s| %-10s| %-10s|\n" "Processes" "Processes size" "Blocks" "Blocks size" "Allocated" "Int. Frag."
    border

    for ((i = 0; i < num_processes; i++)); do
        process_mem=${process_mem_req[i]}
        allocated=0

        for ((j = 0; j < num_blocks; j++)); do
            if [[ ${block_size[j]} -ge $process_mem ]]; then
                int_frag=$((block_size[j] - process_mem))
                printf "|%-10d| %-15d| %-10d |%-15d| %-10s| %-10d|\n" $((i + 1)) $process_mem $((j + 1)) ${block_size_orig[j]} "YES" $int_frag
                block_size[j]=$((block_size[j] - process_mem))
                allocated=1
                break
            fi
        done

        if [[ $allocated -eq 0 ]]; then
            printf "|%-10d| %-15d| %-10s |%-15s| %-10s| %-10s|\n" $((i + 1)) $process_mem "N/A" "N/A" "NO" "N/A"
        fi
    done
    border
}

# Input: Number of blocks
echo "Enter the number of Blocks: "
read num_blocks

# Input: Sizes of each block
declare -a block_size
declare -a block_size_orig
for ((i = 0; i < num_blocks; i++)); do
    echo "Block $((i + 1)) size: "
    read block_size[i]
    block_size_orig[i]=${block_size[i]}
done

# Input: Number of processes
echo "Enter the number of processes: "
read num_processes

# Input: Memory required for each process
declare -a process_mem_req
for ((i = 0; i < num_processes; i++)); do
    echo "Enter memory required for process $((i + 1)): "
    read process_mem_req[i]
done

# Allocate memory blocks to processes
allocate_memory "${block_size[@]}" "${process_mem_req[@]}"
