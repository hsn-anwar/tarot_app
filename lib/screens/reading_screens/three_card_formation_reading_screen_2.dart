import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:tarot_app/global/constants.dart';
import 'package:tarot_app/global/widgets/reading_screen_widgets.dart';
import 'package:tarot_app/services/size_config.dart';

class ThreeCardReadingFormation2 extends StatefulWidget {
  const ThreeCardReadingFormation2({Key key}) : super(key: key);

  static const String id = 'ThreeCardReadingFormation2';

  @override
  _ThreeCardReadingFormation2State createState() =>
      _ThreeCardReadingFormation2State();
}

class _ThreeCardReadingFormation2State
    extends State<ThreeCardReadingFormation2> {
  GlobalKey<FlipCardState> cardKey1 = GlobalKey<FlipCardState>();
  GlobalKey<FlipCardState> cardKey2 = GlobalKey<FlipCardState>();
  GlobalKey<FlipCardState> cardKey3 = GlobalKey<FlipCardState>();

  bool isCardAnimated = false;
  bool cardOneAnimated = false;
  bool cardTwoAnimated = false;
  bool cardThreeAnimated = false;

  void onCardOneAnimated(bool value) {
    print(value);
    setState(() {
      isCardAnimated = value;
    });
  }

  void onCardTwoAnimated(bool value) {
    print(value);
    setState(() {
      isCardAnimated = value;
    });
  }

  void onCardThreeAnimated(bool value) {
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
                              bottom: 40,
                            ),
                            SingleLight(
                              left: 15,
                              bottom: 15,
                            ),
                            SingleLight(
                              left: 65,
                              bottom: 15,
                            ),
                            AnimatedCard(
                              cardKey: cardKey1,
                              onAnimateCallback: (bool value) =>
                                  onCardOneAnimated(value),
                              alignmentY: -0.15,
                              alignmentX: 0,
                            ),
                            AnimatedCard(
                              cardKey: cardKey2,
                              onAnimateCallback: (bool value) =>
                                  onCardTwoAnimated(value),
                              alignmentY: 0.45,
                              alignmentX: 0.6,
                            ),
                            AnimatedCard(
                              cardKey: cardKey3,
                              onAnimateCallback: (bool value) =>
                                  onCardThreeAnimated(value),
                              alignmentY: 0.45,
                              alignmentX: -0.6,
                            ),
                          ],
                        ),
                      )
                    ],
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
