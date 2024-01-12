#!/bin/bash

currentDir="$1"
allDirs=$(find $currentDir -type d | wc -l)
biggestDirs=$(du -h $currentDir | sort -rh | head -5 | cat -n | awk '{print $1 " - " $3 ", " $2}')
allFiles=$(find $currentDir -type f -exec ls -l {} \; | wc -l)
confFiles=$(find $currentDir -type f -exec ls -l {} \; | grep ".conf$" | wc -l)
textFiles=$(find $currentDir -type f -exec ls -l {} \; | grep ".txt$" | wc -l)
exeFiles=$(find $currentDir -type f -perm /a=x | wc -l)
logFiles=$(find $currentDir -type f -exec ls -l {} \; | grep ".log$" | wc -l)
arcFiles=$(find $currentDir -type f -name "*.zip" -o -name "*.7z" -o -name "*.rar" -o -name "*.tar" | wc -l)
symLinks=$(ls -la $currentDir | grep "^l" | wc -l)
biggestFiles=$(find $currentDir -type f -exec du -h {} \; | sort -rh | head -10 | cat -n | awk '{print $1 " - " $3 ", " $2}')
biggestExe=$(find $currentDir -type f -perm /a=x -exec du -h {} \; | sort -rh | head -10 | cat -n | awk '{print $1 " - " $3 ", " $2}')
topCounter=$(find $currentDir -type f -perm /a=x -exec du -h {} \; | sort -rh | head -10 | cat -n | awk '{print $1}')
topNames=$(find $currentDir -type f -perm /a=x -exec du -h {} \; | sort -rh | head -10 | cat -n | awk '{print $3}')
topMemory=$(find $currentDir -type f -perm /a=x -exec du -h {} \; | sort -rh | head -10 | cat -n | awk '{print $2}')
topHash=$(find $currentDir -type f -exec md5sum {} \; | sort -rh | head -10 | awk '{print $1}')
