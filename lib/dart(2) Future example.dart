void main() {
  //Futureオブジェクトのdelayedメソッドを使って、
  //３秒後に「100」の値を返す。
  Future.delayed(
    const Duration(seconds: 3),
    () => 100,  //無名関数を使って「100」を返す
  ).then((value) {
    //thenメソッドはコールバック関数を設定する。
    print('The vale is $value');
  }).catchError((e)=> print(e));  //エラー処理も入れておく

  //３秒待っている間にこの処理が先に実行される。
  print('Waiting for a value.');
}