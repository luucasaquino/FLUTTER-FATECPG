void main() {
  
  // EX 10
  
  double vi = 2;
  double a = 2;
  double t = 5;
  
  double vf = vi+a*t;
  double km = vf*3.6;
  
  if(km <= 40)
  print ("Muito lento");
  else if(km <= 60)
    print ("Velocidade permitida");
  else if(km <= 80)
    print ("Velocidade de cruzeiro");
  else if(km <= 120)
    print ("Veículo rápido");
   else
    print ("Veículo muito rápido");

  
}
