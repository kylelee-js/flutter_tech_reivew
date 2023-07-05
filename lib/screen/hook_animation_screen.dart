import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sample_project/screen/default_animation_screen.dart';

class HookAnimationScreen extends HookWidget {
  const HookAnimationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 상태 선언 with ValueNotifier - flutter hook이 기본 제공하는 훅
    final controller = useAnimationController(duration: const Duration(seconds: 1));
    final animation = useAnimation(CurvedAnimation(parent: controller, curve: Curves.easeIn));

    useEffect(() {
      return () {
        // clean up code (dispose) ex) removeEventListener
        controller.dispose();
      };
    }, []);

    void goBack() => Navigator.pop(context);

    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          RaisedButton(onPressed: goBack, child: const Text("GO BACK")),
          Text(
            'AnimationController value:${animation.toStringAsFixed(2)}',
          ),
          const SizedBox(
            height: 40,
          ),
          SizedBox(
            height: animation * 100,
            width: animation * 100,
            child: const FlutterLogo(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                child: const Text("forward"),
                onPressed: () => controller.forward(),
              ),
              RaisedButton(
                child: const Text("stop"),
                onPressed: () => controller.stop(),
              ),
              RaisedButton(
                child: const Text("reverse"),
                onPressed: () => controller.reverse(),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
