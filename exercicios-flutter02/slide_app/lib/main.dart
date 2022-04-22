import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 130),
        appBar: AppBar(
          title: const Text('Slide App'),
          backgroundColor: Color.fromARGB(255, 0, 0, 145),
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
  int like = 0;
  Color colorLike = Colors.white;
  late List likeList = createLikeList();

  // "Database"
  List createLikeList() {
    List list = [0,0,0,0,0];

    for (int i = 0; i < 5; i++) {
      list[i] = [i+1, 0];
    }
    return list;
  }

  void updateLikeList(int key, int status) {
    likeList[key-1] = [key, status];
  }
  
  int getLikeFromList(int key) {
    return likeList[key-1][1];
  }


  // Images update
  void previousImage() {
    setState(() {
      if (imageKey > 1) {
        updateLikeList(imageKey, like);
        imageKey --;
      }
    });
  }

  void nextImage() {
    setState(() {
      if (imageKey < 5) {
        updateLikeList(imageKey, like);
        imageKey ++;
      }
    });
  }

  void changeLike() {
    setState(() {
      if (like == 0) {
        like = 1;
        colorLike = Colors.redAccent;
      } 
      else {
        like = 0;
        colorLike = Colors.white;
      }
    });
  }

  void changeColor(int like) {
    setState(() {
      if (like != 1) colorLike = Colors.white;
      else colorLike = Colors.redAccent;
    });
  }


  @override 
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(10),
              child: Image.asset('images/img$imageKey.png'),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                  child: buildIcon(0, Colors.white, 40),
                  onPressed: () {
                    previousImage(); 
                    like = getLikeFromList(imageKey);
                    changeColor(like);
                  }
                ),
                TextButton(
                  child: buildIcon(2, colorLike, 40),
                  onPressed: () {
                    changeLike();
                  }
                ),
                TextButton(
                  child: buildIcon(1, Colors.white, 40),
                  onPressed: () {
                    nextImage();
                    like = getLikeFromList(imageKey);
                    changeColor(like); 
                  }
                ),
              ],
            ),
          )
        ]
      ),
    );
  }
}


Icon buildIcon(int index, Color color, double size) {
  List<IconData> icons = [
    Icons.arrow_back,
    Icons.arrow_forward,
    Icons.favorite,
  ];

  return Icon(
          icons[index],
          size: size,
          color: color,
      );
}


