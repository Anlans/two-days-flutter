import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'my first flutter',
      home: Page1(),
    );

  }
}

class Page1 extends StatelessWidget{
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('页面1')),
      body: Text('a'),
    );
  }

}