check_path() {
  while [ ! -e $path ] || [[ ! $path =~ LOG.txt$ ]]; do
    read -rp "Enter path to log file: " path
  done
}

clean_by_log() {
  local path="aziz.fda"
  check_path
  local files=$(cat $path | grep '^/' | awk '{print $1}')
  for file in $files; do rm -rf $file; done
}

read_date() {
  year="a"
  month="a"
  day="a"
  hour="a"
  minut="a"
  while [[ ! $year =~ ^[[:digit:]]+$ ]] || [ $year -lt 1989 ] || [ $year -gt 2023 ] ; do
    read -p "Enter the year(1990-2023): " year
  done
  while [[ ! $month =~ ^[[:digit:]]+$ ]] || [ $month -lt 1 ] || [ $month -gt 12 ] ; do
    read -p "Enter the month(1-12): " month
  done
  while [[ ! $day =~ ^[[:digit:]]+$ ]] || [ $day -lt 1 ] || [ $day -gt 31 ] ; do
    read -p "Enter the day(1-31): " day
  done
  while [[ ! $hour =~ ^[[:digit:]]+$ ]] || [ $hour -lt 0 ] || [ $hour -gt 23 ] ; do
    read -p "Enter the hour(0-23): " hour
  done
  while [[ ! $minut =~ ^[[:digit:]]+$ ]] || [ $minut -lt 0 ] || [ $minut -gt 59 ] ; do
    read -p "Enter the munut(0-59): " minut
  done
}

check_dates() {
  local res=0
  local counter=0
  local arr1=($1)
  local arr2=($2)
  while [ $counter -ne 5 ] && [ $res -eq 0 ]; do
    res=$(( ${arr2[$counter]} - ${arr1[$counter]} ))
    counter=$(($counter + 1))
  done
  if [ $res -ne 0 ]; then
    if [ $res -gt 0 ]; then 
      res=0
    elif [ $res -lt 0 ]; then
      res=1
    fi
  fi
  if [ $res -ne 0 ]; then
    echo "The second date must be newer than the first"
    echo "$1"
    echo "$2"
  fi
  return $res
}

check_creation_time() {
  local files=$(cat $1 | grep '^/' | awk '{print $1}')
  local arr1=($2)
  local arr2=($3)
  for elem in $files; do
    local available=0 # 0-default 1-available 2-not available
    if [ ! -e $elem ]; then available=2; fi
    if [ $available -ne 2 ]; then 
      local prev=0 # 0-not equal, 1-equal to low lomit, 2-equal to high limit
      local counter=0
      local res=$(stat -c "%w" $elem | awk -F"-|:| " 'BEGIN{OFS=" "} {x1=$1+0;x2=$2+0;x3=$3+0;x4=$4+0;x5=$5+0;print x1,x2,x3,x4,x5}')
      local arr3=($res)
      while [ $available -eq 0 ] && [ $counter -ne 5 ]; do
        if [ $prev -eq 0 ]; then
          if [ ${arr3[$counter]} -gt ${arr1[$counter]} ] && [ ${arr3[$counter]} -lt ${arr2[$counter]} ]; then
            available=1
          elif [ ${arr3[$counter]} -eq ${arr1[$counter]} ]; then
            prev=1
          elif [ ${arr3[$counter]} -eq ${arr2[$counter]} ]; then
            prev=2
          else 
            available=2
          fi
        elif [ $prev -eq 1 ]; then
          if [ ${arr3[$counter]} -gt ${arr1[$counter]} ]; then
            available=1
          elif [ ${arr3[$counter]} -eq ${arr1[$counter]} ]; then
            available=2
          fi
        elif [ $prev -eq 2 ]; then
          if [ ${arr3[$counter]} -lt ${arr2[$counter]} ]; then
            available=1
          elif [ ${arr3[$counter]} -eq ${arr2[$counter]} ]; then
            available=2
          fi
        fi
        counter=$(($counter+1))
      done
      if [ $available -eq 1 ]; then rm -rf $elem; fi
    fi
  done
}

clean_by_time() {
  local path="asdf.z"
  check_path
  local wrong_date=1
  while [ $wrong_date -eq 1 ]; do
    echo "Enter the date which from you want to delete files"
    read_date 
    date_from="$year $month $day $hour $minut"

    echo "Enter the date which to you want to delete files"
    read_date
    date_to="$year $month $day $hour $minut"

    check_dates "$date_from" "$date_to"
    wrong_date=$?
  done
  check_creation_time $path "$date_from" "$date_to"
}

check_symbols() {
  while [ ! ${#symbols} -gt 0 ] || [ ! ${#symbols} -lt 8 ] || [[ ! $symbols =~ ^[[:alpha:]]+$ ]]; do
    read -rp "Enter symbols which should be found in the name of the file, only the first seven symbols will be read: " symbols
  done
}

check_year() {
  while [[ ! $year3 =~ ^[[:digit:]]?[[:digit:]]$ ]]; do
    read -rp "Enter two last digits of the year: " year3
  done
}

check_month() {
  while [[ ! $month3 =~ ^[[:digit:]]?[[:digit:]]$ ]]; do
    read -rp "Enter two last digits of the month: " month3
  done
}

check_day() {
  while [[ ! $day3 =~ ^[[:digit:]]?[[:digit:]]$ ]]; do
    read -rp "Enter two last digits of the day: " day3
  done
}

check_mask() {
  check_symbols
  check_year
  check_month
  check_day
}

clean_by_mask() {
  local path="asdf.z"
  local symbols=""
  local year3=""
  local month3=""
  local day3=""
  local mask=""
  check_path
  check_mask
  mask="^.*/[$symbols]+_$year3$month3$day3.*$"

  local files=$(cat $path | grep '^/' | awk '{print $1}')

  for elem in $files; do
    if [ -e $elem ]; then
      if [[ $elem =~ $mask ]]; then
        rm -rf $elem
      fi
    fi
  done 
}
