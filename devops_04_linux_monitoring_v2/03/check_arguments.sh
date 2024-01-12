check_arguments_amount() {
  if [ $1 -ne 1 ]; then
    local var=""
    error=1
    if [ $1 -gt 1 ]; then
      var="many"
    else
      var="few"
    fi
    message="too "$var" arguments, expected 1 arguments"
  fi
  return $error
}

check_argument() {
  if [[ ! $1 =~ ^[1-3]$ ]]; then
    message+="Argument must be digital from 1 to 3"
    error=2
  fi
}

choose_way() {
  case $1 in
    "1" ) way=1 ;;
    "2" ) way=2 ;;
    "3" ) way=3 ;;
  esac
}



