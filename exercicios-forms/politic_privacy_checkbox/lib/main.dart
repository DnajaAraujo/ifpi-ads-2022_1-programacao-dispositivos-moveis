import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Politic of Privacy Checkbox',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Politic of Privacy Checkbox'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _checkBox1 = false;
  bool _checkBox2 = false;
  bool _checkBox3 = false;
  bool? _checkBox4 = false;


  bool? checkIfAllIsCheck() {
    if (_checkBox1 && _checkBox2 && _checkBox3 == true) {
      return true;
    }
    return false; 
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(45),
              child: const Text(
                "Politic of Privacy Checkbox",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 45,
            ),
            CheckboxListTile(
              title: const Text(
                "Aceito compartilhar dados para melhoria do aplicativo"
              ),
              value: _checkBox1,
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (value) {
                setState(() {
                  _checkBox1 = value!;
                  _checkBox4 = checkIfAllIsCheck();
                },
                );
              }
            ),
            CheckboxListTile(
              title: const Text(
                "Aceito compartilhar dados do telefone"
              ),
              value: _checkBox2,
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (value) => {
                setState(() {
                  _checkBox2 = value!;
                  _checkBox4 = checkIfAllIsCheck();
                },
                )
              }
            ),
            CheckboxListTile(
              title: const Text(
                  "Aceito compartilhar dados para análise de segurança"
              ),
              value: _checkBox3,
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (value) => {
                setState(() {
                  _checkBox3 = value!;
                  _checkBox4 = checkIfAllIsCheck();
                },
                )
              }
            ),
            CheckboxListTile(
              title: const Text(
                "Aceito todos os itens"
              ),
              value: _checkBox4,
              tristate: true,
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (value) => {
                setState(() {
                  _checkBox4 = value;
                  _checkBox1 = value ?? false;
                  _checkBox2 = value ?? false;
                  _checkBox3 = value ?? false;
                },
                )
              }
            ),

          ],
        ),
      ),
    );
  }

}
