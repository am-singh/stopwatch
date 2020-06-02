import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stopwatch/models/time.dart';
import 'package:stopwatch/models/watch_params.dart';
import 'package:stopwatch/widgets/time_digits.dart';
import 'package:stopwatch/widgets/unicorn_outline_button.dart';

class TimerText extends StatefulWidget {
  TimerText({this.watchParams});
  final WatchParams watchParams;

  TimerTextState createState() => new TimerTextState(watchParams: watchParams);
}

class TimerTextState extends State<TimerText> {
  TimerTextState({this.watchParams});
  final WatchParams watchParams;
  Timer timer;
  int milliseconds;

  @override
  void initState() {
    timer = new Timer.periodic(new Duration(milliseconds: watchParams.timerMillisecondsRefreshRate), tickCallback);
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    timer = null;
    super.dispose();
  }

  void tickCallback(Timer timer) {
    if (milliseconds != watchParams.stopwatch.elapsedMilliseconds) {
      milliseconds = watchParams.stopwatch.elapsedMilliseconds;
      final int seconds = (milliseconds / 1000).truncate();
      final int minutes = (seconds / 60).truncate();
      final Time elapsedTime = new Time(seconds: seconds, minutes: minutes);
      for (final listener in watchParams.timerListeners) {
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
                    child: TimeDigits(dependencies: watchParams))),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
