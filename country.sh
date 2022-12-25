#!/bin/bash

# This script accepts a country namee and returns first 50 results

if [[ "${#}" -eq 0 ]]
then 
	echo "Error :No Argument passed" 
	exit 1
else	
	result=$(curl -X GET --header "Accept: */*" "http://universities.hipolabs.com/search?country=${1}")
	echo "Response from server"
	echo $result | jq -r '.[] | [.country, .name] | @csv' | awk -v FS="," 'BEGIN{print "Country\tUniversity";print "============"}{printf "%s\t%s%s",$1,$2,ORS}' | head -n 50 
	exit
fi
