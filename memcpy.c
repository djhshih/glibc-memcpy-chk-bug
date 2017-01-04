#include <stdio.h>
#include <string.h>

int main() {

	const size_t n = 100;
	char a[n];
	char b[n];

	printf("Type your message: ");
	if (scanf("%s", a) > 0) {

		// buffer size not known at compile time
		memcpy(b, a, strlen(a));

		// buffer size known at compile time
		//memcpy(b, a, n);
		//strcpy(b, a);

		printf("You typed: '%s'\n", b);

	} else {

		printf("Invalid message.\n");

	}

	return 0;
}
