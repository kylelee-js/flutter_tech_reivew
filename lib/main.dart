import 'package:flutter/material.dart';
import 'package:sample_project/screen/default_animation_screen.dart';
import 'package:sample_project/screen/default_counter_screen.dart';
import 'package:sample_project/screen/hook_animation_screen.dart';
import 'package:sample_project/screen/hook_counter_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // 상태를 가지는 위젯 - 하단에 상태 객체 존재함
  const MyHomePage({super.key, required this.title});

  final String title; // 파라미터로 받는 값은 컴파일 시에 확인됨으로 final 이어야함

  @override // 상태 위젯의 createState라는 함수를 오버라이딩
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void goToDefaultAnimationScreen() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const DefaultAnimationScreen(
            key: Key("DefaultAnimationScreen"),
            duration: Duration(seconds: 1))));
  }

  void goToDefaultCounterScreen() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const DefaultCounterScreen(
              key: Key("DefaultAnimationScreen"),
            )));
  }

  void goToHookAnimationScreen() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const HookAnimationScreen(
              key: Key("HookAnimationScreen"),
            )));
  }

  void goToHookCounterScreen() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>
            const HookCounterScreen(key: Key("HookCounterScreen"))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 앱 기본 토대를 구성하는 위젯
      appBar: AppBar(
        backgroundColor: Colors.red,
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title), // 위에서 파라미터로 받은 title
      ),
      body: Center(
        // Flex center와 유사함
        child: Column(
          // Antd Col과 유사함 - vertical align - 기본적으로 height 100% -> 부모 높이 - mainAxisAlignment flex랑 똑같음
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MaterialButton(
              onPressed: goToDefaultAnimationScreen,
              child: const Text("goToDefaultAnimationScreen"),
            ),
            MaterialButton(
              onPressed: goToDefaultCounterScreen,
              child: const Text("goToDefaultCounterScreen"),
            ),
            MaterialButton(
              onPressed: goToHookAnimationScreen,
              child: const Text("goToHookAnimationScreen"),
            ),
            MaterialButton(
              onPressed: goToHookCounterScreen,
              child: const Text("goToHookCounterScreen"),
            ),
          ],
        ),
      ),
    );
  }
}
