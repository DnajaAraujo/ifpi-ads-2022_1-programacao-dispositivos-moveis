import 'package:posts_list_final/details.dart';
import 'package:posts_list_final/second.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';


void main() => runApp(const PostsList());


class PostsList extends StatelessWidget {
  const PostsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Posts List',
      theme: ThemeData(
        //primarySwatch: Colors.purple,
      ),
      initialRoute: '/homepage',
      routes: {
        '/homepage': (_) => const HomePage(),
        '/detailspage': (_) => const DetailsPage(),
        '/secondpage': (_) => const SecondPage(),
      },
    );
  }

}  // PostList


