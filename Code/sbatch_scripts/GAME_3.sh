#!/bin/bash -e

#SBATCH --job-name=game3
#SBATCH --nodes=1
#SBATCH --open-mode=append
#SBATCH --output=./slurm_logs/%j_game3.out
#SBATCH --error=./slurm_logs/%j_game3.err
#SBATCH --export=ALL
#SBATCH --cpus-per-task=4 
#SBATCH --ntasks-per-node=1
#SBATCH --mem=64G
#SBATCH --time=10:00:00
#SBATCH --mail-type=ALL
#SBATCH -c 8
#SBATCH --mail-user=adis@nyu.edu

singularity exec --nv --overlay $SCRATCH/overlay-50G-10M.ext3:ro /scratch/work/public/singularity/cuda11.0-cudnn8-devel-ubuntu18.04.sif /bin/bash -c '

source /ext3/env.sh
conda activate

echo ">>>> starting evals"

python3 /scratch/as11919/temporal-goals-in-games/Code/GAME_3_SOLVER.py

echo ">>>> done with evals"

'
