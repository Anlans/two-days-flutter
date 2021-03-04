import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'my first flutter',
      home: Scaffold(
        appBar: AppBar(title: Text('adf')),
        body: Text(
          'aaa',
          style: TextStyle(
            color: Colors.redAccent,
            fontSize: 50
          ),

        ),
      ),
    );
  }
}