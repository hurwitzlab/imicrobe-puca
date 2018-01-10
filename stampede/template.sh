#!/bin/bash

echo "Started iMicrobe Puca template.sh $(date)"

echo "BC_NAME       \"${BC_NAME}\""
echo "CMD_LINE      \"${CMD_LINE}\""

time sh run.sh \
    ${BC_NAME} ${CMD_LINE}

echo "Ended iMicrobe Puca template.sh $(date)"
exit 0
