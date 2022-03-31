#!/bin/bash
#SBATCH -J "h2o_custom_cp2k"
#SBATCH -A pc2-mitarbeiter
#SBATCH -p all
#SBATCH -N 1
#SBATCH --ntasks-per-node=1
#SBATCH -t 00:30:00

module reset
module use $PC2SW/CHEM_PHYS_SW/modules
#module load chem/CP2K/7.1_gnu
#or
module load chem/CP2K/8.1_gnu

appl=$1
echo "Application: ${appl}"

export OMP_NUM_THREADS=37
export OMP_STACKSIZE=100m

mpirun --report-bindings cp2k.psmp -i ${appl} > ${appl}.out 2> err
