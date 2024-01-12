check_arguments_amount() {
  if [ $1 -ne 6 ]; then
    local var=""
    error=1
    if [ $1 -gt 6 ]; then
      var="many"
    else
      var="few"
    fi
    message="too "$var" arguments, expected 6 arguments"
  fi
  return $error
}

check_path() {
  if [[ ! $1 =~ ^[/] ]]; then
    message="$1 isn't an absolute path"
  elif [ ! -e $1 ]; then
    message="$1 doesn't exist"
  elif [ ! -d $1 ]; then
    message="$1 isn't a directory"
  elif [ ! -w $1 ]; then
    message="you have no rights to write into $1"
  fi
  if [[ $message != "" ]]; then error=2; fi
  return $error
}

# $2 is an order number of the argument
check_is_number() {
  if [[ ! $1 =~ ^[1-9][[:digit:]]*$ ]]; then error=666; fi
  if [[ $error -eq 666 ]]; then 
    error=2
    if [[ $message != "" ]]; then message+="\n"; fi
    local var=""
    if [ "$2" == "2" ]; then 
      var="$2 \bnd"; 
    elif [ "$2" == "4" ]; then 
      var="$2 \bth";
    fi
    message+="the $var argument must be a number"
  fi
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
    if [ "$3" == "3" ]; then
      var="the 4rd"
    elif [ "$3" == "51" ]; then
      var="the name part of the 5th"
    elif [ "$3" == "52" ]; then
      var="the extention part of the 5th"
    fi
    if [ $error -eq 666 ]; then
      message+="the length of the $var argument must be less or equal 7"
    else 
      message+="the $var argument consists only latin letters and not empty"
    fi
    error=2
  fi
}

check_file_name() {
  if [[ $1 =~ ^[[:alpha:]]+\.[[:alpha:]]+$ ]]; then
    local first=${1%.*}
    local second=${1#*.}
    check_name "$first" "7" "51"
    check_name "$second" "3" "52"
  else
    if [[ $message != "" ]]; then message+="\n"; fi
    message+="the 5th argument must have name.ext format"
    error=2
  fi
}

check_size() {  
  if [[ ! $1 =~ ^[1-9][[:digit:]]?[[:digit:]]?kb$ ]]; then
    if [[ $message != "" ]]; then message+="\n"; fi
    message+="the 6th argument must end with extention kb and musn't be greater than 100"
    error=2
  else
    local size=${1%kb*}
    if [ $size -gt 100 ]; then
      if [[ $message != "" ]]; then message+="\n"; fi
      message+="the 6th argument must be less than 101kb"
    fi
  fi
}
