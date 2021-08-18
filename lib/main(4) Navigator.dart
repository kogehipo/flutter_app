// これは画面遷移のサンプル

import 'package:flutter/material.dart';

// void main() => runApp(MaterialApp(home: FirstRoute()));
// 画面に名前を付ける方法
void main() =>
    runApp(MaterialApp(initialRoute: '/first', routes: <String, WidgetBuilder>{
      '/first': (BuildContext context) => FirstRoute(),
      '/second': (BuildContext context) => SecondRoute(),
    }));

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("First Route")),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  //onPressed: () {
                  //  Navigator.push(context,
                  //      MaterialPageRoute(
                  //          builder: (context) => SecondRoute(
                  //          )
                  //      )
                  //  );
                  //},
                  // 名前で画面遷移する方法
                  onPressed: () {
                    Navigator.pushNamed(context, '/second');
                  },
                  child: Text(
                    'Push Here',
                    style: TextStyle(fontSize: 20),
                  ),
                )
              ]
            )
        )
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Second Route'),
        ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Push Here',
                      style: TextStyle(fontSize: 20),
                    )),
              ],
            )
        )
    );
  }
}
