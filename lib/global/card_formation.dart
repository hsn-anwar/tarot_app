import 'package:flutter/material.dart';
import 'package:tarot_app/services/size_config.dart';

import 'buttons/setting_button.dart';

class SingleCardFormation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CardIcon(
      size: 17,
    );
  }
}

class ThreeCardFormation extends StatelessWidget {
  // final double cardHeight = 12.0;
  // final double spaceHeight = 35.0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            SizedBox(
              height: SizeConfig.blockSizeVertical * 4,
            ),
            CardIcon(
              size: SizeConfig.blockSizeVertical * 2,
            )
          ],
        ),
        Column(
          children: [
            CardIcon(
              size: SizeConfig.blockSizeVertical * 2,
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 4,
            ),
          ],
        ),
        Column(
          children: [
            SizedBox(
              height: SizeConfig.blockSizeVertical * 4,
            ),
            CardIcon(
              size: SizeConfig.blockSizeVertical * 2,
            )
          ],
        ),
      ],
    );
  }
}

class SevenCardFormation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double cardSize = 6;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CardIcon(size: cardSize),
            CardIcon(size: cardSize),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CardIcon(size: cardSize),
            CardIcon(size: cardSize),
            CardIcon(size: cardSize),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CardIcon(size: cardSize),
            CardIcon(size: cardSize),
          ],
        ),
      ],
    );
  }
}

class CardFormation extends StatelessWidget {
  final String title;
  final Widget formation;
  final double height;

  const CardFormation(
      {Key key, @required this.title, @required this.formation, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        // height: SizeConfig.blockSizeVertical *
        //     (this.height != null ? this.height : 22),
        width: SizeConfig.blockSizeHorizontal * 85,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          color: Color(0xFFF371D61).withOpacity(0.7),
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    children: [
                      Spacer(),
                      Spacer(),
                      Text(
                        this.title,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Spacer(),
                      InfoIcon(),
                    ],
                  ),
                ),
                this.formation,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
