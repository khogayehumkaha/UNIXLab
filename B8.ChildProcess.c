#include<stdio.h>
#include<unistd.h>
#include<stdlib.h>
#include<string.h>
int main()
{
   int pid,status;
   char comd[20];
   pid=fork();
   if( pid == 0 )
   {
       printf("Child process\n");
       while( strcmp(comd,"exit")!= 0 )
       {
           printf("[user@localhost~]$");
           gets(comd);
           system(comd);
       }
       exit(0);
   }
   else
   {
       wait(&status);
       printf("parent process\n");
   }
}
