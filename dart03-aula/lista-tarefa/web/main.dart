import 'dart:html';

InputElement? inputLista;
UListElement? listaTarefas;
ButtonElement? deletarTodas;

void main() {
  inputLista = querySelector('#lista-input') as InputElement?;
  listaTarefas = querySelector('#lista') as UListElement?;
  inputLista?.onChange.listen(adicionarTarefa);
  deletarTodas = querySelector('#deletar-todas') as ButtonElement?;
  deletarTodas?.onClick.listen((e) => listaTarefas?.children.clear());
}

void adicionarTarefa(Event e) {
  var novaTarefa = LIElement();
  novaTarefa.text = inputLista?.value;
  inputLista?.value = "";
  novaTarefa.onClick.listen((e) => novaTarefa.remove());
  listaTarefas?.children.add(novaTarefa);
}
