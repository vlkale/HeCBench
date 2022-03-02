#!/bin/bash                                                                                                                                                                                                                                                      

# For OMP target offloading                                                                                                                                                                                                                                      
export LIBOMPTARGET_PLUGIN=OPENCL

for dir in *-omp
do
  cd "${dir}"
  make clean
  echo "${dir} results:"
  export ARCH=gfx90a
  export CC=amdclang++
  for (( i = 0; i < 10; i = i + 1 ))
  do
      make run CC=amdclang++ ARCH=gfx90a &> report${i}.txt
  done
  grep -H "Total" report*.txt
  make clean
  cd ..
done



for dir in *-hip
do
  cd "${dir}"
  make clean
  echo "${dir} results:"
  for (( i = 0; i < 10; i = i + 1 ))
  do

      make run ARCH=gfx90a &> report${i}.txt
  done
  grep -H "Total" report*.txt
  make clean
  cd ..
done


