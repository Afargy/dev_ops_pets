check_arguments_amount() {
  if [ $1 -ne 1 ]; then
    local var=""
    error=1
    if [ $1 -gt 1 ]; then
      var="many"
    else
      var="few"
    fi
    message="too "$var" arguments, expected 1 argument"
  fi
  return $error
}

check_is_number() {
  if [[ ! $1 =~ ^[1-4]$ ]]; then 
    error=2
    message+="the argument must be a number from 1 to 4"
  fi
}
