#!/bin/bash

# This Script counts the frequency of letters from an input sentence.

#Check if input is valid
if [[ -z ${1} ]]
then
	echo "Use the script like this: ${0} -file_name"
	exit 1
fi

SENTENCE=$(cat ${1})
if [[ -z "${SENTENCE}" ]]
then
	echo "${1} is an empty file."
	exit 1
fi

cat ${1} | tr '[:upper:]' '[:lower:]' | tr " " '\n' | sort | uniq -c | sort -nr | awk -F ' ' '{print $2 " " $1}' | tr '\n' ' '
