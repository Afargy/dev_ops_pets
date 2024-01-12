CC = gcc
FLAGS = -Wall -Werror -Wextra

all: s21_cat

s21_cat:
	$(CC) $(FLAGS) s21_cat_modules.c s21_cat.c -o s21_cat

test:
	./test_func_cat.sh

test_leaks:
	./test_leak_cat.sh

clean:
	rm -rf *.o | rm -rf *.a && rm -rf *.so | rm s21_cat

code_style:
	clang-format -style=Google -n *.c *.h

rebuild: clean all
