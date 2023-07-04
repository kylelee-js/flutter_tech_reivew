import 'package:flutter/material.dart';

// 상태를 가지는 위젯 객체
class DefaultAnimationScreen extends StatefulWidget {
  const DefaultAnimationScreen({required Key key, required this.duration})
      : super(key: key);
  final Duration duration;

  @override
  State<DefaultAnimationScreen> createState() => _DefaultAnimationScreenState();
}

// 상태 객체
class _DefaultAnimationScreenState extends State<DefaultAnimationScreen>
    with SingleTickerProviderStateMixin {
  // 상태 선언
  late AnimationController _controller;
  late Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  // AnimationController가 추가됨에 따라 위젯의 로직과 관계없는 라이프사이클 코드가 추가된다.
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
    _animation.addListener(() {
      setState(() {});
    });
  }

  @override
  void didUpdateWidget(DefaultAnimationScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.duration != oldWidget.duration) {
      _controller.duration = widget.duration;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
          Text(
            'AnimationController value:${_animation.value.toStringAsFixed(2)}',
          ),
          const SizedBox(
            height: 40,
          ),
          SizedBox(
            height: _animation.value * 100,
            width: _animation.value * 100,
            child: const FlutterLogo(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                child: const Text("forward"),
                onPressed: () => _controller.forward(),
              ),
              RaisedButton(
                child: const Text("stop"),
                onPressed: () => _controller.stop(),
              ),
              RaisedButton(
                child: const Text("reverse"),
                onPressed: () => _controller.reverse(),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

class RaisedButton extends StatelessWidget {
  final Function() onPressed;
  final Widget child;

  const RaisedButton({Key? key, required this.child, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: MaterialButton(
      onPressed: onPressed,
      child: child,
    ));
  }
}
