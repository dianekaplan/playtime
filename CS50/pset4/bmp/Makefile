#
# Makefile
#
# Computer Science 50
# Problem Set 4
#

all: whodunit 

whodunit: whodunit.c bmp.h
	clang -ggdb3 -O0 -std=c11 -Wall -Werror -o whodunit whodunit.c -lcs50 -lm

# generate: generate.c
# 	clang -ggdb3 -O0 -std=c11 -Wall -Werror -o generate generate.c

clean:
	rm -f *.o a.out core whodunit