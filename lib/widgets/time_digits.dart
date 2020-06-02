import 'package:flutter/material.dart';
import 'package:stopwatch/models/time.dart';
import 'package:stopwatch/models/watch_params.dart';

class TimeDigits extends StatefulWidget {
  TimeDigits({this.dependencies});
  final WatchParams dependencies;

  TimeDigitsState createState() => new TimeDigitsState(dependencies: dependencies);
}

class TimeDigitsState extends State<TimeDigits> {
  TimeDigitsState({this.dependencies});
  final WatchParams dependencies;

  int minutes = 0;
  int seconds = 0;

  @override
  void initState() {
    dependencies.timerListeners.add(onTick);
    super.initState();
  }

  void onTick(Time elapsed) {
    if (elapsed.minutes != minutes || elapsed.seconds != seconds) {
      setState(() {
        minutes = elapsed.minutes;
        seconds = elapsed.seconds;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String minutesStr = (minutes % 60).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');
    return new Text('$minutesStr:$secondsStr', style: dependencies.textStyle);
  }
}
