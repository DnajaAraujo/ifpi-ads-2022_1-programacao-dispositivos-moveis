# Exercícios de Dart #01

#### Questão #01
~~~Dart
void main() {
  num n1,n2;
  n1 = 10.3;
  n2 = 1;
  
  // letra a
  num resto = n1 % n2;
  print("Resto da divisao de n1 por n2: $resto");
  
  // letra b
  num divisao_inteira = n1 ~/ n2;
  print("Divisao inteira de n1 por n2: $divisao_inteira");
  
  // letra c
  num potenciacao = potencia(n1, n2);
  print("n1 elevado a n2: $potenciacao");
  
  // letra d
  if (n1 is int) {
    print("n1 eh um numero inteiro!");
  }
  
  // letra e
  if (n1 is! int) {
    print("n1 nao eh um numero inteiro!");
  }
  
}


num potencia(num n1, num n2) {
  int cont = 0; 
  double resultado = 1;
  
  if (n2 >= 1) {
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
  
  salario += (salario * (7/100));
  print("Salario (1° ano): $salario");
  
  salario += (salario * (6/100));
  print("Salario (2° ano): $salario");
  
  salario += (salario * (5/100));
  print("Salario (3° ano): $salario");
  
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
~~~Dart

~~~

