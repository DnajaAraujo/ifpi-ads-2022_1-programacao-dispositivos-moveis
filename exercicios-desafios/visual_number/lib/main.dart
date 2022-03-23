import 'package:flutter/material.dart';
import 'dart:math';

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
  int number = Random().nextInt(100);

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
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextButton(
                    child: buildContainer('-', Colors.redAccent, 60),
                    onPressed: () {
                      subtractOne(); 
                    },
                  ),
                  TextButton(
                    child: buildContainer('Zerar', Colors.redAccent, 20),
                    onPressed: () {
                      setState(() {
                        number = 0;
                      });
                    },
                  ),
                  TextButton(
                    child: buildContainer('Refresh', Colors.blueAccent, 20),
                    onPressed: () {
                      setState(() {
                        number = Random().nextInt(99) + 1;
                      });
                    },
                  ),
                  TextButton(
                    child: buildContainer('+', Colors.greenAccent, 60),
                    onPressed: () { 
                      addOne(); 
                    },
                  )
                ],
              )
            )
          )
        ],
      );
  }
}


Container buildContainer(String text, Color color, double fontSize, [Color? fontColor]) {
  return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        )
      ),
      child: Center(
        child: Text(text, 
          style: TextStyle(
            fontSize: fontSize,
            color: fontColor ?? Colors.white,
          )
        ),
      )
    );
}



