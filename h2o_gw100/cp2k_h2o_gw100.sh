#!/bin/bash
#SBATCH -A pc2-mitarbeiter
#SBATCH -J h2o_gw100
#SBATCH -p batch
#SBATCH -N 1
#SBATCH -t 1:29:00

module load compiler/GCC/8.3.0

appl=$1
current_time=$(date "+%Y.%m.%d-%H.%M")
echo "Application ${appl}"

for thread in {1..40}
do
    echo "Running with number of threads : $thread"
    export OMP_NUM_THREADS=${thread}
    srun --cpu-bind=verbose,cores --distribution=block:cyclic ../../cp2k_latest/exe/local/cp2k.ssmp -i ${appl} > data/${appl}_${thread}_${current_time}.out
done

#export OMP_NUM_THREADS=20
#srun --cpu-bind=verbose,cores --distribution=block:block ../../cp2k_latest/exe/local/cp2k.ssmp -i ${appl} > data/${appl}_${current_time}_block.out
#srun --cpu-bind=verbose,cores --distribution=block:cyclic ../../cp2k_latest/exe/local/cp2k.ssmp -i ${appl} > data/${appl}_${current_time}_cycle.out
