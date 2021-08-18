/*
 * Flutterテンプレートの解説
 * https://qiita.com/h-hiroki/items/a2030fa76e7f8d1ce647
 */

// マテリアルコンポーネントをimportする
// https://flutter.dev/docs/development/ui/widgets/material
import 'package:flutter/material.dart';

// main()はアプリケーションの入口
// 次のように省略して書くこともできる。
// main() => runApp(MyApp());
// main.dart内のmain()が呼ばれるのは、Android Studioの設定による。変更もできる。
void main() {
  // runApp()は受け付けたWidget展開して画面に描画する。
  // MyApp()はWidgetを返すクラス。名前は何でもOK。
  runApp(MyApp());
}

// extendsで親クラスStatelessWidgetを継承する。
class MyApp extends StatelessWidget {
  // StatelessWidgetはbuild()メソッドを実装する必要がある。
  // @overrideは上書きを示すアノテーション。
  @override
  // BuildContextはWidgetツリー内のWidgetの場所を取り扱う
  Widget build(BuildContext context) {
    // MaterialAppは、home:で指定したMyHomePage()をラップしており、
    // title: や theme: の情報を追加している。
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

// MyHomePageはextendsでStatefulWidgetを継承する。
class MyHomePage extends StatefulWidget {
  // クラス名と同じ名前のメソッドはコンストラクタである。
  MyHomePage({Key? key, required this.title}) : super(key: key);
  // 上の行で xxx(this.title); という書き方は、
  // xxx(String title){
  //  this.title = title;
  // }
  // と書くのと同じ意味。（シンタックスシュガー）
  //
  // {}内は名前付き引数を示す。@requiredが付いてないので{}内は任意指定。
  //
  // コンストラクタの後の「:」で初期化処理を行える。この場合はスーパークラスにkeyを渡している。

  // titleの値はコンストラクタで設定される。
  final String title;

  // StatefulWidgetはcreateState()メソッドでStateを返す。
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

// アプリの状態を表すのが State である。
// _MyHomePageStateクラスは、状態を保持するStateクラスを継承する。
// "_"で始まる名前なのでprivateである。
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    // setState()で状態を更新してUIに反映させる。
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ページ全体をscaffoldでラップするのはお約束。
    return Scaffold(
      appBar: AppBar(
        // widget.titleと書くことで、Stateは自分をcreateStateしたWidgetにアクセスできる。
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
              '$_counter', // $_counterは_counterを変数展開する。
              // テーマを使わずにstyleを設定する例
              //style: TextStyle(
              //  fontSize: 72,
              //  fontWeight: FontWeight.bold,
              //),
              // MaterialAppのtheme:でテーマを変更することもできる。
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // 次の１行はこのように書いても同じ。
        // onPressed: () {
        //   _incrementCounter();
        // },
        // =>を使っても書ける。
        // onPressed: () => _incrementCounter(),
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
