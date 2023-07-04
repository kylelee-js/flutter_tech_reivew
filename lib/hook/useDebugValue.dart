import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

ValueNotifier useDebugValue(initialState, debugLabel) {
  final state = useState(initialState);
  print(debugLabel + ": " + initialState);
  return state;
}
