import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Light On Off',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Light On Off'),
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
  bool _value = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: <Widget>[
              SizedBox(
                width: 240,
                child: Image.asset(
                  _value ? "images/lightOn.png" : "images/lightOff.png"
                )
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      const Text("Off/On"),
                      Transform.scale(
                        scale: 1.5,
                        child: Switch(
                          value: _value,
                            onChanged: (value) {
                              setState(() {
                                  _value = value;
                                }
                              );
                            }
                          ),
                        ),
                      ],
                    ),
                ]
              ),
            ],
          ),
        )
      )
    );
  }

}
