import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:tarot_app/global/constants.dart';
import 'package:tarot_app/global/widgets/reading_screen_widgets.dart';
import 'package:tarot_app/services/size_config.dart';

class SevenCardReadingFormation2 extends StatefulWidget {
  const SevenCardReadingFormation2({Key key}) : super(key: key);

  static const String id = 'SevenCardReadingFormation2';

  @override
  _SevenCardReadingFormation2State createState() =>
      _SevenCardReadingFormation2State();
}

class _SevenCardReadingFormation2State
    extends State<SevenCardReadingFormation2> {
  bool isCardAnimated = false;

  GlobalKey<FlipCardState> cardKey1 = GlobalKey<FlipCardState>();
  GlobalKey<FlipCardState> cardKey2 = GlobalKey<FlipCardState>();
  GlobalKey<FlipCardState> cardKey3 = GlobalKey<FlipCardState>();
  GlobalKey<FlipCardState> cardKey4 = GlobalKey<FlipCardState>();
  GlobalKey<FlipCardState> cardKey5 = GlobalKey<FlipCardState>();
  GlobalKey<FlipCardState> cardKey6 = GlobalKey<FlipCardState>();
  GlobalKey<FlipCardState> cardKey7 = GlobalKey<FlipCardState>();

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
                  SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: SizeConfig.blockSizeVertical * 85,
                          child: Stack(
                            children: [
                              ZoomedPedestals(),
                              ZoomedTableTop(),
                              SingleLight(
                                left: 15,
                                bottom: 40,
                              ),
                              SingleLight(
                                left: 60,
                                bottom: 40,
                              ),
                              SingleLight(
                                left: 15,
                                bottom: 15,
                              ),
                              SingleLight(
                                left: 2,
                                bottom: 27,
                              ),
                              SingleLight(
                                left: 40,
                                bottom: 27,
                              ),
                              SingleLight(
                                left: 80,
                                bottom: 27,
                              ),
                              SingleLight(
                                left: 60,
                                bottom: 15,
                              ),
                              // top left
                              AnimatedCard(
                                cardKey: cardKey1,
                                onAnimateCallback: (bool value) =>
                                    onCardAnimated(value),
                                alignmentY: -0.2,
                                alignmentX: -0.6,
                              ),
                              // top right
                              AnimatedCard(
                                cardKey: cardKey2,
                                onAnimateCallback: (bool value) =>
                                    onCardAnimated(value),
                                alignmentY: -0.2,
                                alignmentX: 0.46,
                              ),
                              AnimatedCard(
                                cardKey: cardKey3,
                                onAnimateCallback: (bool value) =>
                                    onCardAnimated(value),
                                alignmentY: 0.16,
                                alignmentX: -0.9,
                              ),
                              AnimatedCard(
                                cardKey: cardKey4,
                                onAnimateCallback: (bool value) =>
                                    onCardAnimated(value),
                                alignmentY: 0.16,
                                alignmentX: 0,
                              ),
                              AnimatedCard(
                                cardKey: cardKey5,
                                onAnimateCallback: (bool value) =>
                                    onCardAnimated(value),
                                alignmentY: 0.16,
                                alignmentX: 0.95,
                              ),
                              AnimatedCard(
                                cardKey: cardKey6,
                                onAnimateCallback: (bool value) =>
                                    onCardAnimated(value),
                                alignmentY: 0.47,
                                alignmentX: -0.6,
                              ),
                              AnimatedCard(
                                cardKey: cardKey7,
                                onAnimateCallback: (bool value) =>
                                    onCardAnimated(value),
                                alignmentY: 0.47,
                                alignmentX: 0.46,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
