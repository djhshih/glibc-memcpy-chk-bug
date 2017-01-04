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
	gcc -o $@ memcpy.c

memcpy-fort:
	gcc -O2 -D_FORTIFY_SOURCE=2 -o $@ memcpy.c

memcpy-nofort:
	gcc -D_FORTIFY_SOURCE=0 -fno-stack-protector -o $@ memcpy.c

memcpy-static:
	gcc -static -o $@ memcpy.c

memcpy-static-fort:
	gcc -O2 -static -D_FORTIFY_SOURCE=2 -o $@ memcpy.c

memcpy-static-nofort:
	gcc -static -D_FORTIFY_SOURCE=0 -fno-stack-protector -o $@ memcpy.c

clean:
	rm -f memcpy memcpy-fort memcpy-nofort memcpy-static memcpy-static-fort memcpy-static-nofort
