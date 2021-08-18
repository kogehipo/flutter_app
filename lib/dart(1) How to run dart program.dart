// ファイルを右クリックして Run か Debug を押すとDartプログラムが実行される。
// 同じ方法で他のファイルも実行できる。

void main() {

  print('Hello World 🐶');

  // numはintかdoubleのどちらでも取りうる
  num one;
  one = 1;
  print(one);
  one = 1.2;
  print(one);

  print("");

  //forEachに無名関数を使った例
  var list = ['apples', 'bananas', 'oranges'];
  list.forEach((item){
    print('${list.indexOf(item)}: $item');
  });

  print("");

  //forEachに無名関数を使った例、のその省略形
  var animals = ['cats', 'dogs', 'fish'];
  animals.forEach((item) => print('${animals.indexOf(item)}: $item'));
}