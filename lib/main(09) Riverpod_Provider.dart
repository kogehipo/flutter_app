import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void main() => runApp(ProviderScope(child: MaterialApp(home: MyHomePage())));

final valueProvider = Provider<int>((ref) {
  return 36;
});

class MyHomePage extends HookConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(valueProvider);


    useEffect(() {
      //sample.getPackage();
      return; // sample.dispose;
    }, const []);



    return Scaffold(
      body: Center(
        child: Text(
          //'Some text here 👍',
          'Value: $value',
          //style: Theme.of(context).textTheme.headline4,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
