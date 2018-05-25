#include <stdlib.h>
#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
int main()
{
	int i = 5;
	if (i < 0)
		exit(0);
	char *a = "#include <stdlib.h>%c#include <stdio.h>%c#include <sys/types.h>%c#include <sys/stat.h>%c#include <fcntl.h>%c#include <unistd.h>%cint main()%c{%c%cint i = %d;%c	if (i < 0)%c%c%cexit(0);%c%cchar *a = %c%s%c;%c%c";
	char *b = "char *b = %c%s%c;%c%cint fd = open(%c./Sully_%d.c%c, O_CREAT | O_WRONLY, S_IRUSR | S_IXUSR);%c%cdprintf(fd, a, 10, 10, 10, 10, 10, 10, 10, 10, 9, i - 1, 10, 10, 9, 9, 10, 9, 34, a, 34, 10, 9);%c%cdprintf(fd, b, 34, b, 34, 10, 9, 34, i - 1, 34, 10, 9, 10, 9, 10, 9, 10);%c%c";
	int fd = open("./Sully_5.c", O_CREAT | O_WRONLY, S_IRUSR | S_IXUSR);
	dprintf(fd, a, 10, 10, 10, 10, 10, 10, 10, 10, 9, i - 1, 10, 10, 9, 9, 10, 9, 34, a, 34, 10, 9);
	dprintf(fd, b, 34, b, 34, 10, 9, 34, i - 1, 34, 10, 9, 10, 9, 10, 9, 10);
	char *c = "char *c = %c%s%c;%c%cdprintf(fd, c, 34, c, 34, 10, 9, 10, 9, 10, 9, 34, i -1, i -1, 34, 10, 9, 34, i -1, 34, 10);%c%cclose(fd);%c%csystem(%c/usr/bin/clang ./Sully_%d.c -o Sully_%d%c);%c%csystem(%c./Sully_%d%c);%c}";
	dprintf(fd, c, 34, c, 34, 10, 9, 10, 9, 10, 9, 34, i -1, i -1, 34, 10, 9, 34, i -1, 34, 10);
	close(fd);
	system("/usr/bin/clang ./Sully_5.c -o Sully_5");
	system("./Sully_5");
	//ajout close(fd);
}