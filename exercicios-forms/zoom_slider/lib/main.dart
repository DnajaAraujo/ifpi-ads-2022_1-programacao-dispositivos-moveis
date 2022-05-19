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
  double _value = 1;
  late TransformationController transformationController;


  @override
  void initState() {
    transformationController = TransformationController();
    super.initState();
  }


  @override
  void dispose() {
    transformationController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 480,
              padding: const EdgeInsets.all(5),
              child: InteractiveViewer(
                child: Transform.scale(
                  scale: _value,
                  child: Image.asset("images/beach.png"),
                ),
              ),
            ),
            Slider(
              value: _value,
              min: 0.1,
              max: 5,
              onChanged: (value) {
                setState(() {
                  _value = value;
                  transformationController.value = Matrix4.identity();
                });
              },
              
            )
          ],
        ),
      ),
    );
  }
}
