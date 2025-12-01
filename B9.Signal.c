#include<stdio.h>
#include<signal.h>
void sig_handler(int signo)
{
   printf("Signal caught is %d\t",signo);
}


int main(void)
{
   (void) signal(SIGINT,sig_handler);
   while(1)
   {
       printf("Hello world\n");
       sleep(1);
   }
   return 0;
}
