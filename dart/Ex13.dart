void main() {
  int n1=0,n2=1,n3;
  String p = "";
  for(int i = 2 ;i <= 29; i++){
   n3 = n1+n2;
    p+= "$n3 ";
    n1 = n2;
    n2 = n3;
  }
  print ("0 1 $p");
}
