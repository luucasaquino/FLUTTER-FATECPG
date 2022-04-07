void main() {
  
  // EX 7
  
  double peso = 60;
  double altura = 1.65;
  double ideal = peso/(altura*altura);
  
  if(ideal >= 18.5 && ideal <= 24.9)
    print("Peso ideal");
  else
    print("Peso não ideal");
  
}
