import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: MyPage()));

class MyPage extends StatefulWidget{
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State{
  int _counter = 0;
  void _incrementCounter(){
    setState(() => _counter++);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("push button")),
      body: Center(child: Text("$_counter")),
      floatingActionButton: FloatingActionButton(
        //onPressed: _incrementCounter,  // 関数コールにしても良い
        onPressed: () {
          setState(() {
            _counter++;
          });
        },
      )
    );
  }
}
