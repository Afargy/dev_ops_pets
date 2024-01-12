check_arguments_amount() {
  if [ $1 -ne 3 ]; then
    local var=""
    error=1
    if [ $1 -gt 3 ]; then
      var="many"
    else
      var="few"
    fi
    message="too "$var" arguments, expected 3 arguments"
  fi
  return $error
}

# $2 is the max length of $1
# $3 is the order number of the argument
check_name() {
  local length=${#1}
  if [ $length -gt $2 ]; then error=666; fi
  if [ $error -ne 666 ]; then 
    if [[ ! $1 =~ ^[[:alpha:]]+$ ]]; then error=667; fi
  fi
  if [ $error -gt 665 ]; then
    if [[ $message != "" ]]; then message+="\n"; fi
    local var=""
    if [ "$3" == "1" ]; then
      var="the 1st"
    elif [ "$3" == "21" ]; then
      var="the name part of the 2nd"
    elif [ "$3" == "22" ]; then
      var="the extention part of the 2nd"
    fi
    if [ $error -eq 666 ]; then
      message+="the length of $var argument must be less or equal 7"
    else 
      message+="$var argument consists only latin letters and not empty"
    fi
    error=2
  fi
}

check_file_name() {
  if [[ $1 =~ ^[[:alpha:]]+\.[[:alpha:]]+$ ]]; then
    local first=${1%.*}
    local second=${1#*.}
    check_name "$first" "7" "21"
    check_name "$second" "3" "22"
  else
    if [[ $message != "" ]]; then message+="\n"; fi
    message+="the 2nd argument must have name.ext format"
    error=2
  fi
}

check_size() {  
  if [[ ! $1 =~ ^[1-9][[:digit:]]?[[:digit:]]?Mb$ ]]; then
    if [[ $message != "" ]]; then message+="\n"; fi
    message+="the 3rd argument must end with extention Mb and musn't be greater than 100"
    error=2
  else
    local size=${1%Mb*}
    if [ $size -gt 100 ]; then
      if [[ $message != "" ]]; then message+="\n"; fi
      message+="the 3rd argument must be less than 101Mb"
    fi
  fi
}
