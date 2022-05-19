import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zoom Slider',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Zoom Slider'),
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
  var _value = 0;
  var _width = 100;
  var _height = 100;

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
            Expanded(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.green,
                margin: EdgeInsets.all(5),
                child: Image.network(
                  'https://images.unsplash.com/photo-1547721064-da6cfb341d50',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Slider(
              value: _value.toDouble(),
              onChanged: (value) {
                setState(() {
                  _value = value.toInt();
                  _width = value.toInt();
                  _height = value.toInt();
                });
              },
              min: 0,
              max: 100,
            )
          ],
        ),
      ),
    );
  }
}
