#!/bin/bash

# This script generates an encrypted form of a password and returns algo name, input text and length of encrypted password.
# -a is for printing algo name used
# -t is for printing the password provided
# -l is for ptinting the length of the generated password
# Parse the arguements

if [[ -z ${1} ]]
then
        TEXT_TO_ENCRYPT=$(date +%s%N${RANDOM})
else
        TEXT_TO_ENCRYPT=${1}
fi
shift
# Select an algorithm
ALGO_NO=$(expr ${RANDOM} % 5)
case ${ALGO_NO} in
	0)
		ALGO='sha256sum'
		;;
	1)
		ALGO='sha1sum'
		;;
	2)
		ALGO='sha384sum'
		;;
	3)
		ALGO='sha512sum'
		;;
	4)
		ALGO='sha224sum'
		;;
esac

# Generate encryption
ENCRYPT=$(echo "${TEXT_TO_ENCRYPT}" | ${ALGO})
echo "Encrypted password: ${ENCRYPT}"

while getopts atl OPTION
do
	case ${OPTION} in
		a)
			echo "Algorithm used: ${ALGO}"
			;;
		t)
			echo "Entered password: ${TEXT_TO_ENCRYPT}"
			;;
		l)
			LEN=$(echo "${ENCRYPT}" | awk '{print length}')
        		echo "Encrypted password length is ${LEN}"
                        ;;
		?)
			echo "Invalid arguement passed"
			exit 1
			;;
	esac
done
