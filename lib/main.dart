import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter2/util/dialog_util.dart';

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

// ignore: must_be_immutable
class Page1 extends HookWidget{
  AudioPlayer player;//保证stop有效,拒绝被覆盖
  Page1({Key key}):super(key: key){
    player=AudioPlayer();
  }

  Widget build(BuildContext context) {
    final String musicUrl='http://aq.webturing.com/wp-content/uploads/2021/03/tstMusic.mp3';
    final time=useState('00:00');

    player.onAudioPositionChanged.listen((duration) {//监听
      var sec=duration.inSeconds;
      var m=(sec~/60).toString().padLeft(2, '0');
      var s=(sec%60).toString().padLeft(2, '0');
      time.value='$m:$s';
    });


    player.onPlayerStateChanged.listen((event) {
      print('event: $event');
    });

    player.onPlayerError.listen((event) {
      print('player error: $event');

      alert(
        context,
        title: '播放失败',
        msg: '无法加载稍后重试',
      );

      AlertDialog(
        title: Text('播放失败'),
        content: Text('请检查网络连接，并重试'),);
        time.value='错误';
    });

    return Scaffold(
      appBar: AppBar(title: Text('页面1')),
      body: Center(
        child: Column(
          children: [
            Text(time.value, style:TextStyle(
              fontSize: 40,
            )),

            FlatButton(
              color: Colors.blue,
              child: Text('播放'),
              onPressed: () async{
                var res=await player.play(musicUrl);
                // print('play: $res');//1代表成功
                if(res!=1) {
                  alert(
                    context,
                    title: '播放失败',
                    msg: '音乐无法停止播放',
                  );
                }
                time.value='读取中...';

              },

            ),

            FlatButton(
              color: Colors.blue,
              child: Text('停止'),
              onPressed: () async{
                var res=await player.stop();
                // print('stop: $res');
                time.value='00:00';
                if(res!=1){
                  alert(
                    context,
                    title: '停止失败',
                    msg: '请手动关闭程序',
                  );
                }

              },
            ),

            FlatButton(
              color: Colors.red,
              child: Text('报错'),
              onPressed: (){
                alert(
                    context,
                    title: '播放失败了',
                    msg: '怎么第吧',
                );
              },
            )
          ],
        ),
      ),
    );
  }

}