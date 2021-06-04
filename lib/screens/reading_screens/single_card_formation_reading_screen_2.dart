import 'dart:math';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:tarot_app/global/constants.dart';
import 'package:tarot_app/global/widgets/background_template.dart';
import 'package:tarot_app/global/widgets/reading_screen_widgets.dart';
import 'package:tarot_app/services/size_config.dart';

class SingleCardReadingFormation2 extends StatefulWidget {
  const SingleCardReadingFormation2({Key key}) : super(key: key);
  static final String id = 'SingleCardReadingFormation2';
  @override
  _SingleCardReadingFormation2State createState() =>
      _SingleCardReadingFormation2State();
}

class _SingleCardReadingFormation2State
    extends State<SingleCardReadingFormation2> {
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  bool animateCardOne = false;
  bool isOneRevealed = false;
  bool isCardAnimated = false;

  void onCardAnimated(bool value) {
    print(value);
    setState(() {
      isCardAnimated = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (isCardAnimated) {
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              animateCardOne = !animateCardOne;
              isOneRevealed = false;
            });
          },
        ),
        body: Container(
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImagePath.kReadingBg),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Hero(
              tag: 'tag',
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: SizeConfig.blockSizeVertical * 85,
                        child: Stack(
                          children: [
                            ZoomedPedestals(),
                            ZoomedTableTop(),
                            SingleLight(
                              left: 40,
                              bottom: 27,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  AnimatedCard(
                    cardKey: cardKey,
                    onAnimateCallback: (bool value) => onCardAnimated(value),
                    alignmentY: 0.1,
                    alignmentX: 0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
