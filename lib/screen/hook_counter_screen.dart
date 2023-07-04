import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sample_project/screen/default_animation_screen.dart';

class HookCounterScreen extends HookWidget {
  const HookCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 상태 선언 with ValueNotifier
    final counter = useState(0);

    useEffect(() {
      if (counter.value > 5) {
        final value = counter.value;
        print("counter is greater than 5 => counter: $value");
      }
      return () {
        // clean up code (dispose) ex) removeEventListener
      };
    }, [counter.value]);

    void goBack() {
      Navigator.pop(context);
    }

    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          RaisedButton(onPressed: goBack, child: const Text("GO BACK")),
          Text("${counter.value}"),
          const SizedBox(
            height: 40,
          ),
          GestureDetector(
            onTap: () => counter.value++,
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
