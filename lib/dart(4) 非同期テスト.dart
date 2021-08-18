// このテストコードは以下のページから拝借
// https://blog.chocolapod.net/momokan/entry/104
// ただし、もとのままではエラーが出るし、記事の通りの振る舞いにならない。
// どうやら Dart 2.12.0 の仕様変更が影響しているようだ。
// pubspec.yaml を、sdk: ">=2.7.0 <3.0.0" とすると古い動作になる。
// Dart 2.12 に関する記事
// https://zuma-lab.com/posts/flutter-dart-sound-null-safety-replace
// https://gaprot.jp/2021/05/18/flutter-null-safety-migrate/

import 'dart:async';

main() {
  ready();
  countDown();
  go();
}

void ready() {
  print("Ready set...");
}

//void countNumber(number) {
Future<void> countNumber(number) async {
  print(number);
}

void countDown() async {
  // ここで await を使って待機したい
  await countNumber(3);
  countNumber(2);
  countNumber(1);
}

void go() {
  print("Go!!");
}