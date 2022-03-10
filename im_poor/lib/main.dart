import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: const Color.fromARGB(255, 8, 143, 143),
      appBar: AppBar(
        title: const Text("I'm poor",
          style: TextStyle(
            fontFamily: 'RobotoSlab',
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green[900],
      ),
      body: const Center(
        child: Image(
          image: 
            AssetImage('assets/images/coal.png'),
        ),
      ),
    )
  )
);
}