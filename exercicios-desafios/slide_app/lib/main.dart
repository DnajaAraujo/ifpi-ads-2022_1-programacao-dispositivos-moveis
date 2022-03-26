import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';


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
  
  void executeDB(int key, int status) async {
    // get path
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = documentsDirectory.path + "/demo.db";

    // open conection
    var database = await openDatabase(path, version: 1,
      onUpgrade: (Database db, int version, int info) async {

      },
      onCreate: (Database db, int version) async {
        await db.execute(
          "CREATE TABLE LikedImage(id integer primary key, like integer)"
        );
        for (int i = 1; i <= 5; i++) {
          await db.rawInsert(
            "insert into LikedImage(id, like) values(?, ?)",
            [i, 0]
          );
        }
      });

      await database.rawUpdate(
        "update LikedImage set like=? where id=?",
        [status, key]
      );
      
      var list = await database.query(
        "LikedImage",
        columns: ["id", "like"],
        where: "id>?",
        whereArgs: ["0"]
      );

      // debug
      for (int i = 0; i < 5; i++) 
        print(list[i]);

      await database.close();

  } // executeDB


  Future<int> getLikeDB(int key) async {
    // get path
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = documentsDirectory.path + "/demo.db";

    // open conection
    var database = await openDatabase(path, version: 1,
      onUpgrade: (Database db, int version, int info) async {}
    );

    var status = await database.query(
        "LikedImage",
        columns: ["like"],
        where: "id=?",
        whereArgs: ["$key"]
    );

    await database.close();

    return (status[0]["like"] as int);
    
  } // getLikeDB

  
  int imageKey = 1;
  int like = 0;
  Color colorLike = Colors.white;

  void previousImage() {
    setState(() {
      if (imageKey > 1) {
        executeDB(imageKey, like);
        imageKey --;
        }
    });
  }

  void nextImage() {
    setState(() {
      if (imageKey < 5) {
        executeDB(imageKey, like);
        imageKey += 1;
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
                  onPressed: () async {
                    previousImage(); 
                    like = await getLikeDB(imageKey);
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
                  onPressed: () async {
                    nextImage();
                    like = await getLikeDB(imageKey);
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


