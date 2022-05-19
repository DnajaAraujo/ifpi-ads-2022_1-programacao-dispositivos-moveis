import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Format Text',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Format Text'),
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
  List<bool> isSelected = List.generate(3, (index) => false);
  String text = '''
    The toggle buttons, by default, have a solid, 
    1 logical pixel border surrounding itself and separating each button.
    The toggle button borders
   ''';

  var boldForm = FontWeight.normal;
  var underlineForm = TextDecoration.none;
  var italicForm = FontStyle.normal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              text,
              style: TextStyle(
                fontWeight: boldForm, // bold
                decoration: underlineForm, // underline
                fontStyle: italicForm, // italic
              ),
            ),
            ToggleButtons(
              children: <Widget>[
                Icon(Icons.format_bold),
                Icon(Icons.format_underline),
                Icon(Icons.format_italic),
              ],
              onPressed: (int index) {
                setState(() {
                  isSelected[index] = !isSelected[index];

                  if (isSelected[index]) {
                    if (index == 0) boldForm = FontWeight.bold;
                    if (index == 1) underlineForm = TextDecoration.underline;
                    if (index == 2) italicForm = FontStyle.italic;
                  } else {
                    if (index == 0) boldForm = FontWeight.normal;
                    if (index == 1) underlineForm = TextDecoration.none;
                    if (index == 2) italicForm = FontStyle.normal;
                  }
                });
              },
              isSelected: isSelected,
            ),
          ],
        ),
      ),
    );
  }
}
