#!/bin/bash

echo "Total number of folders (including all nested ones) = $allDirs"
echo "TOP 5 folders of maximum size arranged in descending order (path and size):" 
echo "$biggestDirs"
echo "Total number of files = $allFiles"
echo "Number of:"
echo "Configuration files (with the .conf extension) = $confFiles"
echo "Text files = $textFiles"  
echo "Executable files = $exeFiles"
echo "Log files (with the extension .log) = $logFiles"
echo "Archive files = $arcFiles"  
echo "Symbolic links = $symLinks"  
echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
echo "$biggestFiles"
echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):"

aCounter=($topCounter)
aNames=($topNames)
aMemory=($topMemory)
aHash=($topHash)

for (( i = 0; i < 10; i++ )); do  
  if [[ -z "${aCounter[i]}" ]]; then
    break
  fi
  echo "$(($i + 1)) : ${aNames[$i]}, ${aMemory[$i]}, ${aHash[$i]}"
done
