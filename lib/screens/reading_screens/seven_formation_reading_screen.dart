import 'dart:math';

import 'package:circle_list/circle_list.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spring/spring.dart';
import 'package:tarot_app/global/constants.dart';
import 'package:tarot_app/global/widgets/background_blur.dart';
import 'package:tarot_app/global/widgets/reading_screen/animated_background.dart';
import 'package:tarot_app/global/widgets/reading_screen/deactivated_light.dart';
import 'package:tarot_app/global/widgets/reading_screen/pedestals.dart';
import 'package:tarot_app/global/widgets/reading_screen/table_top.dart';
import 'package:tarot_app/global/widgets/reading_screen/text_title.dart';
import 'package:tarot_app/global/widgets/top_bar.dart';
import 'package:tarot_app/screens/card_reveal.dart';
import 'package:tarot_app/screens/reading_screens/seven_card_formation_reading_screen_2.dart';
import 'package:tarot_app/services/size_config.dart';

class SevenFormationReadingScreen extends StatefulWidget {
  const SevenFormationReadingScreen({Key key, this.message}) : super(key: key);
  static final String id = 'reading_screen';
  final String message;
  @override
  _SevenFormationReadingScreenState createState() =>
      _SevenFormationReadingScreenState();
}

class _SevenFormationReadingScreenState
    extends State<SevenFormationReadingScreen> {
  double lightSize = 15;
  AnimationController animationController;
  bool zoomScreen = false;
  bool animateContainer = false;
  SpringController _scaleController =
      SpringController(initialAnim: Motion.pause);
  SpringController _translateController =
      SpringController(initialAnim: Motion.pause);
  bool zoomTableTop = false;
  bool isCardSelected = false;

  bool cardOneSelected = false;
  bool cardTwoSelected = false;
  bool cardThreeSelected = false;
  bool cardFourSelected = false;
  bool cardFiveSelected = false;
  bool cardSixSelected = false;
  bool cardSevenSelected = false;

  GlobalKey<FlipCardState> cardKey1 = GlobalKey<FlipCardState>();
  GlobalKey<FlipCardState> cardKey2 = GlobalKey<FlipCardState>();
  GlobalKey<FlipCardState> cardKey3 = GlobalKey<FlipCardState>();
  GlobalKey<FlipCardState> cardKey4 = GlobalKey<FlipCardState>();
  GlobalKey<FlipCardState> cardKey5 = GlobalKey<FlipCardState>();
  GlobalKey<FlipCardState> cardKey6 = GlobalKey<FlipCardState>();
  GlobalKey<FlipCardState> cardKey7 = GlobalKey<FlipCardState>();

  SpringController _translateController2 =
      SpringController(initialAnim: Motion.pause);

  List<String> words = [];
  int wordIndex = 0;

  SpringController _fadeController =
      SpringController(initialAnim: Motion.pause);

  @override
  void initState() {
    getMessage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: debug,
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
          child: Stack(
            children: [
              Column(
                children: [
                  TopBar(title: ''),
                  Stack(
                    children: [
                      Spring.translate(
                        beginOffset: Offset.zero,
                        endOffset: Offset(0, -1000),
                        animDuration: Duration(seconds: 2),
                        springController: _translateController,
                        child: Container(
                          height: SizeConfig.blockSizeVertical * 30,
                          child: CircleList(
                            origin: Offset(0, 150),
                            children: List.generate(
                              10,
                              (index) {
                                return Image.asset(ImagePath.kCardBack);
                                // child: Image.asset(ImagePath.kCardBack)
                              },
                            ),
                          ),
                        ),
                      ),
                      TitleText(
                        message: words[wordIndex],
                      ),
                    ],
                  ),
                  Spacer(),
                  Spring.translate(
                    beginOffset: Offset.zero,
                    endOffset: Offset(0, -110),
                    springController: _translateController,
                    animStatus: (AnimStatus status) {
                      print('translate: $status');
                    },
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      height: SizeConfig.blockSizeVertical * 50,
                      width: double.infinity,
                      child: Stack(
                        children: [
                          Spring.translate(
                            beginOffset: Offset.zero,
                            endOffset: Offset(0, -50),
                            springController: _translateController,
                            child: Spring.scale(
                              start: 1,
                              end: 1.1,
                              springController: _scaleController,
                              child: Pedestals(
                                zoom: zoomTableTop,
                              ),
                            ),
                          ),
                          Spring.translate(
                            beginOffset: Offset.zero,
                            endOffset: Offset(0, -100),
                            springController: _translateController2,
                            animDuration: Duration(seconds: 1),
                            animStatus: (AnimStatus status) {
                              if (status == AnimStatus.completed) {
                                _translateController2.play(
                                    motion: Motion.pause);
                              }
                              if (status == AnimStatus.dismissed) {
                                _translateController2.play(
                                    motion: Motion.pause);
                              }
                            },
                            child: Spring.scale(
                                start: 1,
                                end: 1.5,
                                animDuration: Duration(milliseconds: 800),
                                springController: _scaleController,
                                child: TableTop(),
                                animStatus: (AnimStatus status) {
                                  print('scale: $status');
                                }),
                          ),
                          // // SingleLight(lightSize: !zoomTableTop ? 15 : 20),
                          // // First Row
                          // // Left --> Right
                          // DeactivatedLight(
                          //   alignment: !zoomTableTop
                          //       ? Alignment(-0.4, -0.3)
                          //       : Alignment(-0.5, -0.5),
                          //   zoom: zoomTableTop,
                          // ),
                          // DeactivatedLight(
                          //   alignment: !zoomTableTop
                          //       ? Alignment(0.4, -0.3)
                          //       : Alignment(0.5, -0.5),
                          //   zoom: zoomTableTop,
                          // ),
                          // // Second Row
                          // // Right --> Left
                          // DeactivatedLight(
                          //   alignment: !zoomTableTop
                          //       ? Alignment(0.7, 0.15)
                          //       : Alignment(1, 0.2),
                          //   zoom: zoomTableTop,
                          // ),
                          // DeactivatedLight(
                          //   alignment: !zoomTableTop
                          //       ? Alignment(0.0, 0.15)
                          //       : Alignment(0.0, 0.2),
                          //   zoom: zoomTableTop,
                          // ),
                          // DeactivatedLight(
                          //   alignment: !zoomTableTop
                          //       ? Alignment(-0.7, 0.15)
                          //       : Alignment(-1, 0.2),
                          //   zoom: zoomTableTop,
                          // ),
                          // // Third Row
                          // // Left --> Right
                          // DeactivatedLight(
                          //   alignment: !zoomTableTop
                          //       ? Alignment(-0.4, 0.56)
                          //       : Alignment(-0.5, 0.9),
                          //   zoom: zoomTableTop,
                          // ),
                          // DeactivatedLight(
                          //   alignment: !zoomTableTop
                          //       ? Alignment(0.4, 0.56)
                          //       : Alignment(0.5, 0.9),
                          //   zoom: zoomTableTop,
                          // ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              isCardSelected ? BackgroundBlur() : Container(),
              // First Row
              // Left --> Right
              AnimatedBackground(
                alignmentX: !zoomTableTop ? -0.32 : -0.47,
                alignmentY: !zoomTableTop ? 0.3 : -0.12,
                cardKey: cardKey1,
                cardSize: !zoomTableTop ? 11 : 15,
                cardDescription: "desc desc desc desc",
                characterImagePath: EnglishCharacterCardPath.adrasteia,
                title: cardOneSelected ? words[0] : '',
                onAnimateCallback: (bool value) => onCardOneTapped(value),
                showCard: showCardOne(),
              ),
              AnimatedBackground(
                alignmentX: !zoomTableTop ? 0.325 : 0.49,
                alignmentY: !zoomTableTop ? 0.3 : -0.12,
                cardKey: cardKey2,
                cardSize: !zoomTableTop ? 11 : 15,
                cardDescription: "desc desc desc desc",
                characterImagePath: EnglishCharacterCardPath.earth,
                title: cardTwoSelected ? words[1] : '',
                onAnimateCallback: (bool value) => onCardTwoTapped(value),
                showCard: showCardTwo(),
              ),
              // Second Row
              // Left --> Right
              AnimatedBackground(
                alignmentX: !zoomTableTop ? -0.64 : -0.95,
                alignmentY: !zoomTableTop ? 0.49 : 0.2,
                cardKey: cardKey3,
                cardSize: !zoomTableTop ? 11 : 15,
                cardDescription: "desc desc desc desc",
                characterImagePath: EnglishCharacterCardPath.ambael,
                title: cardThreeSelected ? words[2] : '',
                onAnimateCallback: (bool value) => onCardThreeTapped(value),
                showCard: showCardThree(),
              ),
              AnimatedBackground(
                alignmentX: !zoomTableTop ? 0 : 0,
                alignmentY: !zoomTableTop ? 0.49 : 0.2,
                cardKey: cardKey4,
                cardSize: !zoomTableTop ? 11 : 15,
                cardDescription: "desc desc desc desc",
                characterImagePath: EnglishCharacterCardPath.ambael,
                title: cardThreeSelected ? words[3] : '',
                onAnimateCallback: (bool value) => onCardFourTapped(value),
                showCard: showCardFour(),
              ),
              AnimatedBackground(
                alignmentX: !zoomTableTop ? 0.65 : 0.95,
                alignmentY: !zoomTableTop ? 0.49 : 0.2,
                cardKey: cardKey5,
                cardSize: !zoomTableTop ? 11 : 15,
                cardDescription: "desc desc desc desc",
                characterImagePath: EnglishCharacterCardPath.ambael,
                title: cardThreeSelected ? words[4] : '',
                onAnimateCallback: (bool value) => onCardFiveTapped(value),
                showCard: showCardFive(),
              ),
              // Third row
              // Left --> Right
              AnimatedBackground(
                alignmentX: !zoomTableTop ? -0.32 : -0.47,
                alignmentY: !zoomTableTop ? 0.7 : 0.5,
                cardKey: cardKey6,
                cardSize: !zoomTableTop ? 11 : 15,
                cardDescription: "desc desc desc desc",
                characterImagePath: EnglishCharacterCardPath.adrasteia,
                title: cardOneSelected ? words[5] : '',
                onAnimateCallback: (bool value) => onCardSixTapped(value),
                showCard: showCardSix(),
              ),
              AnimatedBackground(
                alignmentX: !zoomTableTop ? 0.33 : 0.49,
                alignmentY: !zoomTableTop ? 0.7 : 0.5,
                cardKey: cardKey7,
                cardSize: !zoomTableTop ? 11 : 15,
                cardDescription: "desc desc desc desc",
                characterImagePath: EnglishCharacterCardPath.earth,
                title: cardTwoSelected ? words[6] : '',
                onAnimateCallback: (bool value) => onCardSevenTapped(value),
                showCard: showCardSeven(),
              ),
              Spring.blink(
                springController: _fadeController,
                startOpacity: 1,
                endOpacity: 0,
                animDuration: Duration(milliseconds: isCardSelected ? 1000 : 0),
                child: SevenFormationLight(
                  alignment: !zoomTableTop
                      ? Alignment(-0.35, 0.38)
                      : Alignment(-0.535, -0.02),
                  zoom: zoomTableTop,
                ),
              ),

              Spring.blink(
                springController: _fadeController,
                startOpacity: 1,
                endOpacity: 0,
                animDuration: Duration(milliseconds: isCardSelected ? 1000 : 0),
                child: SevenFormationLight(
                  alignment: !zoomTableTop
                      ? Alignment(0.35, 0.38)
                      : Alignment(0.535, -0.02),
                  zoom: zoomTableTop,
                ),
              ),
              Spring.blink(
                springController: _fadeController,
                startOpacity: 1,
                endOpacity: 0,
                animDuration: Duration(milliseconds: isCardSelected ? 1000 : 0),
                child: SevenFormationLight(
                  alignment: !zoomTableTop
                      ? Alignment(-0.7, 0.58)
                      : Alignment(-1.07, 0.32),
                  zoom: zoomTableTop,
                ),
              ),
              Spring.blink(
                springController: _fadeController,
                startOpacity: 1,
                endOpacity: 0,
                animDuration: Duration(milliseconds: isCardSelected ? 1000 : 0),
                child: SevenFormationLight(
                  alignment: !zoomTableTop
                      ? Alignment(-0.01, 0.58)
                      : Alignment(-0.01, 0.32),
                  zoom: zoomTableTop,
                ),
              ),
              Spring.blink(
                springController: _fadeController,
                startOpacity: 1,
                endOpacity: 0,
                animDuration: Duration(milliseconds: isCardSelected ? 1000 : 0),
                child: SevenFormationLight(
                  alignment: !zoomTableTop
                      ? Alignment(0.7, 0.58)
                      : Alignment(1.05, 0.32),
                  zoom: zoomTableTop,
                ),
              ),
              Spring.blink(
                springController: _fadeController,
                startOpacity: 1,
                endOpacity: 0,
                animDuration: Duration(milliseconds: isCardSelected ? 1000 : 0),
                child: SevenFormationLight(
                  alignment: !zoomTableTop
                      ? Alignment(-0.35, 0.8)
                      : Alignment(-0.535, 0.65),
                  zoom: zoomTableTop,
                ),
              ),
              Spring.blink(
                springController: _fadeController,
                startOpacity: 1,
                endOpacity: 0,
                animDuration: Duration(milliseconds: isCardSelected ? 1000 : 0),
                child: SevenFormationLight(
                  alignment: !zoomTableTop
                      ? Alignment(0.35, 0.8)
                      : Alignment(0.535, 0.65),
                  zoom: zoomTableTop,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void getMessage() {
    String w = widget.message.replaceAll("\n", "-");
    print(w);
    List<String> temp = w.split("-");

    for (int i = 0; i <= temp.length - 1; i++) {
      words.add(temp[i].trim());
    }

    print(words);
  }

  void debug() async {
    if (!zoomTableTop) {
      setState(() {
        zoomTableTop = true;
      });
      await Future.delayed(const Duration(milliseconds: 105), () {
        _scaleController.play();
        _translateController.play();
      }).then((value) {
        Future.delayed(const Duration(seconds: 1), () {
          _scaleController.play(motion: Motion.pause);
          _translateController.play(motion: Motion.pause);
        });
      });
    }
  }

  void animateTableUp(bool value) {
    if (value) {
      _fadeController.play(motion: Motion.play);

      Future.delayed(const Duration(milliseconds: 800), () {
        setState(() {
          _translateController2.play(motion: Motion.play);
        });
      });
    } else {
      _fadeController.play(motion: Motion.reverse);

      _translateController2.play(motion: Motion.reverse);
    }
  }

  void onCardOneTapped(bool value) {
    animateTableUp(value);
    print('card 1 tapped');
    print('oldValue: $cardOneSelected');
    setState(() {
      isCardSelected = value;
      cardOneSelected = value;
      cardTwoSelected = false;
      cardThreeSelected = false;
      cardFourSelected = false;
      cardFiveSelected = false;
      cardSixSelected = false;
      cardSevenSelected = false;
    });
    print('cardOneStatus: $cardOneSelected');
  }

  void onCardTwoTapped(bool value) {
    animateTableUp(value);

    print('card 1 tapped');
    print('oldValue: $cardOneSelected');
    setState(() {
      isCardSelected = value;
      cardTwoSelected = value;
      cardOneSelected = false;
      cardThreeSelected = false;
      cardFourSelected = false;
      cardFiveSelected = false;
      cardSixSelected = false;
      cardSevenSelected = false;
    });
    print('cardOneStatus: $cardOneSelected');
  }

  void onCardThreeTapped(bool value) {
    animateTableUp(value);

    print('card 1 tapped');
    print('oldValue: $cardOneSelected');
    setState(() {
      isCardSelected = value;
      cardThreeSelected = value;
      cardOneSelected = false;
      cardTwoSelected = false;
      cardFourSelected = false;
      cardFiveSelected = false;
      cardSixSelected = false;
      cardSevenSelected = false;
    });
    print('cardOneStatus: $cardOneSelected');
  }

  void onCardFourTapped(bool value) {
    animateTableUp(value);

    print('card 1 tapped');
    print('oldValue: $cardOneSelected');
    setState(() {
      isCardSelected = value;
      cardFourSelected = value;
      cardOneSelected = false;
      cardTwoSelected = false;
      cardThreeSelected = false;
      cardFiveSelected = false;
      cardSixSelected = false;
      cardSevenSelected = false;
    });
    print('cardOneStatus: $cardOneSelected');
  }

  void onCardFiveTapped(bool value) {
    animateTableUp(value);

    print('card 1 tapped');
    print('oldValue: $cardOneSelected');
    setState(() {
      isCardSelected = value;
      cardFiveSelected = value;
      cardOneSelected = false;
      cardTwoSelected = false;
      cardThreeSelected = false;
      cardFourSelected = false;
      cardSixSelected = false;
      cardSevenSelected = false;
    });
    print('cardOneStatus: $cardOneSelected');
  }

  void onCardSixTapped(bool value) {
    animateTableUp(value);

    print('card 1 tapped');
    print('oldValue: $cardOneSelected');
    setState(() {
      isCardSelected = value;
      cardSixSelected = value;
      cardOneSelected = false;
      cardTwoSelected = false;
      cardThreeSelected = false;
      cardFourSelected = false;
      cardFiveSelected = false;
      cardSevenSelected = false;
    });
    print('cardOneStatus: $cardOneSelected');
  }

  void onCardSevenTapped(bool value) {
    animateTableUp(value);

    print('card 1 tapped');
    print('oldValue: $cardOneSelected');
    setState(() {
      isCardSelected = value;
      cardSevenSelected = value;
      cardOneSelected = false;
      cardTwoSelected = false;
      cardThreeSelected = false;
      cardFourSelected = false;
      cardFiveSelected = false;
      cardSixSelected = false;
    });
    print('cardOneStatus: $cardOneSelected');
  }

  bool showCardOne() {
    if (cardTwoSelected ||
        cardThreeSelected ||
        cardFourSelected ||
        cardFiveSelected ||
        cardSixSelected ||
        cardSevenSelected) {
      return false;
    } else {
      return true;
    }
  }

  bool showCardTwo() {
    if (cardOneSelected ||
        cardThreeSelected ||
        cardFourSelected ||
        cardFiveSelected ||
        cardSixSelected ||
        cardSevenSelected) {
      return false;
    } else {
      return true;
    }
  }

  bool showCardThree() {
    if (cardOneSelected ||
        cardTwoSelected ||
        cardFourSelected ||
        cardFiveSelected ||
        cardSixSelected ||
        cardSevenSelected) {
      return false;
    } else {
      return true;
    }
  }

  bool showCardFour() {
    if (cardOneSelected ||
        cardTwoSelected ||
        cardThreeSelected ||
        cardFiveSelected ||
        cardSixSelected ||
        cardSevenSelected) {
      return false;
    } else {
      return true;
    }
  }

  bool showCardFive() {
    if (cardOneSelected ||
        cardTwoSelected ||
        cardThreeSelected ||
        cardFourSelected ||
        cardSixSelected ||
        cardSevenSelected) {
      return false;
    } else {
      return true;
    }
  }

  bool showCardSix() {
    if (cardOneSelected ||
        cardTwoSelected ||
        cardThreeSelected ||
        cardFourSelected ||
        cardFiveSelected ||
        cardSevenSelected) {
      return false;
    } else {
      return true;
    }
  }

  bool showCardSeven() {
    if (cardOneSelected ||
        cardTwoSelected ||
        cardThreeSelected ||
        cardFourSelected ||
        cardFiveSelected ||
        cardSixSelected) {
      return false;
    } else {
      return true;
    }
  }
}
