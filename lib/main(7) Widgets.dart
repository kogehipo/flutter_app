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
                    debugPrint("============== Button-onPressed");
                    //すぐに画面遷移するのはやめて
                    //Navigator.pushNamed(context, '/second');
                    //ダイアログで確認するようにした
                    //非同期処理にしないといけないのかな？
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                          title: Text("Accept?"),
                          content: Text("Do you want to move next page?"),
                          actions: [
                            ElevatedButton(
                                child: Text('No'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                }
                            ),
                            ElevatedButton(
                                child: Text('Yes'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  Navigator.pushNamed(context, '/second');
                                }
                            ),
                          ],
                          elevation: 24.0,
                          backgroundColor: Colors.blue,
                          //shape: CircleBorder(),
                      ),
                    );
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
