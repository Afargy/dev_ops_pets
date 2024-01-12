# $1 is a path where to create the file
# $2 is an amount of requires files
# $3 is a letters for the name and extention "asdf.asd"
# $6 is a file size
create_file() {
  local file_name=${3%.*}
  local file_extention=.${3#*.}
  local file_counter=$2
  local date=_$(date +'%d%m%y')
  local sdate=$(date +'%d %B %Y')
  local file_size=$((${4%k*} * 1000))
  local ssize=$((${4%k*}))kb
  while [ $file_counter -ne 0 ]; do
    while [ ${#file_name} -lt 4 ]; do
      file_name=${file_name:0:1}$file_name
    done
    if [ $file_counter -ne $2 ]; then
      file_name=${file_name:0:1}$file_name
    fi
    local full_name=$1/$file_name$date$file_extention
    if [ ! -e $full_name ]; then
      local check_disk=$(df -m | grep "\s/$" | awk '{split($4 / 1000, arr, "."); print arr[1]}')
      if [ $check_disk -gt 0 ]; then
        fallocate -l $file_size $full_name
        echo -e "$full_name   $sdate   $ssize   ---   file" >> LOG.txt
      else 
        echo "ERROR: less than 1GB left"
        exit 3
      fi
    fi
    file_counter=$(($file_counter - 1))
  done
}

# $1 is a path where to create new folder
# $2 is a whole amount of folders
# $3 is letters availible for name
# $4 is an amount of files inside the each folder 
# $5 is letters which will be used to name files and their extention
# $6 is a file size
create_folder() {
  touch LOG.txt
  echo "Welcome to LOG.txt file" > ./LOG.txt
  local folder_path=$1
  local folder_counter=$2
  local folder_name=$3
  local date=_$(date +'%d%m%y')
  local sdate=$(date +'%d %B %Y')
  local current_folder=""
  while [ $folder_counter -ne 0 ]; do
    while [ ${#folder_name} -lt 4 ]; do
      folder_name=${folder_name:0:1}$folder_name
    done
    if [ $folder_counter -ne $2 ]; then 
      folder_name=${folder_name:0:1}$folder_name
    fi
    local current_folder=$1/$folder_name$date
    if [ ! -e $current_folder ]; then
      mkdir $current_folder
      echo "===============" >> LOG.txt 
      echo "$current_folder   $sdate" >> LOG.txt
    fi
    create_file $current_folder $4 $5 $6
    folder_counter=$(($folder_counter - 1))
  done
}
