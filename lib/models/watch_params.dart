import 'package:flutter/material.dart';
import 'package:stopwatch/models/elapsed_time.dart';

class WatchParams {
  final List<ValueChanged<ElapsedTime>> timerListeners = <ValueChanged<ElapsedTime>>[];
  final TextStyle textStyle = const TextStyle(fontSize: 40.0, fontFamily: "SF-Thin", color: Colors.white);
  final Stopwatch stopwatch = new Stopwatch();
  final int timerMillisecondsRefreshRate = 30;
}
