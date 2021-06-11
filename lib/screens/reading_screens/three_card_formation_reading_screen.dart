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
import 'package:tarot_app/services/size_config.dart';

class ThreeCardFormationScreen extends StatefulWidget {
  const ThreeCardFormationScreen({Key key, @required this.message})
      : super(key: key);
  final String message;

  static final String id = '/three_card_formation_screen';

  @override
  _ThreeCardFormationScreenState createState() =>
      _ThreeCardFormationScreenState();
}

class _ThreeCardFormationScreenState extends State<ThreeCardFormationScreen> {
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

  SpringController _translateController2 =
      SpringController(initialAnim: Motion.pause);
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
                                springController: _scaleController,
                                child: TableTop(),
                                animStatus: (AnimStatus status) {
                                  print('scale: $status');
                                }),
                          ),
                          // SingleLight(lightSize: !zoomTableTop ? 15 : 20),
                          DeactivatedLight(
                            alignment: Alignment(0, -0.35),
                            zoom: zoomTableTop,
                          ),
                          DeactivatedLight(
                            alignment: Alignment(0.8, 0.35),
                            zoom: zoomTableTop,
                          ),
                          DeactivatedLight(
                            alignment: Alignment(-0.8, 0.35),
                            zoom: zoomTableTop,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              isCardSelected ? BackgroundBlur() : Container(),
              // !isCardSelected
              //     ? cardOne()
              //     : cardOneSelected && !cardTwoSelected && !cardThreeSelected
              //         ? cardOne()
              //         : Container(
              //             color: Colors.pink,
              //             height: 50,
              //             width: 50,
              //           ),
              // !isCardSelected
              //     ? cardTwo()
              //     : !cardOneSelected && cardTwoSelected && !cardThreeSelected
              //         ? cardTwo()
              //         : Container(
              //             color: Colors.red,
              //             height: 50,
              //             width: 50,
              //           ),
              // !isCardSelected
              //     ? cardThree()
              //     : !cardOneSelected && !cardTwoSelected && cardThreeSelected
              //         ? cardThree()
              //         : Container(
              //             color: Colors.green,
              //             height: 50,
              //             width: 50,
              //           ),
              AnimatedBackground(
                alignmentX: 0,
                alignmentY: !zoomTableTop ? 0.23 : -0.1,
                cardKey: cardKey1,
                cardSize: !zoomTableTop ? 15 : 20,
                cardDescription: "desc desc desc desc",
                characterImagePath: CharacterCardPath.adrasteia,
                title: cardOneSelected ? words[0] : '',
                onAnimateCallback: (bool value) => onCardOneTapped(value),
                showCard: cardTwoSelected || cardThreeSelected ? false : true,
              ),
              AnimatedBackground(
                alignmentX: !zoomTableTop ? -0.8 : -0.8,
                alignmentY: !zoomTableTop ? 0.56 : 0.2,
                cardKey: cardKey2,
                cardSize: !zoomTableTop ? 15 : 20,
                cardDescription: "desc desc desc desc",
                characterImagePath: CharacterCardPath.earth,
                title: cardTwoSelected ? words[1] : '',
                onAnimateCallback: (bool value) => onCardTwoTapped(value),
                showCard: cardOneSelected || cardThreeSelected ? false : true,
              ),
              AnimatedBackground(
                alignmentX: !zoomTableTop ? 0.8 : 0.8,
                alignmentY: !zoomTableTop ? 0.56 : 0.2,
                cardKey: cardKey3,
                cardSize: !zoomTableTop ? 15 : 20,
                cardDescription: "desc desc desc desc",
                characterImagePath: CharacterCardPath.ambael,
                title: cardThreeSelected ? words[2] : '',
                onAnimateCallback: (bool value) => onCardThreeTapped(value),
                showCard: cardOneSelected || cardTwoSelected ? false : true,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onCardOneTapped(bool value) {
    if (value) {
      Future.delayed(const Duration(milliseconds: 800), () {
        setState(() {
          _translateController2.play(motion: Motion.play);
        });
      });
    } else {
      _translateController2.play(motion: Motion.reverse);
    }
    print('card 1 tapped');
    print('oldValue: $cardOneSelected');
    setState(() {
      isCardSelected = value;
      cardOneSelected = value;
      cardTwoSelected = false;
      cardThreeSelected = false;
    });
    print('cardOneStatus: $cardOneSelected');
  }

  void onCardTwoTapped(bool value) {
    if (value) {
      Future.delayed(const Duration(milliseconds: 800), () {
        setState(() {
          _translateController2.play(motion: Motion.play);
        });
      });
    } else {
      _translateController2.play(motion: Motion.reverse);
    }
    print('card  2 tapped');
    print('cardOneStatus: $cardTwoSelected');
    setState(() {
      isCardSelected = value;
      cardOneSelected = false;
      cardTwoSelected = value;
      cardThreeSelected = false;
    });

    print('cardOneStatus: $cardTwoSelected');
  }

  void onCardThreeTapped(bool value) {
    print('cardOneStatus: $cardThreeSelected');
    if (value) {
      Future.delayed(const Duration(milliseconds: 800), () {
        setState(() {
          _translateController2.play(motion: Motion.play);
        });
      });
    } else {
      _translateController2.play(motion: Motion.reverse);
    }
    print('card 3 tapped');
    setState(() {
      isCardSelected = value;
      cardOneSelected = false;
      cardTwoSelected = false;
      cardThreeSelected = value;
    });
    print('cardOneStatus: $cardThreeSelected');
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

  Widget cardOne() {
    return AnimatedBackground(
      alignmentX: 0,
      alignmentY: !zoomTableTop ? 0.23 : -0.1,
      cardKey: cardKey1,
      cardSize: !zoomTableTop ? 15 : 20,
      cardDescription: "desc desc desc desc",
      characterImagePath: CharacterCardPath.adrasteia,
      title: cardOneSelected ? words[0] : '',
      onAnimateCallback: (bool value) => onCardOneTapped(value),
      showCard: true,
    );
  }

  Widget cardTwo() {
    return AnimatedBackground(
      alignmentX: !zoomTableTop ? -0.8 : -0.8,
      alignmentY: !zoomTableTop ? 0.56 : 0.2,
      cardKey: cardKey2,
      cardSize: !zoomTableTop ? 15 : 20,
      cardDescription: "desc desc desc desc",
      characterImagePath: CharacterCardPath.earth,
      title: cardTwoSelected ? words[1] : '',
      onAnimateCallback: (bool value) => onCardTwoTapped(value),
      showCard: true,
    );
  }

  Widget cardThree() {
    return AnimatedBackground(
      alignmentX: !zoomTableTop ? 0.8 : 0.8,
      alignmentY: !zoomTableTop ? 0.56 : 0.2,
      cardKey: cardKey3,
      cardSize: !zoomTableTop ? 15 : 20,
      cardDescription: "desc desc desc desc",
      characterImagePath: CharacterCardPath.ambael,
      title: cardThreeSelected ? words[2] : '',
      onAnimateCallback: (bool value) => onCardThreeTapped(value),
      showCard: true,
    );
  }
}
