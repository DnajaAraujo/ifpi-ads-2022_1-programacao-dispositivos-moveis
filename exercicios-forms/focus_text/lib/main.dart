import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Focus Text',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Focus Text'),
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
  late FocusNode focus1, focus2, focus3;

  @override
  void initState() {
    super.initState();
    focus1 = FocusNode();
    focus2 = FocusNode();
    focus3 = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    focus1.dispose();
    focus2.dispose();
    focus3.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        margin: const EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              autofocus: true,
              //keyboardType: TextInputType.text,
              focusNode: focus1,
              decoration: InputDecoration(
                label: Text("Text #1")
              ),
              onEditingComplete: () {
                focus2.requestFocus();
              },
            ),
            TextField(
              focusNode: focus2,
              decoration: InputDecoration(
                label: Text("Text #2")
              ),
              onEditingComplete: () {
                focus3.requestFocus();
              },
            ),
            TextField(
              focusNode: focus3,
              decoration: InputDecoration(
                label: Text("Text #3")
              ),
            ),
              
          ],
        ),
      ),
    );
  }
}
