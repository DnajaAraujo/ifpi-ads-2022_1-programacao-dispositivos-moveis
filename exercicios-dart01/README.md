# Exercícios de Dart #01


#### Questão #01
~~~Dart
void main() {
  double n1,n2;
  n1 = 10;
  n2 = 3;
  
  // letra a
  double resto = n1 % n2;
  print("Resto da divisão de n1 por n2: $resto");
  
  // letra b
  int divisaoInteira = n1 ~/ n2;
  print("Divisão inteira de n1 por n2: $divisaoInteira");
  
  // letra c
  double potenciacao = potencia(n1, n2);
  print("n1 elevado a n2: $potenciacao");
  
  // letra d
  if (n1 is int) {
    print("n1 é um número inteiro!");
  }
  
  // letra e
  if (n1 is! int) {
    print("n1 não é um número inteiro!");
  }
}


double potencia(double n1, double n2) {
  int cont = 0; 
  double resultado = 1;
  
  if (n2 > 0) {
    while(cont < n2) {
      resultado *= n1;
      cont ++;
    }
  } else if (n2 < 0) {
      while(cont > n2) {
        resultado /= n1;
        cont --;
    }
  }
  
  return resultado;
}
~~~


#### Questão #02
~~~Dart
void main() {
  String dia, mes, ano;
  dia = '20';
  mes = '02';
  ano = '2022';
  
  print("$dia/$mes/$ano");
}
~~~


#### Questão #03
~~~Dart
void main() {
  print(r'O caractere de escape \t representa uma "tabulação"');
}
~~~


#### Questão #04
~~~Dart
void main() {
  double salario;
  salario = 1000;
  
  print(r"Salário com reajuste (em R$) a cada ano: ");
  
  salario += (salario * (7/100));
  print(r"1° ano: R$" + " $salario");
  
  salario += (salario * (6/100));
  print(r"2° ano: R$" + " $salario");
  
  salario += (salario * (5/100));
  print(r"3° ano: R$" + " $salario");
}
~~~


#### Questão #05
~~~Dart
void main() {
  var a = null;
  var b = 12;
  var res = a ?? b;
  
  print(res); // 12
}
~~~


#### Questão #06
~~~Dart
void main() {
  double nota1, nota2, nota3, media;
  nota1 = 10;
  nota2 = 7.5;
  nota3 = 7.25;
  media = (nota1 + nota2 + nota3) / 3;
  
  if (media >= 7) {
    print("aprovado");
  } else if (media < 4) {
      print("reprovado");
  } else {
      print("exame final");
  }
}
~~~


#### Questão #07
~~~Dart
void main() {
  int num = 10;
  String ponto = ".";
  
  for (int i = 1; i < num; i++) {
    print("$ponto$i");
    ponto += '.';
  }
}
~~~


#### Questão #08
~~~Dart
void main() {
  var numeros = [1, 2, 3, 4, 5, 6, 7];
  
  numeros.forEach((numero) => {
    print(numero * 2)
  });
}
~~~


#### Questão #09
- Link do vídeo: https://drive.google.com/file/d/1xFPs21EzmO4QY0l3yqdAD8S2uigiNXyC/view?usp=sharing

