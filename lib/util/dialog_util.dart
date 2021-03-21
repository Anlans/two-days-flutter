import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void alert(
    BuildContext context,
    {
      String title = '警告',
      String msg='错误',
      String okText='确定',
    }

){
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Center(
        child: Text(title),
      ),
      content: Text('请检查网络连接，并重试'),
      actions: [
        FlatButton(
          child: Text(okText),
          color: Colors.blue,
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        FlatButton(
          child: Text(msg),
          onPressed: (){},
        ),
      ],
    ),
  );
}