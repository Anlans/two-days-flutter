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
// class Home extends StatelessWidget {
//   Widget build (BuildContext context) {
//     return GridView.count(
//       crossAxisCount: 5,
//       padding: EdgeInsets.all(10),
//       crossAxisSpacing: 10,
//       mainAxisSpacing: 100,
//       children: ['aaa','bbb','ccc','ddd','eee','fff','ddd','eee','fff','ddd','eee','fff','ddd','eee','fff'].map((str)=>Container(
//           decoration: BoxDecoration(
//             border: Border.all(width: 1),
//           ),
//         child: Center(
//           child: Text(str),
//         ),
//       )).toList(),
//     );
//
//   }
//}

class Home extends StatelessWidget {
  Widget build (BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
        child: Table(
          border: TableBorder.all(),
          children: [
            TableRow(
              children: [
                Container(
                  height: 100,
                  child: Center(
                    child: Text('a'),
                  ),
                ),
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.green,
                  ),
                  child: Center(
                    child: Text('b'),
                  ),
                ),
                Center(
                  child: Text('b'),
                ),
                Center(
                  child: Text('d'),
                ),
              ],
            ),
            TableRow(
              children: [
                Center(
                  child: Text('a'),
                ),
                Center(
                  child: Text('b'),
                ),
                Center(
                  child: Text('b'),
                ),
                Center(
                  child: Text('d'),
                ),
              ],
            ),
          ],
        )
    );
  }
}