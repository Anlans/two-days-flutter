import 'dart:math';

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
      body: Container(
        // color: Colors.red,
        margin: EdgeInsets.all(20),
        width: 30,
        height: 30,
        child: ArcProgress(),
      ),
    );
  }
}

class ArcProgress extends StatelessWidget{
  final double percent;
  final double width;
  final Color color;
  final Color bgColor;

  ArcProgress({
    this.percent=0.35,
    this.width=3.0,
    this.color=Colors.red,
    this.bgColor=Colors.grey,
  }):super();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(//这才算是一个组件，才可以使用
      painter: _ArcPainter(
        percent: percent,
        width: width,
        bgColor: bgColor,
        color: color,
      ),
    );

  }

}


class _ArcPainter extends CustomPainter{//属于绘图的命令
  final double percent;
  final double width;
  final Color color;
  final Color bgColor;

  _ArcPainter({
    this.percent=0.0,
    this.width=1.0,
    this.color=Colors.black,
    this.bgColor=Colors.grey,
  }):super();

  @override
  void paint(Canvas canvas, Size size) {
    //首先确定绘图区域 Rect
    final rect=Rect.fromLTWH(width/2, width/2, size.width-width, size.height-width);

    //背景
    if(bgColor!=null){

      final path=Path();//声明一下path对象
      path.arcTo(rect, -90*pi/180, 359.999*pi/180, true);

      //paint
      final paint=Paint();
      paint.style=PaintingStyle.stroke;
      paint.strokeWidth=width;
      paint.color=bgColor;

      canvas.drawPath(path, paint);

    }


    //前景
    //path
    final path=Path();//声明一下path对象
    path.arcTo(rect, -90*pi/180, percent*359.9999*pi/180, true);

    //paint
    final paint=Paint();
    paint.style=PaintingStyle.stroke;
    paint.strokeWidth=width;
    paint.color=color;
    paint.strokeCap=StrokeCap.round;//两端圆头
    paint.strokeCap=StrokeCap.butt;



    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_ArcPainter oldDelegate) {
    return oldDelegate.percent!=percent;
  }

}