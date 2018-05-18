#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

#define x "#include <stdio.h>%c#include <sys/types.h>%c#include <sys/stat.h>%c#include <fcntl.h>%c%c#define x %c%s%c%c%c"

#define y "#define y %c%s%c%c%c#define z() int main()%c%c/*%c%cuseless%c*/%c%cz(){%c%cint fd = open(%c./Grace_kid.c%c, O_WRONLY | O_CREAT);%c%cdprintf(fd, x, 10, 10, 10, 10, 10, 34, x, 34, 10, 10);%c%cdprintf(fd, y, 34, y, 34, 10, 10, 10, 10, 10, 9, 10, 10, 10, 10, 9, 34, 34, 10, 9, 10, 9, 10);%c}"

#define z() int main()

/*
	useless
*/

z(){
	int fd = open("./Grace_kid.c", O_WRONLY | O_CREAT);
	dprintf(fd, x, 10, 10, 10, 10, 10, 34, x, 34, 10, 10);
	dprintf(fd, y, 34, y, 34, 10, 10, 10, 10, 10, 9, 10, 10, 10, 10, 9, 34, 34, 10, 9, 10, 9, 10);
}