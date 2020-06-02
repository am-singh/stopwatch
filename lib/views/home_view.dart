import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:stopwatch/models/watch_params.dart';
import 'package:stopwatch/views/about_view.dart';
import 'package:stopwatch/widgets/timer_text.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key}) : super(key: key);

  HomeViewState createState() => new HomeViewState();
}

class HomeViewState extends State<HomeView> {
  WatchParams watchParams;

  @override
  void initState() {
    this.watchParams = new WatchParams();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          radius: 1.2,
          focal: Alignment.center,
          colors: [
            Color.fromRGBO(31, 49, 92, 1),
            Color.fromRGBO(19, 29, 56, 1),
          ],
        ),
      ),
      child: Column(
        children: <Widget>[
          SizedBox(height: 5),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AboutView())),
                  icon: Icon(Feather.menu, size: 20, color: Colors.white.withOpacity(0.8))),
            ),
          ),
          Expanded(child: Center(child: TimerText(watchParams: watchParams))),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton(
                  color: Colors.white.withOpacity(0.1),
                  onPressed: resetTimer,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      "Reset",
                      style: TextStyle(
                          fontFamily: "SF-Regular", letterSpacing: .2, color: Color.fromRGBO(230, 230, 230, 1)),
                    ),
                  ),
                ),
                FlatButton(
                  color: Colors.white.withOpacity(0.1),
                  onPressed: startStopTimer,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      watchParams.stopwatch.isRunning ? "Stop" : "Start",
                      style: TextStyle(
                          fontFamily: "SF-Regular", letterSpacing: .2, color: Color.fromRGBO(230, 230, 230, 1)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  void resetTimer() {
    setState(() {
      watchParams.stopwatch.reset();
    });
  }

  void startStopTimer() {
    setState(() {
      if (watchParams.stopwatch.isRunning) {
        watchParams.stopwatch.stop();
      } else {
        watchParams.stopwatch.start();
      }
    });
  }
}
