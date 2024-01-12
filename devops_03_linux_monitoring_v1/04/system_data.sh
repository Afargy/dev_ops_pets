#!/bin/bash

HOSTNAME=$(hostname)
TIMEZONE=$(timedatectl | awk '/Time zone/ {print $3, $4, $5}')
USER=$(whoami)
OS=$(lsb_release -d | awk -F"\t" '{print $2}')  
DATE=$(date | awk '{print $2, $3, $4, $5}')
UPTIME=$(uptime -p)
UPTIME_SEC=$(cat /proc/uptime | awk '{print $1}')
IP=$(hostname -i)
MASK=$(ip a | awk '/link\/loopback/ {print $2}')
GATEWAY=$(ip r | grep default | awk '{print $3}')
RAM_TOTAL=$(free --mega | awk '/Mem/ {printf ("%.3f GB\n", $2/1024)}')
RAM_USED=$(free --mega | awk '/Mem/ {printf ("%.3f GB\n", $3/1024)}')
RAM_FREE=$(free --mega | awk '/Mem/ {printf ("%.3f GB\n", $4/1024)}')
SPACE_ROOT=$(df -h | awk '$NF=="/" {print $2}')
SPACE_ROOT_USED=$(df -h | awk '$NF=="/" {print $3}')
SPACE_ROOT_FREE=$(df -h | awk '$NF=="/" {print $4}')

for item in HOSTNAME TIMEZONE USER OS DATE UPTIME UPTIME_SEC IP MASK GATEWAY RAM_TOTAL RAM_USED RAM_FREE SPACE_ROOT SPACE_ROOT_USED SPACE_ROOT_FREE; do
  echo -ne "$back1$font1$item$sdc"
  echo -ne "="
  echo -e "$back2$font2${!item}$sdc"
done

nameb1="column 1 background"
nameb2="column 2 background"
namef1="column 1 font color"
namef2="column 2 font color"
color=0

echo ""
for name in nameb1 namef1 nameb2 namef2; do
  echo -n "${!name} = "
  if [[ "$name" == "nameb1" ]]; then
    color=$column1_background
  elif [[ "$name" == "namef1" ]]; then
    color=$column1_font_color
  elif [[ "$name" == "nameb2" ]]; then
    color=$column2_background
  elif [[ "$name" == "namef2" ]]; then
    color=$column2_font_color
  fi

  if [[ def -eq 1 ]]; then
    echo -n "default"
  else 
    echo -n "$color" 
  fi

  echo -n " ("

  if [[ color -eq 1 ]]; then
    echo "white)"
  elif [[ color -eq 2 ]]; then
    echo "red)"
  elif [[ color -eq 3 ]]; then
    echo "green)"
  elif [[ color -eq 4 ]]; then
    echo "blue)"
  elif [[ color -eq 5 ]]; then
    echo "purple)"
  elif [[ color -eq 6 ]]; then 
    echo "black)"
  fi
done
