CC = gcc
FLAGS = -Wall -Werror -Wextra

all: s21_grep

s21_grep:
	$(CC) $(FLAGS) s21_grep.c -o s21_grep

test:
	./test_func_grep.sh

test_leaks:
	./test_leak_grep.sh

clean:
	rm -rf *.o | rm -rf *.a && rm -rf *.so | rm s21_grep

code_style:
	clang-format -style=Google -n *.c *.h

rebuild: clean all
