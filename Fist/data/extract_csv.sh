#!/bin/bash

in_cp2k_name_64=h2o_gw100_100_64.inp
in_cp2k_name_128=h2o_gw100_450_128.inp

out_cp2k_fft_name_64=cp2k_64_fft_runtime_test.csv
out_cp2k_fft_name_128=cp2k_128_fft_runtime.csv

grep -ri "threads, runtime (s) " > $out_cp2k_fft_name_64
grep -ri "fft3d_s" 64/ | tr -s " " | sed -e "s/.\/h2o_gw100_100_64.inp_//g" | sed  -e "s/.out://g" | sed -e "s/ /,/g" | cut -d "," -f 1,5 | sort -n >> $out_cp2k_fft_name_64
 
#grep -ri "threads, runtime (s) " > ${out_cp2k_fft_name_128}
#grep -ri "fft3d_s" 64/ | tr -s " " | sed -e "s/.\/h2o_gw100_450_128.inp_//g" | sed -e "s/.out://g" | sed -e "s/ /,/g" | cut -d "," -f 1,5 | sort -n >> ${out_cp2k_fft_name_128}
 

#out_cp2k_name_64=cp2k_64_runtime.csv
#out_cp2k_name_128=cp2k_128_runtime.csv

#grep -ri "threads, runtime (s) " > ${out_cp2k_name_64}
#grep -ri "CP2K  " 64/ | tr -s " " | sed -e "s/.\/h2o_gw100_100_64.inp_//g" | sed -e "s/.out://g" | sed -e "s/ /,/g" | cut -d "," -f 1,7 | sort -n >> ${out_cp2k_name_64}

#grep -ri "threads, runtime (s) " > ${out_cp2k_name_128} 
#grep -ri "CP2K  " 128/ | tr -s " " | sed -e "s/.\/h2o_gw100_450_128.inp_//g" | sed -e "s/.out://g" | sed -e "s/ /,/g" | cut -d "," -f 1,7 | sort -n >> ${out_cp2k_name_128}

