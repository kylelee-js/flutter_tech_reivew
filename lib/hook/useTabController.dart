import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

// class로 상태를 한번 감싼 flutter custom hook - hook이 복잡해지고 라이프사이클 등을 다루는 다른 hook과 조합해야하는 경우
TabController useTabController({required int length, int initialIndex = 0}) {
  // use - Registers a Hook and returns its value.
  // use must be called within the build method of either HookWidget or StatefulHookWidget.
  // All calls of use must be made outside of conditional checks and always in the same order.
  return use(TabControllerHook(length, initialIndex));
}

class TabControllerHook extends Hook<TabController> {
  const TabControllerHook(this.length, this.initialIndex);

  final int length;
  final int initialIndex;

  @override
  HookState<TabController, TabControllerHook> createState() => _TabControllerHookState();
}

class _TabControllerHookState extends HookState<TabController, TabControllerHook> {
  @override
  TabController build(BuildContext context) {
    final tickerProvider = useSingleTickerProvider(keys: [hook.length, hook.initialIndex]);

    // 메모이제이션된 controller
    final controller = useMemoized(
        () => TabController(length: hook.length, vsync: tickerProvider, initialIndex: hook.initialIndex),
        [tickerProvider]);

    // 라이프사이클 등록
    useEffect(() {
      return controller.dispose;
    }, [controller]);

    // controller 제공
    return controller;
  }
}
