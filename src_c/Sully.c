#include <stdlib.h>
#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
int main()
{
	int i = 5;
	if (i < 0){return(0);}
	char *name;
	if (asprintf(&name, "Sully_%d.c", i) == -1){return (-1);}
	char *a = "#include <stdlib.h>%c#include <stdio.h>%c#include <sys/types.h>%c#include <sys/stat.h>%c#include <fcntl.h>%c#include <unistd.h>%cint main()%c{%c%cint i = %d;%c	if (i < 0){return(0);}%c%cchar *name;%c%cif (asprintf(&name, %cSully_%%d.c%c, i) == -1){return (-1);}%c%cchar *a = %c%s%c;%c%c";
	char *b = "char *b = %c%s%c;%c%cint fd = open(name, O_CREAT | O_WRONLY, S_IRUSR | S_IXUSR);%c%cdprintf(fd, a, 10, 10, 10, 10, 10, 10, 10, 10, 9, i - 1, 10, 10, 9, 10, 9, 34, 34, 10, 9, 34, a, 34, 10, 9);%c%cdprintf(fd, b, 34, b, 34, 10, 9, 10, 9, 10, 9, 10, 9, 10);%c%c";
	int fd = open(name, O_CREAT | O_WRONLY, S_IRUSR | S_IXUSR);
	dprintf(fd, a, 10, 10, 10, 10, 10, 10, 10, 10, 9, i - 1, 10, 10, 9, 10, 9, 34, 34, 10, 9, 34, a, 34, 10, 9);
	dprintf(fd, b, 34, b, 34, 10, 9, 10, 9, 10, 9, 10, 9, 10);
	char *c = "char *c = %c%s%c;%c%cdprintf(fd, c, 34, c, 34, 10, 9, 10, 9, 10, 9, 10, 34, 34, 10);%c%cclose(fd);%c%cchar *cmd;%cif (asprintf(&cmd, %c/usr/bin/clang ./Sully_%%d.c -o Sully_%%d && ./Sully_%%d%c, i, i, i) == -1){return (-1);}%csystem(cmd);free(cmd);free(name);%c}";
	dprintf(fd, c, 34, c, 34, 10, 9, 10, 9, 10, 9, 10, 34, 34, 10);
	close(fd);
	char *cmd;
if (asprintf(&cmd, "/usr/bin/clang ./Sully_%d.c -o Sully_%d && ./Sully_%d", i, i, i) == -1){return (-1);}
system(cmd);free(cmd);free(name);
}