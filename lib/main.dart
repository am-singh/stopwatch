import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stopwatch/views/home_view.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);

    return MaterialApp(
      showPerformanceOverlay: false,
      debugShowCheckedModeBanner: false,
      title: 'Stopwatch',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: HomeView(),
    );
  }
}
