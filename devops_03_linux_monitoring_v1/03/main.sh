#!/bin/bash

chmod +x *.sh

if [[ $# -ne 4 ]]; then 
  echo "The script must have four arguments"
  ./repeat.sh
elif [[ ! $1 =~ ^[1-6]+$ ]]; then
  echo "Wrong argument #1: Only number arguments. From 1 to 6"
  ./repeat.sh
elif [[ ! $2 =~ ^[1-6]+$ ]]; then
  echo "Wrong argument #2: Only number arguments. From 1 to 6"
  ./repeat.sh
elif [[ ! $3 =~ ^[1-6]+$ ]]; then
  echo "Wrong argument #3: Only number arguments. From 1 to 6"
  ./repeat.sh
elif [[ ! $4 =~ ^[1-6]+$ ]]; then
  echo "Wrong argument #4: Only number arguments. From 1 to 6"
  ./repeat.sh
elif [[ $1 -eq $2 ]]; then
  echo "The first and the second arguments must be diffrent"
  ./repeat.sh
elif [[ $3 -eq $4 ]]; then
  echo "The third and the fourth arguments must be diffrent"
  ./repeat.sh 
else
  source set_color.sh $1 $2 $3 $4
  source ./system_data.sh 
fi