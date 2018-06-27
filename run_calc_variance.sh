#!/bin/bash

# Quick run
#for I in `seq 0 5 999` 995
#do
#  python calc_variance.py \
#    --checkpoint-dir chkpts_halfcheetah_2_15 \
#    --checkpoint $I \
#    --n-epochs 2 \
#    --n-samples 10 \
#    >> log_halfcheetah_2_15_normal_value.txt
#done
#
#exit

# Long run
#for I in `seq 0 100 999` 995
#do
#  python calc_variance.py \
#    --checkpoint-dir chkpts/half_cheetah_2_6_disc_value \
#    --checkpoint $I \
#    --n-epochs 40 \
#    --n-samples 50 \
#    >> logs/variance/halfcheetah_2_16_disc_value.txt
#done

DATE=2_23
for CHKPT in halfcheetah_${DATE}_normal_value humanoid_${DATE}_normal_value halfcheetah_${DATE}_disc_value humanoid_${DATE}_disc_value
do
  for I in `seq 0 100 999` 995
  do
    python calc_variance.py \
      --checkpoint-dir chkpts/$CHKPT \
      --checkpoint $I \
      --n-epochs 40 \
      --n-samples 50 \
      >> logs/variance/$CHKPT.txt
  done
done


