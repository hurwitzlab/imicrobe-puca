#!/bin/bash

module load singularity

echo "iMicrobe Puca begin"
echo "run.sh arguments:"
echo "$@"

module load singularity

singularity pull $1

singularity run $2

echo "iMicrobe Puca completed"
