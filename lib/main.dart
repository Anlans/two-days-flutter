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
      home: Page1(),
    );
  }
}

class Page1 extends StatelessWidget{
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('页面1')),
      body: Column(
        children: [
          Text('页面111'),
          FlatButton(
            color: Colors.blue,
            child: Text('跳转到页面222'),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return Page2();
              }));
            },
          ),
        ],
      ),
    );
  }
}
class Page2 extends StatelessWidget{
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('页面2')),
      body: Column(
        children: [
          Text('页面222'),
          FlatButton(
            color: Colors.blue,
            child: Text('回到1'),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}