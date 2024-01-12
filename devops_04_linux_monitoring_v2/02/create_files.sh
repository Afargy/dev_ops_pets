# $1 is a path where to create the file
# $2 is a letters for the name and extention "asdf.asd"
# $3 is a file size
create_file() {
  local file_name=${2%.*}
  local file_extention=.${2#*.}
  local file_counter=$(($RANDOM % 100))
  local file_max=$file_counter
  local date=_$(date +'%d%m%y')
  local sdate=$(date +'%d %B %Y')
  local ssize=$((${3%M*}))Mb
  if [ $folders_amount -eq 1 ]; then $file_counter=99999999; fi
  while [ $file_counter -ne 0 ]; do
    while [ ${#file_name} -lt 4 ]; do file_name=${file_name:0:1}$file_name; done
    if [ $file_counter -ne $file_max ]; then file_name=${file_name:0:1}$file_name; fi
    local full_name=$1/$file_name$date$file_extention
    if [ ! -e $full_name ]; then
      local check_disk=$(df -m | grep "\s/$" | awk '{split($4 / 1000, arr, "."); print arr[1]}')
      if [ $check_disk -gt 0 ]; then
        fallocate -l $3 $full_name
        echo $file_name
        echo -e "$full_name   $sdate   $ssize   ---   file" >> LOG.txt
      else 
        echo "ERROR: less than 1GB left"
        error=3
        echo "code: $error"
        exit $error
      fi
    fi
    file_counter=$(($file_counter - 1))
  done
}

# $1 is a path where to create new folder
# $2 is letters availible for name
# $3 is letters which will be used to name files and their extention
# $4 is a file size
create_folder() {
  touch LOG.txt
  echo "Welcome to LOG.txt file" > ./LOG.txt
  local folder_path=$temp_path
  local folder_counter=100
  local folder_name=$2
  local date=_$(date +'%d%m%y')
  local sdate=$(date +'%d %B %Y')
  local current_folder=""
  while [ $folder_counter -ne 0 ]; do
    while [ ${#folder_name} -lt 4 ]; do
      folder_name=${folder_name:0:1}$folder_name
    done
    if [ $folder_counter -ne 100 ]; then 
      folder_name=${folder_name:0:1}$folder_name
    fi
    local current_folder=$1/$folder_name$date
    if [ ! -e $current_folder ]; then
      mkdir $current_folder
      echo "===============" >> LOG.txt 
      echo "$current_folder   $sdate" >> LOG.txt
    fi
    create_file $current_folder $3 $4 
    folder_counter=$(($folder_counter - 1))
  done
}

choose_path() {
  # local cur_dir="/home/babaka/wspace/DO4_LinuxMonitoring_v2.0-1/src/02/test"
  local cur_dir="/home"
  local choosed_dir="/"
  local folders_amount=1
  local rand=1

  while [ $rand -ne 0 ]; do
    folders_amount=$((`ls -l $cur_dir | grep -v bin | grep ^d | wc -l`))
    if [ $folders_amount -ne 0 ]; then
      rand=$(($RANDOM % $folders_amount))
      rand=$(($rand + 1))
      choosed_dir=`ls -l $cur_dir | grep -v bin | grep ^d | head -$rand | tail -1 | awk '{print $9}'` 
      cur_dir=$cur_dir/$choosed_dir
    else 
      rand=0
    fi
  done

  if [ ! -w $cur_dir ]; then
    echo "Error: run this script as root user"
    exit 4
  fi

  create_folder $cur_dir $1 $2 $3

}
