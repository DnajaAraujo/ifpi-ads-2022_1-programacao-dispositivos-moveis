import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Visual Number'),
          backgroundColor: Colors.blueGrey,
        ),
        body: VisualNumberPage(),
      )
    )
  );
}


class VisualNumberPage extends StatefulWidget {
  @override
  State<VisualNumberPage> createState() => _VisualNumberPageState();
}


class _VisualNumberPageState extends State<VisualNumberPage> {
  int number = 0;

  void addOne() {
    setState(() {
      number += 1;
    });
  }

  void subtractOne() {
    setState(() {
      if (number > 0) number -= 1;
    });
  }
  
  @override 
  Widget build(BuildContext context) {
    return Column(
        children: [
          Expanded(
            child: Center(
              child: Text("$number", 
                  style: const TextStyle(
                    fontSize: 80,
                ),
              ),
            )
          ),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                child: buildContainer('-', Colors.redAccent),
                onPressed: () {
                  subtractOne(); 
                },
              ),
              TextButton(
                child: buildContainer('+', Colors.greenAccent),
                onPressed: () { 
                  addOne(); 
                },
              )
            ],
          )
          
        ],
    );
  }
}


Container buildContainer(String text, Color color) {
  return Container(
      width: 100,
      height: 100,
      color: color,
      child: Center(
        child: Text(text, 
          style: const TextStyle(
            fontSize: 80
          ),
        ),
      )
    );
}



