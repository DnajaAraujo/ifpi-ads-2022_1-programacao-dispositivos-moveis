import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Album {
  final int userId;
  final int id;
  final String title;

  Album({required this.userId, required this.id, required this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}


void main() => runApp(const AlbumsList());


class AlbumsList extends StatelessWidget {
  const AlbumsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Albums List',
      theme: ThemeData(
        //primarySwatch: Colors.purple,
      ),
      home: const AlbumsListPage(),
    );
  }

}  // AlbumsList


class AlbumsListPage extends StatefulWidget {
  const AlbumsListPage({Key? key}) : super(key: key);

  @override
  State<AlbumsListPage> createState() => _AlbumsListPageState();

}  // AlbumsListPage


class _AlbumsListPageState extends State<AlbumsListPage> {
  List<Album> _albums = [];
  late Future<List<Album>> _futureAlbums;
  final int _page = 0;
  int _limit = 10;
  final ScrollController _controller = ScrollController();


  @override
  void initState() {
    super.initState();
    _futureAlbums = fetchAlbums();
    _controller.addListener(() {
      if (_controller.position.pixels >= _controller.position.maxScrollExtent) {
        setState(() {
          _limit += 2;
          _futureAlbums = fetchAlbums();
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


  Future<List<Album>> fetchAlbums() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/albums?_limit=$_limit&_page=$_page')
    );
    
    if (response.statusCode != 200) {
        throw Exception('Failed to load albums!');
    }
    List responseList = jsonDecode(response.body);

    return responseList.map((data) => Album.fromJson(data)).toList();
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 170),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 0, 120),
        centerTitle: true,
        title: const Text('Albums List'),
      ),
      body: Center(
        child: FutureBuilder(
            future: _futureAlbums,
            builder: (BuildContext context, AsyncSnapshot snapshot) {

              if (snapshot.data == null) {
                return const CircularProgressIndicator();
              } 
              _albums = snapshot.data;

              return ListView.builder(
                controller: _controller,
                itemCount: _albums.length,
                itemBuilder: (BuildContext context, int index) {
                  
                  return Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [Colors.pinkAccent, Colors.deepPurpleAccent,]),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5)
                      ),
                    ),

                    child: ListTile(
                      leading: Text('${_albums[index].id}'),
                      title: Text(
                        _albums[index].title,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      onTap: () {
                        Scaffold.of(context).showSnackBar(
                          SnackBar(content: Text('álbum "${_albums[index].title}" clicado!'))
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

}  // _AlbumsListPageState
