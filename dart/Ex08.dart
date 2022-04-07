void main() {
  int n1 = 8;
  int n2 = 8;
  int n3 = 8;
  
  if(n1+n2 > n3 && n1+n3 > n2 && n2+n3 > n1){
    if(n1 == n2 && n1 == n3){
      print("Triangulo Equilatero");
    }
    else if(n1 == n2 || n1 == n3 || n2 == n3){
      print ("Triangulo Isosceles");
    }
    else{
      print ("Triangulo Escaleno");
    }
  
  }
  else{
    print ("Não forma um triângulo");
  }
}
