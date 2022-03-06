// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hello World App'),
          backgroundColor: Color.fromARGB(255, 0, 0, 255),
          foregroundColor: Color.fromARGB(255, 255, 255, 255),
        ),
        body: const Center(
          child: Text('Hello World!!!', 
            style: TextStyle(
              fontSize: 32, 
              color: Color.fromARGB(255, 0, 0, 0)),
          ),
        ),
      ),
    );
  }
}