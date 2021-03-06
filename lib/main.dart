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
        body: Home(),
      ),
    );
  }
}
class Home extends StatelessWidget {
  Widget build (BuildContext context) {

    // return FlatButton.icon(
    //   color: Colors.blue,
    //   icon: Icon(Icons.favorite, color: Colors.red,),
    //   label: Text('收藏', style: TextStyle(fontSize: 20, color: Colors.white),),
    //   onPressed: (){
    //   },
    // );


    return IconButton(
      icon: Icon(Icons.favorite, color: Colors.red,),
      onPressed: (){

      },
    );

  }
}