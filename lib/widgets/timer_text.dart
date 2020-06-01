import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stopwatch/models/elapsed_time.dart';
import 'package:stopwatch/models/watch_params.dart';
import 'package:stopwatch/widgets/minutes_and_seconds.dart';
import 'package:stopwatch/widgets/unicorn_outline_button.dart';

class TimerText extends StatefulWidget {
  TimerText({this.dependencies});
  final WatchParams dependencies;

  TimerTextState createState() => new TimerTextState(dependencies: dependencies);
}

class TimerTextState extends State<TimerText> {
  TimerTextState({this.dependencies});
  final WatchParams dependencies;
  Timer timer;
  int milliseconds;

  @override
  void initState() {
    timer = new Timer.periodic(new Duration(milliseconds: dependencies.timerMillisecondsRefreshRate), callback);
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    timer = null;
    super.dispose();
  }

  void callback(Timer timer) {
    if (milliseconds != dependencies.stopwatch.elapsedMilliseconds) {
      milliseconds = dependencies.stopwatch.elapsedMilliseconds;
      final int hundreds = (milliseconds / 10).truncate();
      final int seconds = (hundreds / 100).truncate();
      final int minutes = (seconds / 60).truncate();
      final ElapsedTime elapsedTime = new ElapsedTime(
        hundreds: hundreds,
        seconds: seconds,
        minutes: minutes,
      );
      for (final listener in dependencies.timerListeners) {
        listener(elapsedTime);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 100,
          width: 200,
          child: UnicornOutlineButton(
            strokeWidth: 6,
            radius: 10,
            gradient: LinearGradient(colors: [Colors.pink, Colors.blue]),
            child: RepaintBoundary(
                child: Container(
                    alignment: Alignment.center,
                    height: 100,
                    width: 200,
                    child: MinutesAndSeconds(dependencies: dependencies))),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
