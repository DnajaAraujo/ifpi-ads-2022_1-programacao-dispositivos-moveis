import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Number Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  int number = Random().nextInt(10) + 1;
  
  String status = '';
  String stringNumber = '?';
  
  var items = [
    1, 2, 3, 4, 5, 6, 7, 8, 9, 10
  ];
  int dropdownValue = 1;
  
  void compareNumbers() {
    setState(() {
      if (dropdownValue == number) {
        status = 'you are right!';
        stringNumber = '$number';
      } else if (dropdownValue > number) {
        status = 'smaller';
      } else {
        status = 'larger';
      } 
    });
  }

  void refresh() {
    setState(() {
      number = Random().nextInt(10) + 1;
      status = '';
      stringNumber = '?';
      dropdownValue = 1;
    });
  }


  @override
  Widget build(BuildContext context) {
    
    compareNumbers();

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 160),
      appBar: AppBar(
        title: const Text('Number Game'),
        backgroundColor: Color.fromARGB(255, 0, 0, 140),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Center(
                child: buildContainer(stringNumber, 65)
              )
            ),
            Expanded(
              child: Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  color: Colors.tealAccent,
                  borderRadius: BorderRadius.all(
                    Radius.circular(900),
                  )
                ),
                child: Center(
                  child: DropdownButton(
                    dropdownColor: Colors.tealAccent,
                    value: dropdownValue,
                    items: items.map((int items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text('$items'),
                      );
                    }).toList(),
                    onChanged: (int? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                  ),
                )
              )
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildContainer('status: $status', 30),
                  Container(
                    child: TextButton(
                      child: const Icon(
                        Icons.refresh,
                        size: 50,
                        color: Colors.tealAccent,
                      ),
                      onPressed: () {
                        refresh();
                      },
                    ),
                  )
                ],
              )
              
            ),
          ],
        ),
      ),
    );
  }
}


Container buildContainer(String text, double fontSize, [Color? color]) {
  return Container(
    color: color,
    child: Text(text, 
      style: TextStyle(
        fontSize: fontSize,
        color: Colors.tealAccent
      ),
    ),
  );
}
