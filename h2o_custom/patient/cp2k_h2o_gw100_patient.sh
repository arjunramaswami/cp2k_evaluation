#!/bin/bash
#SBATCH -A pc2-mitarbeiter
#SBATCH -J h2o_gw100
#SBATCH -p short 
#SBATCH -N 1
#SBATCH -t 29:00

## Execute cp2k multithreaded code 
##   Arg : application file
##   e.g. sbatch cp2k_h2o_gw100.sh h2o_gw100_gw100_64.inp
##   
## Each size is scaled from 1 to 40 threads, each performed iteration times
## Performance results are output to a file in data/ folder

module load toolchain/gompi/2019b
module load numlib/FFTW/3.3.8-gompi-2019b

source /scratch/pc2-mitarbeiter/arjunr/cp2k/tools/toolchain/install/setup

appl=$1
THREAD=40

echo "Application ${appl}"

## Set OMP Environment Variables
export OMP_DISPLAY_AFFINITY=TRUE
export OMP_DISPLAY_ENV=TRUE

export OMP_PLACES=cores
export OMP_PROC_BIND=close

export OMP_NUM_THREADS=$THREAD
echo "Running with number of threads : $THREAD"

../../../cp2k/exe/local/cp2k.ssmp -i ${appl} > ${appl}_t40.log

#../../cp2k_latest/exe/local/cp2k.ssmp -i ${appl} > data/${appl}_${thread}_${current_time}.out
#srun --cpu-bind=socket ../../cp2k_latest/exe/local/cp2k.ssmp -i ${appl} > data/${appl}_${thread}.out
