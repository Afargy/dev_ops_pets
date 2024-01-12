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

