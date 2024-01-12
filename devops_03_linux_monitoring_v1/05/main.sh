#!/bin/bash

chmod +x *.sh

if [[ $# -eq 1 ]]; then
  if [[ $1 =~ [*/]$ ]]; then 
    begin=$(date +%s%N)
    source ./check.sh $1
    source ./show.sh
    end=$(date +%s%N)
    diff=$(($end - $begin))
    secs=$(($diff / 1000000000))
    echo "Script running time: $secs secund(s)"
  else 
    echo "The path must end with /"
  fi
else 
  echo "This script must has have one argument"
fi
