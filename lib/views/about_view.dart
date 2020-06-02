import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class AboutView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
        child: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AboutItem(text: "Amrinder Singh", icon: Icon(Feather.user, color: Colors.white, size: 15)),
                AboutItem(text: "github.com/am-singh", icon: Icon(Feather.github, color: Colors.white, size: 15)),
                AboutItem(text: "am-singh.com", icon: Icon(Feather.circle, color: Colors.white, size: 15)),
              ],
            ),
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: Icon(
                  Feather.arrow_left,
                  color: Colors.white.withOpacity(0.8),
                  size: 20,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AboutItem extends StatelessWidget {
  final Icon icon;
  final String text;

  AboutItem({Key key, this.icon, this.text}) : super(key: key);

  final TextStyle txAbout = new TextStyle(
    fontFamily: "SF-Regular",
    color: Colors.white.withOpacity(0.9),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 10),
          icon,
          SizedBox(width: 10),
          Text(text, style: txAbout),
        ],
      ),
    );
  }
}
