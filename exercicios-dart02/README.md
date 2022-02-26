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
class Pessoa {
  String? _nome;
  String? _sobrenome;
  
  Pessoa();
  
  Pessoa.constructor2(this._nome, this._sobrenome);
  
  String get nome {
    return this._nome!;
  }
  
  set nome(String nome) {
    this._nome = nome;
  }
  
  String get sobrenome {
    return this._sobrenome!;
  }
  
  set sobrenome(String sobrenome) {
    this._sobrenome = sobrenome;
  }
  
  String getNomeCompleto() {
    return this._nome! + " " + this._sobrenome!;
  }
}


class Funcionario extends Pessoa {
  int? _matricula;
  double? _salario;
  
  Funcionario(String nome, String sobrenome) : super.constructor2(nome, sobrenome);
  
  int get matricula {
    return this._matricula!;
  }
  
  set matricula(int matricula) {
    this._matricula = matricula;
  }
  
  double get salario {
    return this._salario!;
  }
  
  set salario(double salario) {
    if (salario > 0)
      this._salario = salario;
    else
      this._salario = 0;
  }
  
  double getSalarioPrimeiraParcela() {
    double primeiraParcela = this._salario! * (60/100);
    return primeiraParcela;
  }
  
  double getSalarioSegundaParcela() {
    double segundaParcela = this._salario! - getSalarioPrimeiraParcela();
    return segundaParcela;
  }
}


void main() {
  Pessoa p1 = Pessoa();
  p1.nome = "Dnajá";
  p1.sobrenome = "Araújo";
  print(p1.getNomeCompleto());
  
  Funcionario f1 = Funcionario("Dnajá", "Araújo");
  f1.matricula = 7;
  f1.salario = 1000;
  print(f1.getSalarioPrimeiraParcela());
  print(f1.getSalarioSegundaParcela());
  print(f1.getNomeCompleto());
}
~~~

- Link do vídeo: https://drive.google.com/file/d/1gMEeaKU0_quT6IHWxQ-bFsWlAzBk3IYS/view?usp=sharing
