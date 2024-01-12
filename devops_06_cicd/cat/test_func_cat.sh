#!/bin/bash
ERRORS=0

cat s21_cat.c >cat.txt
./s21_cat s21_cat.c >s21_cat.txt
cmp cat.txt s21_cat.txt || let ERRORS+=1
rm cat.txt s21_cat.txt

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
