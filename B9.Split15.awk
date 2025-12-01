{
   st = $0
   len = length(st)
   while (length(st) > 40) {
       print(substr(st, 1, 40) "\\");
       st = substr(st, 41)  
   }
   print(st);
}
