# H2O Molecule using GW100 Method

This repository contains 3 applications modified from the [GW100 application](https://www.cp2k.org/exercises:2017_uzh_cp2k-tutorial:gw).
The applications have been modified the following way:

- Within the MGRIDS subblock in the application, setting NGRIDS=1 and varying 
the cutoff gives specific FFT3d sizes.

| Cutoff | FFT Size |
|:------:|:--------:|
| 100 | 64^3 |
| 450 | 128^3 |


## Executing the application
### Requirements

- `cp2k.ssmp` executable, which is one that can execute OpenMP 

### Execution

The bash file can be used to execute on NOCTUA cluster :

`sbatch cp2k_h2o_gw100.sh <application-name>`
