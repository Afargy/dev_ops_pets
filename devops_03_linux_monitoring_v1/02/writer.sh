#!/bin/bash

read -p 'Write this data to the file? [y/n]' answer 

if [[ $answer =~ ^[Yy]$ ]]; then
  file="$(date +%d_%m_%y_%H_%M_%S).status"
  ./system_data.sh >> $file
  echo "Saved fo the file. Bye!"
else 
  echo "Okay bye-bye"
fi
