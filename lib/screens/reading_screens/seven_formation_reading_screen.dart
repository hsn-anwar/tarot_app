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

  GlobalKey<FlipCardState> cardKey1 = GlobalKey<FlipCardState>();
  GlobalKey<FlipCardState> cardKey2 = GlobalKey<FlipCardState>();
  GlobalKey<FlipCardState> cardKey3 = GlobalKey<FlipCardState>();

  List<String> words = [];
  int wordIndex = 0;

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
                              end: 1.2,
                              springController: _scaleController,
                              child: Pedestals(),
                            ),
                          ),
                          Spring.scale(
                              start: 1,
                              end: 1.5,
                              springController: _scaleController,
                              child: TableTop(),
                              animStatus: (AnimStatus status) {
                                print('scale: $status');
                              }),
                          // SingleLight(lightSize: !zoomTableTop ? 15 : 20),
                          // First Row
                          // Left --> Right
                          DeactivatedLight(
                            alignment: !zoomTableTop
                                ? Alignment(-0.4, -0.3)
                                : Alignment(-0.5, -0.5),
                            zoom: zoomTableTop,
                          ),
                          DeactivatedLight(
                            alignment: !zoomTableTop
                                ? Alignment(0.4, -0.3)
                                : Alignment(0.5, -0.5),
                            zoom: zoomTableTop,
                          ),
                          // Second Row
                          // Right --> Left
                          DeactivatedLight(
                            alignment: !zoomTableTop
                                ? Alignment(0.7, 0.15)
                                : Alignment(1, 0.2),
                            zoom: zoomTableTop,
                          ),
                          DeactivatedLight(
                            alignment: !zoomTableTop
                                ? Alignment(0.0, 0.15)
                                : Alignment(0.0, 0.2),
                            zoom: zoomTableTop,
                          ),
                          DeactivatedLight(
                            alignment: !zoomTableTop
                                ? Alignment(-0.7, 0.15)
                                : Alignment(-1, 0.2),
                            zoom: zoomTableTop,
                          ),
                          // Third Row
                          // Left --> Right
                          DeactivatedLight(
                            alignment: !zoomTableTop
                                ? Alignment(-0.4, 0.56)
                                : Alignment(-0.5, 0.9),
                            zoom: zoomTableTop,
                          ),
                          DeactivatedLight(
                            alignment: !zoomTableTop
                                ? Alignment(0.4, 0.56)
                                : Alignment(0.5, 0.9),
                            zoom: zoomTableTop,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              isCardSelected ? BackgroundBlur() : Container(),
              AnimatedBackground(
                alignmentX: !zoomTableTop ? -0.39 : -0.5,
                alignmentY: !zoomTableTop ? 0.27 : -0.19,
                cardKey: cardKey1,
                cardSize: !zoomTableTop ? 11 : 15,
                cardDescription: "desc desc desc desc",
                characterImagePath: CharacterCardPath.adrasteia,
                title: cardOneSelected ? words[0] : '',
                onAnimateCallback: (bool value) => onCardOneTapped(value),
              ),
              AnimatedBackground(
                alignmentX: !zoomTableTop ? 0.39 : 0.5,
                alignmentY: !zoomTableTop ? 0.27 : -0.19,
                cardKey: cardKey2,
                cardSize: !zoomTableTop ? 11 : 15,
                cardDescription: "desc desc desc desc",
                characterImagePath: CharacterCardPath.earth,
                title: cardTwoSelected ? words[1] : '',
                onAnimateCallback: (bool value) => onCardTwoTapped(value),
              ),
              // AnimatedBackground(
              //   alignmentX: !zoomTableTop ? 0.8 : 0.8,
              //   alignmentY: !zoomTableTop ? 0.56 : 0.2,
              //   cardKey: cardKey3,
              //   cardSize: !zoomTableTop ? 15 : 20,
              //   cardDescription: "desc desc desc desc",
              //   characterImagePath: CharacterCardPath.ambael,
              //   title: cardThreeSelected ? words[2] : '',
              //   onAnimateCallback: (bool value) => onCardThreeTapped(value),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  void onCardOneTapped(bool value) {
    print('card 1 tapped');
    setState(() {
      isCardSelected = value;
      cardOneSelected = value;
      cardTwoSelected = false;
      cardThreeSelected = false;
    });
  }

  void onCardTwoTapped(bool value) {
    print('card  2 tapped');
    setState(() {
      isCardSelected = value;
      cardOneSelected = false;
      cardTwoSelected = value;
      cardThreeSelected = false;
    });
  }

  void onCardThreeTapped(bool value) {
    print('card 3 tapped');
    setState(() {
      isCardSelected = value;
      cardOneSelected = false;
      cardTwoSelected = false;
      cardThreeSelected = value;
    });
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
}
