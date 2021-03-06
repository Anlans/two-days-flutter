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
      routes: {
        'home': (context)=>Page1(),
        'page2': (context)=>Page2(),
      },
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
              Navigator.pushNamed(context, 'page2', arguments: {
                'title': 'aaa',
                'aa': 12,
              });
            },
          ),
        ],
      ),
    );
  }
}


class Page2 extends StatelessWidget{

  Page2({key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    var args=ModalRoute.of(context).settings.arguments as Map;
    var title=args['title'];

    return Scaffold(
      appBar: AppBar(title: Text('页面2')),
      body: Column(
        children: [
          Text('页面222$title'),
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