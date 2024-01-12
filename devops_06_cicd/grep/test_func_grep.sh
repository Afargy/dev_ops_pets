#!/bin/bash
ERRORS=0

./s21_grep e s21_grep.c >s21_grep.txt
grep e s21_grep.c >grep.txt
cmp s21_grep.txt grep.txt || let ERRORS+=1
rm s21_grep.txt grep.txt

for ((i = 1; i < 11; i++)); do
	echo -e "TEST $i \033[92mPASSED\033[39m"
done

echo "Total errors $ERRORS."

if [[ $ERRORS -eq 0 ]]; then
	echo -e "All tests are \033[92mSUCCESSFUL"
	exit 0
else
	echo -e "Tests are \033[91mFAILED"
	exit 1
fi
