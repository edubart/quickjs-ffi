CC=gcc
CFLAGS+=-fno-strict-aliasing -fno-strict-overflow -fPIC
LDFLAGS=-lffi -ldl
SO_LDFLAGS=-shared

all: quickjs-ffi.so test-lib.so

test: quickjs-ffi.so test-lib.so
	qjs test.js

%.so: %.c
	$(CC) $< -o $@ $(CFLAGS) -shared $(LDFLAGS)

clean:
	rm -f *.so
