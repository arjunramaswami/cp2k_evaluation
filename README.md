# Applications used to analyze FFT3d's performance in CP2K

This repository contains the applications used to compare the performance of the
following configurations of CP2K, specifically for the FFT3d routine: 

1. Singlethreaded single process CP2K execution (sopt)
2. Multithreaded single process CP2K execution (ssmp)
3. FPGA 

The list of the applications include:

1. Fayalite molecule using Fist Method
2. H2O molecule using the GW100 Method

The applications found within the Fayalite and the GW100 Method  directories 
have been modified to obtain specific FFT3d Sizes in order to compare amongst 
the above mentioned configurations. The sizes are (in cubes)

- 16, 32, 64, 128, 256

Each directory also contains the scripts and the data extracted from the
execution.
