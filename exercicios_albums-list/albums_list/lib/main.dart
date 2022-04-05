import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Album {
  final int userId;
  final int id;
  final String title;

  Album(this.userId, this.id, this.title);
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

  Future<List<Album>> _getAlbums() async {
    final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
    final jsonResponse = jsonDecode(response.body);

    List<Album> albums = [];

    for (var i in jsonResponse) {
      Album album = Album(i["userId"], i["id"], i["title"]);
      albums.add(album);
    }
    print(albums.length);
    return albums;
    
  }  // _getAlbums


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
            future: _getAlbums(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {

              if (snapshot.data == null) {
                return const CircularProgressIndicator();
              }
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  
                  return Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 204, 255, 0),
                      gradient: LinearGradient(colors: [Colors.pink, Colors.deepPurpleAccent,]),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5)
                      ),
                    ),

                    child: ListTile(
                      leading: Text('${snapshot.data[index].id}'),
                      title: Text(
                        snapshot.data[index].title,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      onTap: () {
                        Scaffold.of(context).showSnackBar(
                          SnackBar(content: Text('álbum "${snapshot.data[index].title}" clicado!'))
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
