// shared_preferencesパッケージでデータ保存する例
// あまり参考にならない。
// Futureを使わくてもasync/awaitで十分実現できる。

import 'package:flutter/material.dart';
// importと同時にpubspec.yamlの dependencies: に記述してインストールが必要。
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // このFutureクラスには、非同期処理が完了したときに値が入る
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  int _counter = 0;

  void _incrementCounter() async {
    SharedPreferences prefs = await _prefs;
    setState(() {
      // _counter++;
      _counter = (prefs.getInt('counter') ?? 0) + 1;
    });
    await prefs.setInt('counter', _counter);
  }

  Future<int> _getCount() async {
    SharedPreferences prefs = await _prefs;
    //return (prefs.getInt('counter'));
    return (prefs.getInt('counter') ?? 0);
  }

  @override
  Widget build(BuildContext context) {
    _getCount().then((value) {
      setState(() {
        _counter = value;
      });
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
