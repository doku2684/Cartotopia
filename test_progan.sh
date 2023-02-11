#!/bin/bash
# Job name:
#SBATCH --job-name=train_progan_bathymetry
#
# Account:
#SBATCH --account=fc_wilmott
#
# Partition:
#SBATCH --partition=savio3_gpu
#
# Number of nodes:
#SBATCH --nodes=1
#
# Number of tasks (one for each GPU desired for use case) (example):
#SBATCH --ntasks=4
#
# Processors per task:

# Always at least twice the number of GPUs (savio2_gpu and GTX2080TI in savio3_gpu)
# Four times the number for TITAN and V100 in savio3_gpu
# Eight times the number for A40 in savio3_gpu
#SBATCH --cpus-per-task=2
#
#Number of GPUs, this can be in the format of "gpu:[1-4]", or "gpu:K80:[1-4] with the type included
#SBATCH --gres=gpu:GTX2080TI:4
#
# Wall clock limit:
#SBATCH --time=3-00:00:00
#
## Command(s) to run (example):
module load python
python train_network_savio.py --config=maps_savio.conf >& progan_output.out
