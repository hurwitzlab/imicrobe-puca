#!/bin/bash

# stampede can not load module tacc-singularity
module load singularity

echo "iMicrobe Puca begin"
echo "run.sh arguments:"
echo "$@"

singularity exec /work/projects/singularity/TACC/biocontainers/$1 $2

echo "iMicrobe Puca completed"
