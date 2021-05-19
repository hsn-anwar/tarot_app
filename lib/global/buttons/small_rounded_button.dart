import 'package:flutter/material.dart';

class RoundedButton2 extends StatelessWidget {
  final Function onTap;
  final String title;

  const RoundedButton2({Key key, @required this.onTap, @required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: this.onTap,
        child: Container(
          height: 40.0,
          width: 100.0,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              // tileMode: TileMode.decal,

              colors: [
                Color(0xFFFFEF0E4),
                Color(0xFFFFFE8D6),
                Color(0xFFFE4BD9E)
              ],
            ),
            borderRadius: BorderRadius.all(Radius.circular(100.0)),
          ),
          child: Center(
            child: Text(
              this.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFFF822E81),
              ),
            ),
          ),
        ));
  }
}
