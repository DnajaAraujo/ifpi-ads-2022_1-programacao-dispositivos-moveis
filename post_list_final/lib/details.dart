import 'dart:convert';
//import 'dart:html';
import 'dart:io';
import 'package:posts_list_final/db/db_helper.dart';
import 'package:posts_list_final/models/post.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'models/comment.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';


class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);
  
  @override
  State<DetailsPage> createState() => _DetailsPageState();
} 


class _DetailsPageState extends State<DetailsPage> {

  final dbHelper = DatabaseHelper.instance;

  // Changes ...
  Color colorLike = Colors.black;
  int like = 0;

  void changeLike() {
      setState(() {
        if (like == 0) {
          like = 1;
          colorLike = Colors.red;
        } 
        else {
          like = 0;
          colorLike = Colors.black;
        }
      });
    }
  
  void changeColor(int like) {
    setState(() {
      if (like != 1) colorLike = Colors.black;
      else colorLike = Colors.red;
    });
  }
  
  int initVar = 0;
  @override
  Widget build(BuildContext context) {

    Post args = ModalRoute.of(context)!.settings.arguments as Post;
    
    void initialConfigs() async {
      int rowCount = await _queryRowCount();
      
      if (rowCount == 0) {
        _insert();
        _queryAllRows();
      }
      like = await _queryLikeById(args.id);
      changeColor(like);
      initVar = 1;
    }

    if (initVar == 0) {
      initialConfigs();
    }
    

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(args.title),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.lightBlueAccent,
        ),

        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              args.title,
              style: const TextStyle(
                color: Colors.black,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 24),
            Text(
              args.body,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 24),
            Text(
              'Created by User #${args.userId}',
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton( 
                  icon: Icon(Icons.favorite),
                  color: colorLike,
                  onPressed: () {
                    changeLike();
                    _update(args.id, like);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.messenger_sharp),
                  color: Colors.black,
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      '/secondpage',
                      arguments: args,
                    );
                  }
                )
              ],
            )
          ]
        ),
      ) 
    );
  }


  void _insert() async {
    for (int i = 1; i <= 100; i++) {
      await dbHelper.insert(i, 0);
    }
  }

  void _update(int id, int like) async {
    await dbHelper.update(id, like);
  }

  Future<int> _queryRowCount() async {
    int rowCount = await dbHelper.queryRowCount() as int;
    return rowCount;
  }

  void _queryAllRows() async {
    final allRows = await dbHelper.queryAllRows();
    print('query all rows:');
    allRows.forEach((row) => print(row));
  }

  Future<int> _queryLikeById(int id) async {
    int statusLike = await dbHelper.queryLikeById(id) as int;
    return statusLike;
  }
  
  void _delete() async {
    await dbHelper.delete();
  }

} 