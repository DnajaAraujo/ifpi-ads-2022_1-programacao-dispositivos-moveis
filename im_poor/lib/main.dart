import 'package:flutter/material.dart';

void main() {
  runApp(const ImPoor());
}


class ImPoor extends StatelessWidget {
  const ImPoor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text(
            "I'm poor",
            style: TextStyle(
              fontFamily: 'RobotoSlab',
              fontSize: 25,
            ),
          ),
          backgroundColor: Colors.grey[900],
        ),
        body: const Center(
          child: Image(
            image: 
              AssetImage('assets/images/fly-money.webp'),
          ),
        ),
      )
    );
  }
}