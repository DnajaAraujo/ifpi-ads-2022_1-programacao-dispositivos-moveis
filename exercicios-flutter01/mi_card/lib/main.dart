import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/dnaja.jpg'),
              ),
              const Text(
                'Dnajá Araújo',
                style: TextStyle(
                    fontFamily: 'Ubuntu',
                    color: Colors.white,
                    fontSize: 40,
                ),
              ),
              Text(
                'DEVELOPER',
                style: TextStyle(
                    color: Colors.blueGrey.shade100,
                    fontFamily: 'Ubuntu',
                    fontSize: 20,
                    letterSpacing: 2.5,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20.0,
                width: 150.0,
                child: Divider(
                  color: Colors.blueGrey.shade100,
                ),
              ),
              buildCard('+55 86 99450 7406', Icons.phone),
              buildCard('dnaja.araujo09@gmail.com', Icons.email),
            ],
          ),
        ),
      ),
    ),
  );
}

Card buildCard(String text, IconData icon) {
  return Card(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.blueGrey,
        ),
        title: Text(
          text,
          style: const TextStyle(
            color: Colors.blueGrey,
            fontFamily: 'Ubuntu',
            fontSize: 20.0,
          ),
        ),
      ));
}
