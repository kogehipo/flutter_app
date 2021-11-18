// これは dart(3) async,await example と同じものをRiverpod(1.0.0)で実装したもの

import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
//import 'package:flutter_hooks/flutter_hooks.dart';

void main() => runApp(ProviderScope(child: MaterialApp(home: MyPage())));

final counter = StateProvider((ref) => 0);

class MyPage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(child: Text(ref.watch(counter.state).state.toString())),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counter.state).state++;
        },
      ),
    );
  }
}