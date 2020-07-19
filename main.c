#include "libasm.h"
#include <stdio.h>
#include <fcntl.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#define RED "\x1b[31m"
#define GREEN "\x1b[32m"
#define CYAN "\x1b[36m"
#define RESET "\x1b[0m"

static void		strlen_test(char *s) {
	int yours = ft_strlen(s); int std = strlen(s);
	printf("Testing strlen(%s)\n", s);
	printf("yours = %d, std = %d\n", yours, std);
	if (yours != std)
		printf(RED"ERROR\n"RESET);
	else
		printF(GREEN"SUCCESS\n"RESET);
}

static void		strcpy_test(char *s) {
	char buf1[1024]; char buf2[1024];
	char *ret1 = ft_strcpy(buf1, s); char *ret2 = ft_strcpy(buf2, s);
	printf("buf1 = |%s| buf2 = |%s|\n");
	if (strcmp(buf1, buf2) != 0)
		printf(RED"ERROR\n"RESET);
	else
		printf(GREEN"SUCCESS\n"RESET);
}

int main()
{
	printf(CYAN"------------Testing strlen-----------\n"RESET);
	strlen_test("");
	strlen_test("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.);
	printf(CYAN"------------Testing strcpy-----------\n"RESET);
	strcpy_test("");
	strcpy_test("Lorem ipsum dolor sit amet, consectetur adipiscing elit");
}
