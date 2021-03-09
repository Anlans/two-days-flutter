import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

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

class Page1 extends HookWidget{
  Widget build(BuildContext context) {
    var checked=useState(false);
    return Scaffold(
      appBar: AppBar(title: Text('页面1')),
      body: Checkbox(
        value: checked.value,
        tristate: true,
        onChanged: (val){
          checked.value=val;
        },
      ),
    );
  }

}