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
		printf(GREEN"SUCCESS\n"RESET);
}

static void		strcpy_test(char *s) {
	char buf1[1024] = {0}; char buf2[1024] = {0};
	char *ret1 = ft_strcpy(buf1, s); char *ret2 = ft_strcpy(buf2, s);
	printf("buf1 = |%s| buf2 = |%s|\n", buf1, buf2);
	if (strcmp(buf1, buf2) != 0)
		printf(RED"ERROR\n"RESET);
	else
		printf(GREEN"SUCCESS\n"RESET);
}

static void		strcmp_test(char *s1, char *s2) {
	int ret1 = ft_strcmp(s1, s2); int ret2 = strcmp(s1, s2);
	printf("s1 = |%s|, ret1 = %d, s2 = |%s|, ret2 = %d\n");
	if ((ret1 < 0 && ret2 < 0) || (!ret1 && !ret2 ) || (ret1 > 0 && ret2 > 0))
		printf(GREEN"SUCCESS"RESET);
	else
		printf(RED"ERROR\n"RESET);
}

int main()
{
	printf(CYAN"------------Testing strlen-----------\n"RESET);
	strlen_test("");
	strlen_test("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore\
 et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.");
	printf(CYAN"------------Testing strcpy-----------\n"RESET);
	strcpy_test("");
	strcpy_test("a");
	strcpy_test("Lorem ipsum dolor sit amet, consectetur adipiscing elit");

	printf(CYAN"------------Testing strcmp-----------\n"RESET);
	strcmp_test("", "");
	strcmp_test("", "hello_world");
	strcmp_test("wonderful world", "");
	strcmp_test("bonjour", "au revoir");
	strcmp_test("ces strings sont identiques", "ces strings sont identiques");
}
