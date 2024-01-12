#!/bin/bash

wht="\033[37m"  #1
red="\033[31m"  #2
grn="\033[32m"  #3
blu="\033[34m"  #4
prp="\033[35m"  #5
blc="\033[30m"  #6
bwht="\033[107m" #1
bred="\033[41m" #2
bgrn="\033[42m" #3
bblu="\033[44m" #4
bprp="\033[45m" #5
bblc="\033[40m" #6
sdc="\033[0m"   #default color
font1=$wht
font2=$wht
back1=$bwht
back2=$bwht

if [[ $2 -eq 2 ]]; then
  font1=$red
elif [[ $2 -eq 3 ]]; then
  font1=$grn
elif [[ $2 -eq 4 ]]; then
  font1=$blu
elif [[ $2 -eq 5 ]]; then 
  font1=$prp
elif [[ $2 -eq 6 ]]; then 
  font1=$blc
fi

if [[ $1 -eq 2 ]]; then
  back1=$bred
elif [[ $1 -eq 3 ]]; then
  back1=$bgrn
elif [[ $1 -eq 4 ]]; then
  back1=$bblu
elif [[ $1 -eq 5 ]]; then 
  back1=$bprp
elif [[ $1 -eq 6 ]]; then 
  back1=$bblc
fi

if [[ $4 -eq 2 ]]; then
  font2=$red
elif [[ $4 -eq 3 ]]; then
  font2=$grn
elif [[ $4 -eq 4 ]]; then
  font2=$blu
elif [[ $4 -eq 5 ]]; then 
  font2=$prp
elif [[ $4 -eq 6 ]]; then 
  font2=$blc
fi

if [[ $3 -eq 2 ]]; then
  back2=$bred
elif [[ $3 -eq 3 ]]; then
  back2=$bgrn
elif [[ $3 -eq 4 ]]; then
  back2=$bblu
elif [[ $3 -eq 5 ]]; then 
  back2=$bprp
elif [[ $3 -eq 6 ]]; then 
  back2=$bblc
fi