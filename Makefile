COPTS = -Wall -Wextra -Werror --std=c99

# build executable when user executes "make"
all: google-authenticator

base32.o: base32.c
	$(CC) $(CFLAGS) $(CCOPTS) -c base32.c
hmac.o: hmac.c
	$(CC) $(CFLAGS) $(CCOPTS) -c hmac.c
sha1.o: sha1.c
	$(CC) $(CFLAGS) $(CCOPTS) -c sha1.c

google-authenticator: google-authenticator.o base32.o hmac.o sha1.o 
	$(CC) $(LDFLAGS) google-authenticator.o base32.o hmac.o sha1.o -o google-authenticator

google-authenticator.o: google-authenticator.c 
	$(CC) $(CFLAGS) $(CCOPTS) -c google-authenticator.c

