#!/bin/bash

# exit code means next
# 1: wrong amount of arguments
# 2: wrong arguments
# 3: not enough space on the disk
# 4: has no right to wright in the choosed path

source check_arguments.sh

error=0
message=""

check_arguments_amount $#

if [ $error -eq 0 ]; then 
  check_argument $1
fi

if [ $error -ne 0 ]; then
  echo -e "\t!!!ERROR ERROR ERROR!!!\n$message"
  echo "code: $error"
  exit $error
fi

way=0

choose_way $1

source cleaner.sh

if [ $way -eq 1 ]; then
  clean_by_log
elif [ $way -eq 2 ]; then
  clean_by_time
elif [ $way -eq 3 ]; then
  clean_by_mask
fi

