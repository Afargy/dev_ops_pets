#!/bin/bash

if [[ $2 -eq 0 ]]; then
  echo "Error: not enough arguments"
elif [[ $2 -gt 1 ]]; then
  echo "Error: too many arguments"
elif [[ $1 =~ ^[0-9]+$ ]];then
  echo "Error: argument is a number"
else 
  echo "$1"
fi