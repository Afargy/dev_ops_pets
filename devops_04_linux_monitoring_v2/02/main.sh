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
  check_name "$1" "7" "1"
  check_file_name "$2" "2"
  check_size "$3"
fi

if [ $error -ne 0 ]; then
  echo -e "\t!!!ERROR ERROR ERROR!!!\n$message"
  echo "code: $error"
  exit $error
fi

source create_files.sh

choose_path $1 $2 $3

