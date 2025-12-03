{
   st = $0
   while (length(st) > 15) {
       print(substr(st, 1, 15) );
       st = substr(st, 16)  
   }
   print(st);
}
