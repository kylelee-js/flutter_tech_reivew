import 'package:flutter/material.dart';
import 'package:sample_project/screen/default_animation_screen.dart';

// 상태를 가지는 위젯 객체
class DefaultCounterScreen extends StatefulWidget {
  const DefaultCounterScreen({required Key key}) : super(key: key);

  @override
  State<DefaultCounterScreen> createState() => _DefaultCounterScreenState();
}

// 상태 객체
class _DefaultCounterScreenState extends State<DefaultCounterScreen> {
  // 상태 선언
  int counter = 0;

  // 상태를 변경하는 매서드 선언 with setState
  void onPress() {
    setState(() {
      counter++;
    });
  }

  void goBack() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          RaisedButton(onPressed: goBack, child: const Text("GO BACK")),
          Text("$counter"),
          const SizedBox(
            height: 40,
          ),
          GestureDetector(
            onTap: onPress,
            child: Container(
              padding: const EdgeInsets.all(15),
              child: const Text("+"),
            ),
          )
        ]),
      ),
    );
  }
}
