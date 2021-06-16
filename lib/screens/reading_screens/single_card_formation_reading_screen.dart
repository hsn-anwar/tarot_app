import 'dart:math';
import 'package:circle_list/circle_list.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tarot_app/global/constants.dart';
import 'package:tarot_app/global/widgets/background_blur.dart';
import 'package:tarot_app/global/widgets/reading_screen/animated_background.dart';
import 'package:tarot_app/global/widgets/reading_screen/deactivated_light.dart';
import 'package:tarot_app/global/widgets/reading_screen/pedestals.dart';
import 'package:tarot_app/global/widgets/reading_screen/table_top.dart';
import 'package:tarot_app/global/widgets/reading_screen/text_title.dart';
import 'package:tarot_app/global/widgets/top_bar.dart';
import 'package:tarot_app/services/size_config.dart';
import 'package:spring/spring.dart';

class SingleCardFormationScreen extends StatefulWidget {
  const SingleCardFormationScreen({Key key, this.message}) : super(key: key);
  static final String id = '/single_card_formation_screen';
  final String message;
  @override
  _SingleCardFormationScreenState createState() =>
      _SingleCardFormationScreenState();
}

class _SingleCardFormationScreenState extends State<SingleCardFormationScreen>
    with TickerProviderStateMixin {
  double lightSize = 15;
  AnimationController animationController;

  void _onCardSelected() {
    if (formation == 3) {
      //TODO: Zoom screen
      setState(() {
        zoomTableTop = true;
      });
    } else {
      formation++;
    }
  }

  bool animateContainer = false;

  String selectedCard = EnglishCharacterCardPath.adrasteia;
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  bool isOneRevealed = false;
  bool zoomTableTop = false;
  bool animatePedestals = false;
  bool isFormationCompleted = false;
  int formation = 0;

  String selectedCard1 = EnglishCharacterCardPath.adrasteia;
  String selectedCard2 = EnglishCharacterCardPath.earth;
  String selectedCard3 = EnglishCharacterCardPath.diana;

  bool isCardOneTapped = false;

  void getMessage() {}

  @override
  void initState() {
    getMessage();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  SpringController _cardFadeController1 =
      SpringController(initialAnim: Motion.pause);
  SpringController _scaleController =
      SpringController(initialAnim: Motion.pause);
  SpringController _translateController =
      SpringController(initialAnim: Motion.pause);

  SpringController _translateController2 =
      SpringController(initialAnim: Motion.pause);

  SpringController _lightFadeController =
      SpringController(initialAnim: Motion.pause);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
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
          } else {
            // _translateController2.play(motion: Motion.play);
          }
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
                        message: widget.message,
                      ),
                    ],
                  ),
                  Spacer(),
                  Spring.translate(
                    beginOffset: Offset.zero,
                    endOffset: Offset(0, -110),
                    springController: _translateController,
                    animStatus: (AnimStatus status) {},
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      height: SizeConfig.blockSizeVertical * 50,
                      width: double.infinity,
                      child: Stack(
                        children: [
                          Spring.translate(
                            beginOffset: Offset.zero,
                            endOffset: Offset(0, -50),
                            animDuration: Duration(milliseconds: 500),
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
                                animStatus: (AnimStatus status) {}),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              isCardOneTapped ? BackgroundBlur() : Container(),
              AnimatedBackground(
                alignmentX: 0,
                cardKey: cardKey,
                cardSize: !zoomTableTop ? 19 : 23,
                alignmentY: !zoomTableTop ? 0.45 : 0.11,
                cardDescription: "desc desc desc desc",
                characterImagePath: EnglishCharacterCardPath.adrasteia,
                title: widget.message,
                onAnimateCallback: (bool value) => onAnimate(value),
                showCard: true,
                isCardFocused: () {
                  return true;
                },
                springController: _cardFadeController1,
                tableTranslationController: _translateController2,
              ),
              Spring.blink(
                springController: _lightFadeController,
                startOpacity: 1,
                endOpacity: 0,
                animDuration: Duration(milliseconds: isCardOneTapped ? 700 : 0),
                animStatus: (AnimStatus _status) {
                  // if (_status == AnimStatus.completed ||
                  //     _status == AnimStatus.dismissed)
                  //   _lightFadeController.play(motion: Motion.pause);
                },
                child: SingleFormationLight(
                  alignment: !zoomTableTop
                      ? Alignment(0, 0.6)
                      : Alignment(-0.01, 0.27),
                  zoom: zoomTableTop,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void animateTableUp(bool value) {
    if (value) {
      _lightFadeController.play(motion: Motion.play);
      Future.delayed(const Duration(milliseconds: 800), () {
        setState(() {
          _translateController2.play(motion: Motion.play);
        });
      });
    } else {
      _lightFadeController.play(motion: Motion.reverse);
      _translateController2.play(motion: Motion.reverse);
    }
  }

  void onAnimate(bool value) {
    animateTableUp(value);
    setState(() {
      isCardOneTapped = value;
    });
  }
}
