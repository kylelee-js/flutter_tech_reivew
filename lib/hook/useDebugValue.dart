import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

// 함수로만 구성된 flutter custom hook - 단순 상태값만을 다루는 기초적인 hook
ValueNotifier useDebugValue(initialState, debugLabel) {
  final state = useState(initialState);
  print(debugLabel + ": " + initialState);
  return state;
}
