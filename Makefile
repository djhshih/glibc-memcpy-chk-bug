CC?=gcc

all: memcpy memcpy-fort memcpy-nofort memcpy-static memcpy-static-fort memcpy-static-nofort
	

check:
	# dynamic link
	nm memcpy | grep memcpy
	nm memcpy-fort | grep memcpy
	nm memcpy-nofort | grep memcpy
	# static link
	nm memcpy-static | grep memcpy
	nm memcpy-static-fort | grep memcpy	
	nm memcpy-static-nofort | grep memcpy

memcpy:
	$(CC) -o $@ memcpy.c

memcpy-fort:
	$(CC) -O2 -D_FORTIFY_SOURCE=2 -o $@ memcpy.c

memcpy-nofort:
	$(CC) -D_FORTIFY_SOURCE=0 -fno-stack-protector -o $@ memcpy.c

memcpy-static:
	$(CC) -static -o $@ memcpy.c

memcpy-static-fort:
	$(CC) -O2 -static -D_FORTIFY_SOURCE=2 -o $@ memcpy.c

memcpy-static-nofort:
	$(CC) -static -D_FORTIFY_SOURCE=0 -fno-stack-protector -o $@ memcpy.c

clean:
	rm -f memcpy memcpy-fort memcpy-nofort memcpy-static memcpy-static-fort memcpy-static-nofort
