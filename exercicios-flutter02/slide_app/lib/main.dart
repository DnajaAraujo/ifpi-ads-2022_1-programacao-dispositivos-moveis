import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
      backgroundColor: Colors.blue,
        appBar: AppBar(
          title: const Text('Slide App'),
          backgroundColor: Colors.lightBlue,
        ),
        body: SlidePage(),
      ),
    )
  );
}


class SlidePage extends StatefulWidget {
  @override
  State<SlidePage> createState() => _SlidePageState();
}


class _SlidePageState extends State<SlidePage> {
  int imageKey = 1;

  void previousImage() {
    setState(() {
      if (imageKey > 1) imageKey --;
    });
  }

  void nextImage() {
    setState(() {
      if (imageKey < 5) imageKey ++;
    });
  }


  @override 
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Image.asset('images/img$imageKey.jpg'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                child: buildContainer('<', Colors.redAccent, 100, 100),
                onPressed: () {
                  previousImage(); 
                }
              ),
              TextButton(
                child: buildContainer('>', Colors.redAccent, 100, 100),
                onPressed: () {
                  nextImage(); 
                }
              ),
            ],
          )
        ]
      ),
    );
  }
}


Container buildContainer(String text, Color color, double width, double height) {
  return Container(
      width: width,
      height: height,
      color: color,
      child: Center(
        child: Text(text, 
          style: const TextStyle(
            color: Colors.white,
            fontSize: 80
          ),
        ),
      )
    );
}


