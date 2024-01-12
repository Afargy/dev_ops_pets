#!/bin/bash

# exit code means next
# 1: wrong amount of arguments
# 2: wrong arguments


source check_arguments.sh

error=0 
message=""
             
check_arguments_amount $#

if [ $error -eq 0 ]; then
  check_is_number $1
fi

if [ $error -ne 0 ]; then
  echo -e "\t!!!ERROR ERROR ERROR!!!\n$message"
  echo "code: $error"
  exit $error
fi

source sort_data.sh

logs=$(find ../04 -type f -name "*.log")

if [ "$logs" = "" ]; then
  cd ../04
  ./main.sh
  cd ../05
  logs=$(find ../04 -type f -name "*.log")
fi

case $1 in
  1) sort_code "$logs";;
  2) uniq_ip "$logs";;
  3) show_errors "$logs";;
  4) uniq_ip_with_errors "$logs";;
esac
