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

sudo apt install -y goaccess

cd ../05
./main.sh $1 
goaccess --log-format=COMBINED code_sorted.log
cd ../06

