import 'dart:math';
import 'package:circle_list/circle_list.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tarot_app/global/constants.dart';
import 'package:tarot_app/global/widgets/background_blur.dart';
import 'package:tarot_app/global/widgets/reading_screen_widgets.dart';
import 'package:tarot_app/global/widgets/top_bar.dart';
import 'package:tarot_app/screens/card_reveal.dart';
import 'package:tarot_app/screens/reading_screens/single_card_formation_reading_screen_2.dart';
import 'package:tarot_app/services/size_config.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;
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

  String selectedCard = CharacterCardPath.adrasteia;
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  bool isOneRevealed = false;
  bool zoomTableTop = false;
  bool animatePedestals = false;
  bool isFormationCompleted = false;
  int formation = 0;

  String selectedCard1 = CharacterCardPath.adrasteia;
  String selectedCard2 = CharacterCardPath.earth;
  String selectedCard3 = CharacterCardPath.diana;

  bool isCardOneTapped = false;

  void getMessage() {
    print(widget.message);
  }

  @override
  void initState() {
    getMessage();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  TransformationController _transformationController =
      TransformationController();
  TransformationController _transformationController2 =
      TransformationController();

  SpringController _scaleController =
      SpringController(initialAnim: Motion.pause);
  SpringController _translateController =
      SpringController(initialAnim: Motion.pause);

  SpringController _cardOneScaleController =
      SpringController(initialAnim: Motion.pause);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // setState(() {
          //   zoomScreen = !zoomScreen;
          //   isOneRevealed = false;
          //   Future.delayed(const Duration(milliseconds: 300), () {
          //     cardKey.currentState.toggleCard();
          //   });
          // });
          // Navigator.pushNamed(context, SingleCardReadingFormation2.id);
          // if (_controller.status != AnimationStatus.completed)
          //   _controller.forward();
          // else
          //   _controller.reverse();
          // setState(() {
          //   zoomScreen = !zoomScreen;
          // });
          // if (!zoomTableTop) {
          //   // _transformationController.
          //   _transformationController.value =
          //       Matrix4.diagonal3(Vector3(1.4, 1.4, 1.0)) *
          //           Matrix4.translationValues(-55, -220, 0);
          // _transformationController2.value =
          //     Matrix4.diagonal3(Vector3(1.4, 1.4, 1.0));
          // _transformationController.alignment = FractionalOffset.center;
          // _transformationController.value =
          //     Matrix4.translationValues(100, 0, 0);

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

          print('pressed');
          // _scaleController.play(motion: Motion.play, curve: Curves.easeInOut);
          // setState(() {
          //   zoomTableTop = !zoomTableTop;
          // });
          // } else {
          //   _transformationController.value = Matrix4.identity();
          //   setState(() {
          //     zoomTableTop = false;
          //   });
          // }
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
                  TopBar(title: 'is screen zoomed? $zoomTableTop'),

                  // !zoomTableTop
                  //     ? Container(
                  //         height: SizeConfig.blockSizeVertical * 30,
                  //         child: CircleList(
                  //           origin: Offset(0, 150),
                  //           children: List.generate(
                  //             10,
                  //             (index) {
                  //               return Image.asset(ImagePath.kCardBack);
                  //               // child: Image.asset(ImagePath.kCardBack)
                  //             },
                  //           ),
                  //         ),
                  //       )
                  //     : Container(
                  //         height: SizeConfig.blockSizeVertical * 5,
                  //       ),

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
                      Container(
                        padding: EdgeInsets.only(left: 16),
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                widget.message,
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
                          SingleLight(lightSize: !zoomTableTop ? 15 : 20),
                          // Spring.scale(
                          //   start: 1,
                          //   end: isCardOneTapped ? 1.5 : 1,
                          //   springController: _cardOneScaleController,
                          //   child: AnimatedCard(
                          //     cardKey: cardKey,
                          //     onAnimateCallback: (bool value) {
                          //       print(value);
                          //       setState(() {
                          //         isCardOneTapped = value;
                          //         _cardOneScaleController.play();
                          //       });
                          //     },
                          //     alignmentX: 0,
                          //     alignmentY: zoomTableTop ? -0.20 : 0.5,
                          //   ),
                          // )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              isCardOneTapped ? BackgroundBlur() : Container(),
              AnimatedCard(
                cardKey: cardKey,
                onAnimateCallback: (bool value) {
                  setState(() {
                    isCardOneTapped = !isCardOneTapped;
                  });
                },
                alignmentX: 0,
                alignmentY: zoomTableTop ? 0.0 : 0.4,
                cardSize: !zoomTableTop ? 15 : 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FinalCard extends StatelessWidget {
  const FinalCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Center(
      child: Container(
        color: Colors.transparent,
        child: Image.asset(
          ImagePath.kCardBack,
          fit: BoxFit.fitWidth,
          height: SizeConfig.blockSizeVertical * 45,
        ),
      ),
    );
  }
}

class TableTop extends StatelessWidget {
  const TableTop({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 200,
      padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 15),
      alignment: Alignment.center,
      child: Image.asset(
        ImagePath.kTable,
        width: SizeConfig.screenWidth,
        fit: BoxFit.fill,
      ),
    );
  }
}

class SingleLight extends StatelessWidget {
  const SingleLight({Key key, this.lightSize}) : super(key: key);
  final double lightSize;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: AnimatedContainer(
        width: SizeConfig.blockSizeHorizontal * lightSize,
        duration: Duration(seconds: 1),
        child: Image.asset(
          ImagePath.kCardLightInactive,
        ),
      ),
    );
  }
}

class SingleCard extends StatelessWidget {
  const SingleCard({Key key}) : super(key: key);
  final double cardSize = 15;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Image.asset(
          ImagePath.kCardBack,
          width: SizeConfig.blockSizeHorizontal * cardSize,
        ),
      ),
    );
  }
}

class Pedestals extends StatelessWidget {
  const Pedestals({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                height: SizeConfig.blockSizeVertical * 28,
                margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 1),
                child: Image.asset(
                  ImagePath.kPedestal,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                bottom: SizeConfig.blockSizeVertical * 18,
                left: SizeConfig.blockSizeHorizontal * 7,
                child: Container(
                  // color: Colors.pink,
                  padding: EdgeInsets.all(8),
                  width: SizeConfig.blockSizeHorizontal * 18,
                  child: Image.asset(
                    ImagePath.brazier,
                    fit: BoxFit.fill,
                    // height:
                    // SizeConfig.blockSizeHorizontal * 10,
                    // width: SizeConfig.blockSizeHorizontal * 25,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: SizedBox(),
          ),
          Stack(
            children: [
              Container(
                height: SizeConfig.blockSizeVertical * 28,
                margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 1),
                child: Image.asset(
                  ImagePath.kPedestal,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                bottom: SizeConfig.blockSizeVertical * 18,
                left: SizeConfig.blockSizeHorizontal * 20,
                child: Container(
                  // color: Colors.pink,
                  padding: EdgeInsets.all(8),
                  width: SizeConfig.blockSizeHorizontal * 18,
                  child: Transform(
                    transform: Matrix4.rotationY(pi),
                    child: Image.asset(
                      ImagePath.brazier,
                      fit: BoxFit.fill,
                      // height:
                      // SizeConfig.blockSizeHorizontal * 10,
                      // width: SizeConfig.blockSizeHorizontal * 25,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
