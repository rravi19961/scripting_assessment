#!/bin/bash

# This script reverses the words in a string keeping the order intact.

if [[ ${#} -eq 0 ]]
then 
	printf '%s\n' "Error: Input data not provided" >&2
        exit 1
else	
	for WORD in ${@};
      	do
        	REVERSE=$(expr $WORD| rev)
        	RESULT="$RESULT $REVERSE"
      	done
      	RESULT=$(echo "${RESULT## }" | tr '[:upper:]' '[:lower:]')
      	echo "${RESULT^}"
fi
