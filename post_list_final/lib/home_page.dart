import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'models/post.dart';
import 'package:posts_list_final/second.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
} 


class _HomePageState extends State<HomePage> {
  List<Post> _posts = [];
  late Future<List<Post>> _futurePosts;
  final int _page = 0;
  int _limit = 10;
  final ScrollController _controller = ScrollController();
  

  @override
  void initState() {
    super.initState();
    _futurePosts = fetchPosts();
    _controller.addListener(() {
      if (_controller.position.pixels >= _controller.position.maxScrollExtent) {
        setState(() {
          _limit += 2;
          _futurePosts = fetchPosts();
        });
      }
    });
  }


  @override
  void dispose() {
    _controller.removeListener(() {});
    _controller.dispose();
    super.dispose();
  }


  Future<List<Post>> fetchPosts() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts?_limit=$_limit&_page=$_page')
    );
    
    if (response.statusCode != 200) {
        throw Exception('Failed to load posts!');
    }
    List responseList = jsonDecode(response.body);

    return responseList.map((data) => Post.fromJson(data)).toList();
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text('Posts List'),
      ),
      body: Center(
        child: FutureBuilder(
            future: _futurePosts,
            builder: (BuildContext context, AsyncSnapshot snapshot) {

              if (snapshot.data == null) {
                return const CircularProgressIndicator();
              } 
              _posts = snapshot.data;

              return ListView.builder(
                controller: _controller,
                itemCount: _posts.length,
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
                      leading: Text('${_posts[index].id}'),
                      title: Text(
                        _posts[index].title,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      subtitle: Text('Created by User #${_posts[index].userId}'),
                      trailing: Icon(Icons.arrow_forward),
            
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          '/detailspage', 
                          arguments: _posts[index],
                        );
                      }
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