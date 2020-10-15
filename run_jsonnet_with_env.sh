#!/bin/bash
EXT_STR_FLAGS=''
for E in $(awk 'BEGIN{for(v in ENVIRON) print v}')
do
    # exclude unset variables, AWKLIBPATH and AWKPATH
    if [[ ! -z $E ]] && [ ! $E = 'AWKLIBPATH' ] && [ ! $E = 'AWKPATH' ]; then
        EXT_STR_FLAGS="${EXT_STR_FLAGS} --ext-str ${E}" 
    fi
done
eval jsonnet $EXT_STR_FLAGS $1
