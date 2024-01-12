#!/bin/bash

if [[ $# -eq 0 ]]; then
  chmod +x *.sh
  ./system_data.sh
  ./writer.sh
else 
  echo "This script has no arguments"
fi