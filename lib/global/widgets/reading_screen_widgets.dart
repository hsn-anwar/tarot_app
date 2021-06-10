import 'dart:math';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spring/spring.dart';
import 'package:tarot_app/global/buttons/small_rounded_button.dart';
import 'package:tarot_app/services/size_config.dart';
import 'package:easy_localization/easy_localization.dart';
import '../constants.dart';

class ZoomedTableTop extends StatelessWidget {
  const ZoomedTableTop({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 200,
      padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 15),
      alignment: Alignment.bottomCenter,
      child: Image.asset(
        ImagePath.kTableZoomed,
        width: SizeConfig.screenWidth,
        fit: BoxFit.fill,
      ),
    );
  }
}

class ZoomedPedestals extends StatelessWidget {
  const ZoomedPedestals({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Container(
        child: Row(
          children: [
            Stack(
              children: [
                Container(
                  height: SizeConfig.blockSizeVertical * 25,
                  margin:
                      EdgeInsets.only(top: SizeConfig.blockSizeVertical * 6),
                  child: Image.asset(
                    ImagePath.kPedestal,
                    fit: BoxFit.fitHeight,
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
            Spacer(),
            Stack(
              children: [
                Container(
                  height: SizeConfig.blockSizeVertical * 25,
                  margin:
                      EdgeInsets.only(top: SizeConfig.blockSizeVertical * 6),
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
      ),
    );
  }
}

class SingleLight extends StatelessWidget {
  const SingleLight({Key key, @required this.bottom, @required this.left})
      : super(key: key);
  final double lightSize = 15;
  final double bottom;
  final double left;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: SizeConfig.blockSizeVertical * bottom,
      left: SizeConfig.blockSizeHorizontal * left,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Image.asset(
          ImagePath.kCardLightInactive,
          width: SizeConfig.blockSizeHorizontal * lightSize,
        ),
      ),
    );
  }
}

class AnimatedCard extends StatefulWidget {
  const AnimatedCard({
    Key key,
    @required this.cardKey,
    @required this.onAnimateCallback,
    @required this.alignmentX,
    @required this.alignmentY,
    this.cardSize,
  }) : super(key: key);
  final GlobalKey<FlipCardState> cardKey;
  final Function onAnimateCallback;
  // final Function toggleDetailsCallback;
  // final Function closeCardCallback;
  final double alignmentX;
  final double alignmentY;
  final double cardSize;
  @override
  _AnimatedCardState createState() => _AnimatedCardState();
}

class _AnimatedCardState extends State<AnimatedCard> {
  bool animateCard = false;
  bool isCardRevealed = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedAlign(
      child: AnimatedContainer(
        width: !animateCard
            ? SizeConfig.blockSizeHorizontal * widget.cardSize
            : SizeConfig.screenWidth,
        duration: Duration(seconds: 1),
        child: GestureDetector(
          onTap: () {
            setState(() {
              print('tapped');
              animateCard = !animateCard;
              widget.onAnimateCallback(animateCard);

              if (!isCardRevealed) {
                Future.delayed(const Duration(milliseconds: 300), () {
                  widget.cardKey.currentState.toggleCard();
                  isCardRevealed = true;
                });
              }
            });
          },
          child: FlipCard(
            key: widget.cardKey,
            flipOnTouch: false,
            speed: 1 * 1000,
            front: !isCardRevealed
                ? Image.asset(
                    ImagePath.kCardBack,
                    width: SizeConfig.screenWidth,
                  )
                : Image.asset(
                    CharacterCardPath.diana,
                    width: SizeConfig.screenWidth,
                  ),
            back: Image.asset(
              CharacterCardPath.diana,
              width: SizeConfig.screenWidth,
            ),
          ),
        ),
      ),
      duration: Duration(seconds: 1),
      alignment: !animateCard
          ? Alignment(
              widget.alignmentX,
              widget.alignmentY,
            )
          : Alignment.center,
    );
  }
}

class CardBackground extends StatefulWidget {
  const CardBackground(
      {Key key,
      @required this.cardKey,
      @required this.alignmentX,
      @required this.alignmentY,
      @required this.cardSize,
      @required this.onAnimateCallback})
      : super(key: key);
  final GlobalKey<FlipCardState> cardKey;
  final double alignmentX;
  final double alignmentY;
  final double cardSize;
  final Function onAnimateCallback;

  @override
  _CardBackgroundState createState() => _CardBackgroundState();
}

class _CardBackgroundState extends State<CardBackground> {
  bool showButtons = false;
  bool showCardInfo = false;

  void toggleShowCardInfo() {
    setState(() {
      showCardInfo = !showCardInfo;
    });
  }

  void toggleCardInfo() {
    setState(() {
      showCardInfo = !showCardInfo;
    });
  }

  void initializeScreen() {
    Future.delayed(const Duration(milliseconds: 1100), () {
      if (mounted)
        setState(() {
          showButtons = true;
        });
    });
  }

  @override
  void initState() {
    super.initState();
  }

  bool animateCard = false;
  bool isCardRevealed = false;
  SpringController _opacityController =
      SpringController(initialAnim: Motion.pause);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return WillPopScope(
      onWillPop: () async {
        setState(() {
          showButtons = false;
          showCardInfo = false;
        });
        return false;
      },
      child: Container(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: SizeConfig.blockSizeVertical * 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spring.opacity(
                      startOpacity: 0.0,
                      endOpacity: 1,
                      animDuration: Duration(seconds: 1),
                      springController: _opacityController,
                      animStatus: (AnimStatus _status) {
                        if (_status == AnimStatus.completed) {
                          _opacityController.play(motion: Motion.pause);
                        }
                      },
                      child: Text(
                        'Body',
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                          fontFamily: CustomFonts.baskvill,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            AnimatedPositioned(
              bottom: !showButtons
                  ? SizeConfig.blockSizeVertical * 15
                  : SizeConfig.blockSizeVertical * 6,
              child: Visibility(
                visible: showButtons,
                child: Container(
                  width: SizeConfig.screenWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            showButtons = false;
                            showCardInfo = false;
                            animateCard = false;
                            _opacityController.play(motion: Motion.reverse);
                            widget.onAnimateCallback(animateCard);
                          });
                        },
                        child: Container(
                          width: SizeConfig.blockSizeHorizontal * 10,
                          child: Image.asset(ImagePath.kBackButton),
                        ),
                      ),
                      SizedBox(
                        width: SizeConfig.blockSizeHorizontal * 5,
                      ),
                      RoundedButton2(
                        title:
                            showCardInfo == false ? "read".tr() : "hide".tr(),
                        onTap: toggleCardInfo,
                      ),
                    ],
                  ),
                ),
              ),
              duration: Duration(milliseconds: 850),
            ),
            AnimatedAlign(
              child: AnimatedContainer(
                width: !animateCard
                    ? SizeConfig.blockSizeHorizontal * widget.cardSize
                    : SizeConfig.screenWidth,
                duration: Duration(seconds: 1),
                child: GestureDetector(
                  onHorizontalDragUpdate: (details) {
                    // Note: Sensitivity is integer used when you don't want to mess up vertical drag
                    int sensitivity = 0;
                    if (details.delta.dx > sensitivity) {
                      print('swipe right');
                      setState(() {
                        showCardInfo = false;
                      });
                    } else if (details.delta.dx < -sensitivity) {
                      print('swipe left');
                      setState(() {
                        showCardInfo = true;
                      });
                    }
                  },
                  onVerticalDragUpdate: (details) {
                    int sensitivity = 0;
                    if (details.delta.dy > sensitivity) {
                      print('swipe down');
                      setState(() {
                        showButtons = false;
                        showCardInfo = false;
                        animateCard = false;
                        _opacityController.play(motion: Motion.reverse);
                        widget.onAnimateCallback(animateCard);
                      });
                    } else if (details.delta.dy < -sensitivity) {
                      // Up Swipe
                    }
                  },
                  onTap: () {
                    setState(() {
                      if (!animateCard) {
                        print('tapped');
                        animateCard = true;
                        if (animateCard) initializeScreen();
                        _opacityController.play(motion: Motion.play);
                        widget.onAnimateCallback(animateCard);
                        if (!isCardRevealed) {
                          Future.delayed(const Duration(milliseconds: 300), () {
                            widget.cardKey.currentState.toggleCard();
                            isCardRevealed = true;
                          });
                        }
                      }
                    });
                  },
                  child: FlipCard(
                    key: widget.cardKey,
                    flipOnTouch: false,
                    speed: 1 * 1000,
                    front: !isCardRevealed
                        ? Image.asset(
                            ImagePath.kCardBack,
                            width: SizeConfig.screenWidth,
                          )
                        : Image.asset(
                            CharacterCardPath.diana,
                            width: SizeConfig.screenWidth,
                          ),
                    back: Image.asset(
                      CharacterCardPath.diana,
                      width: SizeConfig.screenWidth,
                    ),
                  ),
                ),
              ),
              duration: Duration(seconds: 1),
              alignment: !animateCard
                  ? Alignment(
                      widget.alignmentX,
                      widget.alignmentY,
                    )
                  : Alignment.center,
            ),
            Visibility(
              visible: showCardInfo,
              child: Center(
                child: Stack(
                  children: [
                    Center(
                      child: Image.asset(
                        ImagePath.kCardReadingOverlay,
                        height: SizeConfig.blockSizeVertical * 75,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: SizeConfig.blockSizeHorizontal * 25,
              top: SizeConfig.blockSizeVertical * 27,
              child: Visibility(
                visible: showCardInfo,
                child: Container(
                  width: SizeConfig.blockSizeHorizontal * 50,
                  child: Center(
                    child: Text(
                      'asklndjoas as jibawio fqwohidjkqw foiqwhfj o',
                      style: TextStyle(
                        fontFamily: CustomFonts.malgun,
                        // color: Colors.white,
                        fontSize: SizeConfig.blockSizeHorizontal * 4,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // widget.animatedCard,
          ],
        ),
      ),
    );
  }
}
