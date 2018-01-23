#!/bin/bash

module load tacc-singularity

echo "iMicrobe Puca begin"
echo "run.sh arguments:"
echo "$@"

echo "singularity exec /work/projects/singularity/TACC/biocontainers/$1 $2"

singularity exec /work/projects/singularity/TACC/biocontainers/$1 $2

echo "iMicrobe Puca completed"
