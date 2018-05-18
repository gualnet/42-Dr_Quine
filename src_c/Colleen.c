#include <stdio.h>
void func(){}
/*
	com 1
*/
int	main(){
/*
	com 2
*/
char *str1 = "#include <stdio.h>%cvoid func(){}%c/*%c	com 1%c*/%c";char *str2 = "int	main(){%c/*%c	com 2%c*/%cchar *str1 = %c%s%c;char *str2 = %c%s%c;printf(str1, 10, 10, 10, 10, 10);func();printf(str2, 10, 10, 10, 10, 34, str1, 34, 34, str2, 34);}";printf(str1, 10, 10, 10, 10, 10);func();printf(str2, 10, 10, 10, 10, 34, str1, 34, 34, str2, 34);}