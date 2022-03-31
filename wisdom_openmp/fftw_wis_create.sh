#!/bin/bash
#SBATCH -A pc2-mitarbeiter
#SBATCH -J wis_creator
#SBATCH -p all
#SBATCH -N 1
#SBATCH -t 10:29:00

module load toolchain/gompi/
module load numlib/FFTW/3.3.8-gompi-2020b

THREADS=40

echo "Creating Wisdom for $THREADS threads"
fftw-wisdom -v -o 256/wis_256_t40.fftw -n --threads=40 cif256x256x256
