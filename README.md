# Performance Comparison of CP2K Applications

This repository contains the applications used to compare the performance of the
following configurations of CP2K, specifically for the FFT3d routine:

1. Multithreaded single process CP2K execution (ssmp)
2. FPGA

|     Applications    | Specific 3d FFT Configs | 
|:-------------------:|:---------------:|
| Fayalite using Fist | 8, 16, 32, 64   |
| H2O using GW        | 64, 128, 256    |

The H2O_GW100_64 application has been modified for different FFTW plans - `estimate` and `measure` to compare performance. Detailed description on plans can be found in the [fftw_plan](docs/fftw_plan.md) file.

## Build

Clone of CP2K commit `c0d078b`.

```bash
module load toolchain/gompi/2019b numlib/FFTW/3.3.8-gompi-2019b
module load numlib/ScaLAPACK/

./install_cp2k_toolchain.sh --with-fftw=system --mpi-mode=no --enable-omp=yes
./install_cp2k_toolchain.sh --with-fftw=system --with-scalapack=system --with-elpa=no --with-sirius=no
```

Rebuilding requires sourcing the setup file as shown below:

```bash
source /scratch/pc2-mitarbeiter/arjunr/cp2k_latest/tools/toolchain/install/setup
```

Make sure all the regression tests pass after every build stage:

- Directly on build

```bash
make -j 40 ARCH=local VERSION="sdbg sopt ssmp" test
make -j 20 ARCH=local VERSION="sopt sdbg ssmp popt pdbg psmp" test
```

- Separate application: `do_regtest`

```bash
./do_regtest -cp2kdir ../../ -arch local -version ssmp -nobuild -ompthreads 20
```

## Execution

Run the slurm scripts within each directory that executes the application by:

- Set Openmp thread affinity env variables to pin threads to cores.
- Scaling the number of threads from 1 to 40.
- Stores the output file to distinct directories based on the application's plan (the right input file has to be input by the user)

```bash
sbatch cp2k_h2o_gw100_est.sh h2o_gw100_100_64_est.inp // output in estimate folder
```

## Results

### H20 using GW

| Config | Total FFTW Runtime (sec) | # Calls | FFTW Runtime per call (ms) | DP FFTW (ms) | SP FFTW (ms) |
|:------:|:------------------------:|---------|----------------------------|--------------|--------------|
| 64 | 0.085 | 128 | 0.66  | 0.23 | 0.14 |
| 128 | 1.88 | 249 | 7.55 | 1.6  | 0.85 |

### Fayalite using Fist

| Config | Total FFTW Runtime (sec) | # Calls | FFTW Runtime per call (ms) | DP FFTW (ms) | SP FFTW (ms) |
|:------:|:------------------------:|---------|----------------------------|--------------|--------------|
| 64 | 0.029 | 8.8 | 3.29  | 0.23 | 0.14 |

- CP2K executes double precision 3d FFT
- DP and SP FFTW execution times are obtained from isolated experiments.

## TODO

1. Update to latest CP2K version
2. Enable avx512 by using all possible system libraries
3. Percentage of 3d fft in total cp2k with avx512 enabled 
4. Enable MPI executable
