void main() {
  
  // EX 9
  
  double peso = 40;
  double altura = 1.65;
  String s = "M";
  double ideal = peso/(altura*altura);
  
  switch(s){
    case "M":
    if(ideal < 20)
      print("Abaixo do peso");
    else if (ideal < 25 )
      print("Peso ideal");
    else
      print("Acima do peso");
      break;
       case "F":
    if(ideal < 19)
      print("Abaixo do peso");
    else if (ideal < 24 )
      print("Peso ideal");
    else
      print("Acima do peso");
      break;
  }
  
}
