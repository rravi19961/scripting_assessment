#!/bin/bash

# This script scans a file to look for meetings for current day and next day and displays them in a tabular format

if [[ "${#}" -eq 0 ]]
then
	echo "Use the script like this: ${0} -file_name"
	exit 1
fi


for i in $( grep -A1 -i --no-group-separator 'Today\|Tomorrow' ${1} )
do
	if [[ "${i}" == 'Today' || "${i}" == 'Tomorrow' ]]
        then
        	FILE="${FILE} ${LINE}"
        	LINE="\n${i} : "
        else
         	LINE="${LINE} ${i}"
        fi
done
FILE="${FILE} ${LINE}"
echo -e ${FILE} | sort -k1 | column -t -s : 
