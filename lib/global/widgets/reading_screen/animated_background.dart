import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:spring/spring.dart';
import 'package:tarot_app/global/buttons/small_rounded_button.dart';
import 'package:tarot_app/services/size_config.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../constants.dart';

class AnimatedBackground extends StatefulWidget {
  const AnimatedBackground({
    Key key,
    @required this.cardKey,
    @required this.alignmentX,
    @required this.alignmentY,
    @required this.cardSize,
    @required this.onAnimateCallback,
    this.cardDescription,
    this.characterImagePath,
    this.title,
    @required this.showCard,
    @required this.isCardFocused,
    @required this.springController,
  }) : super(key: key);
  final GlobalKey<FlipCardState> cardKey;
  final double alignmentX;
  final double alignmentY;
  final double cardSize;
  final Function onAnimateCallback;
  final Function isCardFocused;
  final SpringController springController;

  final String cardDescription;
  final String characterImagePath;
  final String title;

  final bool showCard;

  @override
  _AnimatedBackgroundState createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground> {
  bool showButtons = false;
  bool showCardInfo = false;
  SpringController _opacityController =
      SpringController(initialAnim: Motion.pause);

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

  void unFocusCard() {
    _opacityController.play(motion: Motion.reverse);
    setState(() {
      showTitle = false;
      showButtons = false;
      showCardInfo = false;
      animateCard = false;
      widget.onAnimateCallback(animateCard);
    });
  }

  @override
  void initState() {
    super.initState();
  }

  bool animateCard = false;
  bool isCardRevealed = false;

  bool showTitle = false;

  bool swipeDownFlag = true;
  bool swipeLeftFlag = false;
  bool swipeRightFlag = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return WillPopScope(
      onWillPop: () async {
        if (animateCard) {
          unFocusCard();
          return false;
        } else
          return true;
      },
      child: Spring.blink(
        springController: widget.springController,
        startOpacity: 1,
        endOpacity: 0,
        animStatus: (AnimStatus _status) {
          if (_status == AnimStatus.completed ||
              _status == AnimStatus.dismissed) {
            widget.springController.play(motion: Motion.pause);
          }
        },
        animDuration: Duration(milliseconds: !widget.isCardFocused() ? 700 : 0),
        child: Container(
            height: widget.showCard
                ? SizeConfig.screenHeight
                : SizeConfig.screenHeight,
            width: widget.showCard
                ? SizeConfig.screenWidth
                : SizeConfig.screenWidth,
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
                            print(_status);
                            if (_status == AnimStatus.completed) {
                              _opacityController.play(motion: Motion.pause);
                            }
                          },
                          child: Visibility(
                            visible: showTitle,
                            child: Container(
                              width: SizeConfig.screenWidth,
                              child: Text(
                                widget.title,
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                style: TextStyle(
                                  fontSize: 26,
                                  color: Colors.white,
                                  fontFamily: CustomFonts.baskvill,
                                ),
                              ),
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
                      : SizeConfig.blockSizeVertical * 5,
                  child: Visibility(
                    visible: showButtons,
                    child: Container(
                      width: SizeConfig.screenWidth,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: unFocusCard,
                            child: Container(
                              width: SizeConfig.blockSizeHorizontal * 10,
                              child: Image.asset(ImagePath.kBackButton),
                            ),
                          ),
                          SizedBox(
                            width: SizeConfig.blockSizeHorizontal * 5,
                          ),
                          RoundedButton2(
                            title: showCardInfo == false
                                ? "read".tr()
                                : "hide".tr(),
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
                        : SizeConfig.screenHeight >= 780
                            ? SizeConfig.screenHeight
                            : SizeConfig.blockSizeHorizontal * 85,
                    duration: Duration(seconds: 1),
                    child: GestureDetector(
                      onHorizontalDragEnd: (details) {
                        swipeRightFlag = true;
                        swipeLeftFlag = true;
                      },
                      onHorizontalDragUpdate: (details) {
                        // Note: Sensitivity is integer used when you don't want to mess up vertical drag
                        int sensitivity = 0;
                        if (details.delta.dx > sensitivity && swipeRightFlag) {
                          print('swipe right');
                          swipeRightFlag = false;
                          setState(() {
                            showCardInfo = false;
                          });
                        } else if (details.delta.dx < -sensitivity &&
                            swipeLeftFlag) {
                          swipeLeftFlag = false;

                          print('swipe left');
                          setState(() {
                            showCardInfo = true;
                          });
                        }
                      },
                      onVerticalDragEnd: (details) {
                        swipeDownFlag = true;
                      },
                      onVerticalDragUpdate: (details) {
                        int sensitivity = 0;
                        if (details.delta.dy > sensitivity && swipeDownFlag) {
                          // _opacityController.play(motion: Motion.reverse);
                          swipeDownFlag = false;
                          _opacityController.play(motion: Motion.reverse);
                          setState(() {
                            showTitle = false;
                            showButtons = false;
                            showCardInfo = false;
                            animateCard = false;
                          });
                          // widget.tableTranslationController.play(motion: Motion.reverse);
                          widget.onAnimateCallback(animateCard);
                        } else if (details.delta.dy < -sensitivity) {
                          // Up Swipe
                        }
                      },
                      onTap: () {
                        setState(() {
                          if (!animateCard) {
                            animateCard = true;
                            showTitle = true;
                            if (animateCard) initializeScreen();
                            _opacityController.play(motion: Motion.play);
                            widget.onAnimateCallback(animateCard);
                            if (!isCardRevealed) {
                              Future.delayed(const Duration(milliseconds: 300),
                                  () {
                                widget.cardKey.currentState.toggleCard();
                                isCardRevealed = true;
                              });
                            }
                          } else {
                            print(SizeConfig.screenHeight);
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

                                // width: SizeConfig.screenWidth,
                              )
                            : Image.asset(
                                widget.characterImagePath,
                                // width: SizeConfig.screenWidth,
                              ),
                        back: Image.asset(
                          widget.characterImagePath,
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
                      : Alignment(0, -0.25),
                ),
                Visibility(
                  visible: showCardInfo,
                  child: Align(
                    alignment: Alignment(0, -0.25),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment(0, -0.25),
                          child: IgnorePointer(
                            child: Image.asset(
                              ImagePath.kCardReadingOverlay,
                              height: SizeConfig.blockSizeVertical * 75,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: SizeConfig.blockSizeHorizontal * 25,
                  top: SizeConfig.blockSizeVertical * 20,
                  child: Visibility(
                    visible: showCardInfo,
                    child: Container(
                      width: SizeConfig.blockSizeHorizontal * 50,
                      child: Center(
                        child: Text(
                          widget.cardDescription,
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
            )),
      ),
    );
  }
}
