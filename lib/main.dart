import 'package:flutter/material.dart';
import 'package:stopwatch/views/home_view.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      showPerformanceOverlay: false,
      debugShowCheckedModeBanner: false,
      title: 'Stopwatch',
      home: Scaffold(
        extendBodyBehindAppBar: true,
        extendBody: true,
        body: HomeView(),
      ),
    );
  }
}
