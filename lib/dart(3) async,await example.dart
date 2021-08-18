//Future<void> main() async {   // asyncをつけたらFutureなので省略可能
main() async {
  var value;
  value = await Future.delayed(
    const Duration(seconds: 3),
    () => 100,
  );
  print('The value is $value');

  value = await Future.delayed(
    const Duration(seconds: 3),
        () => 200,
  );
  print('The next value is $value');

  print('Waiting for value...');
}