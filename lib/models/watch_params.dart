import 'package:flutter/material.dart';
import 'package:stopwatch/models/time.dart';

class WatchParams {
  final List<ValueChanged<Time>> timerListeners = <ValueChanged<Time>>[];
  final TextStyle textStyle = const TextStyle(fontSize: 40.0, fontFamily: "SF-Thin", color: Colors.white);
  final Stopwatch stopwatch = new Stopwatch();
  final int timerMillisecondsRefreshRate = 30;
}
