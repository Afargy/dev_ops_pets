#!/bin/bash

# exit code means next
# 1: wrong amount of arguments
# 2: wrong arguments
# 3: not enough space on the disk

source check_arguments.sh

error=0 
message=""

if [ $# -ne 6 ]; then
  check_arguments_amount $#
fi

if [ $error -eq 0 ]; then 
  check_path "$1"
  check_is_number "$2" "2"
  check_name "$3" "7" "3"
  check_is_number "$4" "4"
  check_file_name "$5" "5"
  check_size "$6"
fi

if [ $error -ne 0 ]; then
  echo -e "\t!!!ERROR ERROR ERROR!!!\n$message"
  echo "code: $error"
  exit $error
fi

source create_files.sh

create_folder $1 $2 $3 $4 $5 $6
