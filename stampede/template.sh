#!/bin/bash

echo "Started iMicrobe Puca template.sh $(date)"

echo "SHUB_URL        \"${SH_URL}\""
echo "CMD_LINE      \"${CMD_LINE}\""

time sh run.sh \
    ${SHUB_URL} ${CMD_LINE}

echo "Ended iMicrobe Puca template.sh $(date)"
exit 0
