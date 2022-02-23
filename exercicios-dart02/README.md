# Exercícios de Dart #02


#### Questão #01
~~~Dart
double somarTodosElementos(List list) {
  double soma = 0;
  
  for (int i = 0; i < list.length; i++) {
    soma += list[i];
  }
  
  return soma;
}


void main() {
  List l1 = [1,2,3,7,9];
  print(somarTodosElementos(l1));
}
~~~


#### Questão #02
~~~Dart
double multiplicarTodosElementos(List lista) {
  double produto = 1;
  
  for (int i = 0; i < lista.length; i++) {
    produto *= lista[i];
  }
  
  return produto;
}


void main() {
  List l1 = [1,2,3,4,2];
  print(multiplicarTodosElementos(l1));
}
~~~


#### Questão #03
~~~Dart
double executar(List lista, double Function(List) f) {
  return f(lista);
}


double somarTodosElementos(List lista) {
  double soma = 0;
  
  for (int i = 0; i < lista.length; i++) {
    soma += lista[i];
  }
  
  return soma;
}


double multiplicarTodosElementos(List lista) {
  double produto = 1;
  
  for (int i = 0; i < lista.length; i++) {
    produto *= lista[i];
  }
  
  return produto;
}


void main() {
  List l1 = [1,2,3,4,2];
  print(executar(l1, somarTodosElementos));
  print(executar(l1, multiplicarTodosElementos));
}
~~~


#### Questão #04
~~~Dart
// Tomei liberdade de criar minha própria função pow()

double pow(int n1, int n2) {
  double potencia = 1;
  int cont = 0;
  
  if (n2 > 0) {
    while(cont < n2) {
      potencia *= n1;
      cont ++;
    }
  } else if (n2 < 0) {
    while(cont > n2) {
       potencia /= n1;
       cont --;
    }
  }
  
  return potencia;
}


double calcularPotencia(int n1, int n2) {
  return pow(n1, n2);
}


var arrowCalcularPotencia = (int n1, int n2) => pow(n1, n2);


void main() {
  int n1, n2;
  n1 = 10;
  n2 = -2;
  
  print(calcularPotencia(n1, n2));
  print(arrowCalcularPotencia(n1, n2));
}
~~~


#### Questão #05
~~~Dart

~~~

- Link do vídeo: 