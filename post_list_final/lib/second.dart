import 'dart:convert';
//import 'dart:html';
import 'package:posts_list_final/models/post.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'models/comment.dart';


class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);
  
  @override
  State<SecondPage> createState() => _SecondPageState();
} 


class _SecondPageState extends State<SecondPage> {
  List<Comment> _comments = [];
  late Future<List<Comment>> _futureComments;


  Future<List<Comment>> fetchComments(int i) async {

    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts/$i/comments')
    );
    
    if (response.statusCode != 200) {
        throw Exception('Failed to load comments!');
    }
    List responseList = jsonDecode(response.body);

    return responseList.map((data) => Comment.fromJson(data)).toList();
  }
  

  @override
  Widget build(BuildContext context) {
    
    Post args = ModalRoute.of(context)!.settings.arguments as Post;
    _futureComments = fetchComments(args.id);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text('Comments'),
      ),
      body: Center(
        child: FutureBuilder(
            future: _futureComments,
            builder: (BuildContext context, AsyncSnapshot snapshot) {

              if (snapshot.data == null) {
                return const CircularProgressIndicator();
              } 
              _comments = snapshot.data;

              return ListView.builder(
                itemCount: _comments.length,
                itemBuilder: (BuildContext context, int index) {
                  
                  return Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      color: Colors.lightBlueAccent,
                      borderRadius: BorderRadius.all(
                        Radius.circular(5)
                      ),
                    ),

                    child: ListTile(
                      leading: Text('${_comments[index].id}'),
                      title: Text(
                        _comments[index].name,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      subtitle: Text('${_comments[index].body}'),
                      trailing: Text('${_comments[index].email}')
                      )
                  );
                }
              );
            }
          ),
        )
      );
    }

} 