# Comparing Performances for H2O molecular CP2K runs with GW100 Method

This repository contains 3 applications modified from the [GW100 application]{}.
The applications have been modified the following way:

- Within the MGRIDS subblock in the application, setting NGRIDS=1 and varying 
the cutoff gives specific FFT3d sizes. The cutoffs are mentioned below:


## Executing the application

### Requirements

- `cp2k.ssmp` executable, which is one that can execute OpenMP 

### Execution

The bash file can be used to execute on NOCTUA cluster :

`sbatch cp2k_h2o_gw100.sh <application-name>`

1. loads gcc/8.3.0

2. sets openmp thread affinity env variables

3. Executes the cp2k application using srun on the same node from 1 to 40 threads 
    one after another and saves the output in distinct reports.

## Performance Results

Performance comparison on using multithreading for the entire CP2K execution:


Performance comparison on using multithreading for only the FFT3d routine in 
CP2K for different applications:

Performance comparison between FPGA execution of FFT3d and the best multithreaded 
FFT3d performance 

Compare the FPGA execution of CP2K and the best multithreaded execution of CP2K:

Speedup Obtained when using multithreading:

Speedup obtained when using FPGA execution:


### Note

1. For 64 cube FFT application, using 20 threads pinned to cores showed better
  performance than using 40 threads due to NUMA effects

2. For any application, pinning threads to cores showed the same if not better
  performance than pinning to sockets

3. For 128 cube FFT application, using 40 threads showed better performance than
  20 threads showing strong scaling effects outweighing the memory access
  latency

# Experiment Data and others

## Multithreading

Use OpenMP thread affinity environment variables to pin threads to cores since 
it shows better performance than sockets. 

Pinning threads using `cpu-bind` to slurm shows 9 times better performance using
sockets than cores, which could be due to slurm pinning all the threads to a single CPU. 

### Thread affinity env variables

```
OMP_DISPLAY_AFFINITY= TRUE
OMP_DISPLAY_ENV=TRUE
OMP_PLACE=cores
OMP_PROC_BIN=close
```

### Performance 

- core pinned = 0.115sec < socket pinned = 0.159sec, for 20 threads 

## Data

The following experiment data can be found for reference:

1. files in `csv` format consolidating strong scaling results for different
   applications from 1 to 40 threads.

2. cp2k output files to compare core and socket pinning for 20 and 40 threads
   for 64 FFT3d application in the directory `expm`.




