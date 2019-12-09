TESTDIR=tests
DISTDIR=dist
SRCDIR=src

CCFLAGS=-lm -Wall -Wpedantic -Winline -O3

all: string bitarray fileutils
	gcc $(DISTDIR)/stringlib.o $(TESTDIR)/stringlib_test.c $(CCFLAGS) -o ./$(DISTDIR)/strlib
	gcc $(TESTDIR)/timing_test.c $(CCFLAGS) -o ./$(DISTDIR)/timing
	gcc $(DISTDIR)/bitarray-lib.o $(TESTDIR)/bitarray_test.c $(CCFLAGS) -o ./$(DISTDIR)/bitarray
	gcc $(DISTDIR)/fileutils-lib.o $(TESTDIR)/fileutils_test.c $(CCFLAGS) -o ./$(DISTDIR)/fileutils

string:
	gcc -c $(SRCDIR)/stringlib.c -o $(DISTDIR)/stringlib.o $(CCFLAGS)

bitarray:
	gcc -c $(SRCDIR)/bitarray.c -o $(DISTDIR)/bitarray-lib.o $(CCFLAGS)

fileutils:
	gcc -c $(SRCDIR)/fileutils.c -o $(DISTDIR)/fileutils-lib.o $(CCFLAGS)

debug: CCFLAGS += -g
debug: all

clean:
	rm -rf ./$(DISTDIR)/*
