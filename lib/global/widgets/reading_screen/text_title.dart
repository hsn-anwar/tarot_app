import 'package:flutter/material.dart';

import '../../constants.dart';

class TitleText extends StatelessWidget {
  const TitleText({Key key, @required this.message}) : super(key: key);
  final String message;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              this.message,
              maxLines: 2,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w700,
                fontFamily: CustomFonts.malgun,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Scroll thorough the cards and pick the \nones that call out to you',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: CustomFonts.malgun,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
