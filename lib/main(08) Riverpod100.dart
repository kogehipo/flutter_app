// このサンプルの出所は下記のページ。
// https://rupasystem.com/riverpod-flutterhooks-changehelloworld-stateprovider/
// ただし、Riverpod 1.0.0 で破壊的変更が多数あり、変更が必要になった。
// https://tokku-engineer.tech/flutterriverpod-1-0-0-stable-changelog/
// ・HookWidget は HookConsumerWidget に変更
// ・build() で WidgetRef ref を受け取る
// ・useProvide() は不要となり、値の参照は ref.watch() を、値の変更は ref.read() を使う

import 'package:flutter/material.dart';

// ポイント1
// ※旧版の書き方
// pubspec.yamlの以下の場所に  flutter_hooks: ^0.15.0、
// hooks_riverpod: ^0.12.1を追記(インデント注意)
// dependencies:
//   flutter:
//     sdk: flutter
//   flutter_hooks: ^0.15.0
//   hooks_riverpod: ^0.12.1
// ※新版の書き方
//   この２つには依存関係があるので同時に変更すること
//   flutter_hooks: ^0.18.1
//   hooks_riverpod: ^1.0.0

// ポイント2
// main.dartに以下の2行を追加してパッケージを使えるようにする
import 'package:hooks_riverpod/hooks_riverpod.dart';
//import 'package:flutter_hooks/flutter_hooks.dart';
// ↑ このサンプルの限りでは Hooks は不要らしい（いつもそうかは未確認）

void main() {
  runApp(
    // ポイント3
    // MyApp()をProviderScopeで包む
    ProviderScope(child: MyApp()),
  );
}

// ポイント4
// 引数を以下のようにしてStateProviderオブジェクトを
// 生成してstringStateProviderに入れる
final stringStateProvider = StateProvider((ref) => 'Hello world');

// ポイント5
// HookWidgetを継承する → HookConsumerWidget に変更
//class MyApp extends HookWidget {
class MyApp extends HookConsumerWidget {
  @override
  // 追加ポイント
  // build()の引数に ref を追加する
  //Widget build(BuildContext context) {
  Widget build(BuildContext context, WidgetRef ref) {

    // 動作確認用1
    print("buildメソッド");

    // ポイント6  → コレは不要。useProvider() は廃止された。
    // useProvider(stringStateProvider)で
    // オブジェクトを生成してstringstateに入れる
    // buildメソッドの中に書くこと
    //final stringstate = useProvider(stringStateProvider);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Change Hello world'),
        ),
        body: Center(

          // ポイント7 → これは変更必要
          // stringstate.stateで文字列を取り出す
          //child: Text(stringstate.state),
          // 値の参照は ref.watch() を使う
          child: Text(ref.watch(stringStateProvider.state).state),

        ),
        floatingActionButton: FloatingActionButton(

          // ボタンを押したとき
          onPressed: () {

            // ポイント8  → これは変更必要
            // stringstate.stateで新しい文字列を入れる
            //stringstate.state = "こんにちは世界";
            // ポイント4のところで
            // Provider((ref) => 'Hello world');を
            // 使っていた場合、こんな感じで
            // Hello worldを更新することができない
            // → 値の変更は ref.read() を使う
            ref.read(stringStateProvider.state).state = "こんにちは世界";

            // 動作確認用2
            print("ボタン押下");

          },
        ),
      ),
    );
  }
}
