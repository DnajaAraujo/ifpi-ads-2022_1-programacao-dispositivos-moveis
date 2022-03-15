import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Row(                
            mainAxisAlignment: MainAxisAlignment.spaceBetween, 
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              buildContainer('', Colors.red, 100, 800),

              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center, 
                  children: <Widget>[
                    buildContainer('', Colors.yellow, 100, 100),
                    buildContainer('', Colors.lightGreenAccent, 100, 100),
                  ],
                ),
              ),
            
              buildContainer('', Colors.blue, 100, 800),
            ],
          ),
        ),
      ),
    );
  }

  Container buildContainer(String text, Color color, double width, double height) {
    return Container(
              width: width,
              height: height,
              color: color,
              child: Text(text),            
            );
  }
}
