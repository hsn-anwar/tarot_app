import 'dart:math';

import 'package:circle_list/circle_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tarot_app/global/constants.dart';
import 'package:tarot_app/global/widgets/top_bar.dart';
import 'package:tarot_app/screens/card_reveal.dart';
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

  void _navigateToCardRevealScreen(
      String cardPath, String cardIndex, bool cardRevealed) {
    print(cardRevealed);

    print(cardRevealed);

    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: Duration(seconds: 1),
        pageBuilder: (_, __, ___) => CardRevealScreen(
          card: cardPath,
          cardIndex: cardIndex,
          isRevealed: cardRevealed,
        ),
      ),
    );

    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        if (cardIndex == '1')
          isOneRevealed = true;
        else if (cardIndex == '2')
          isTwoRevealed = true;
        else if (cardIndex == '3')
          isThreeRevealed = true;
        else if (cardIndex == '4')
          isFourRevealed = true;
        else if (cardIndex == '5')
          isFiveRevealed = true;
        else if (cardIndex == '6')
          isSixRevealed = true;
        else if (cardIndex == '7') isSevenRevealed = true;
      });
    });
  }

  bool zoomScreen = false;

  void _onCardSelected() {
    if (formation == 7) {
      //TODO: Zoom screen
      setState(() {
        zoomScreen = true;
      });
    } else {
      formation++;
    }
  }

  bool animateContainer = false;

  String selectedCard = CharacterCardPath.adrasteia;

  bool isOneRevealed = false;
  bool isTwoRevealed = false;

  bool isThreeRevealed = false;
  bool isFourRevealed = false;
  bool isFiveRevealed = false;
  bool isSixRevealed = false;
  bool isSevenRevealed = false;

  bool isFormationCompleted = false;
  int formation = 0;

  String selectedCard1 = CharacterCardPath.adrasteia;
  String selectedCard2 = CharacterCardPath.earth;
  String selectedCard3 = CharacterCardPath.diana;
  String selectedCard4 = CharacterCardPath.ambael;
  String selectedCard5 = CharacterCardPath.diana;
  String selectedCard6 = CharacterCardPath.adrasteia;
  String selectedCard7 = CharacterCardPath.earth;

  List<String> words;

  void getMessage() {
    String w = widget.message.replaceAll("\n", "-");
    print(w);
    words = w.split("-");
    print(words);
  }

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
        onPressed: () {
          // setState(() {
          //   zoomScreen = !zoomScreen;
          // });
          setState(() {
            print(wordIndex);
            if (wordIndex < 6) {
              wordIndex++;
            }
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
          child: Column(
            children: [
              TopBar(title: '$isOneRevealed'),
              // Visibility(
              //   visible: !zoomScreen,
              //   child: Container(
              //     height: SizeConfig.blockSizeVertical * 30,
              //     child: CircleList(
              //       origin: Offset(0, 150),
              //       children: List.generate(
              //         10,
              //         (index) {
              //           return Image.asset(ImagePath.kCardBack);
              //           // child: Image.asset(ImagePath.kCardBack)
              //         },
              //       ),
              //     ),
              //   ),
              // ),
              Container(
                padding: EdgeInsets.only(left: 16),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      words[wordIndex],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: CustomFonts.malgun,
                      ),
                    ),
                    Text(
                      'Scroll thorough the cards and pick the \nones that call out to you',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: CustomFonts.malgun,
                      ),
                    ),
                  ],
                ),
              ),
              !zoomScreen ? Spacer() : Container(),
              Container(
                alignment: Alignment.bottomCenter,
                height: SizeConfig.blockSizeVertical * 50,
                width: double.infinity,
                child: Stack(
                  children: [
                    Positioned(
                      child: Container(
                        child: Row(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: SizeConfig.blockSizeVertical * 25,
                                  margin: EdgeInsets.only(
                                      top: SizeConfig.blockSizeVertical * 6),
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
                            Spacer(),
                            Stack(
                              children: [
                                Container(
                                  height: SizeConfig.blockSizeVertical * 25,
                                  margin: EdgeInsets.only(
                                      top: SizeConfig.blockSizeVertical * 6),
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
                    ),

                    AnimatedCrossFade(
                      firstChild: Container(
                        // height: 200,
                        padding: EdgeInsets.only(
                            top: SizeConfig.blockSizeVertical * 15),
                        alignment: Alignment.bottomCenter,
                        child: Image.asset(
                          ImagePath.kTable,
                          width: SizeConfig.screenWidth,
                          fit: BoxFit.fill,
                        ),
                      ),
                      secondChild: Container(
                        padding: EdgeInsets.only(
                            top: SizeConfig.blockSizeVertical * 15),
                        alignment: Alignment.bottomCenter,
                        child: Image.asset(
                          ImagePath.kTableZoomed,
                          width: SizeConfig.screenWidth,
                          fit: BoxFit.fill,
                        ),
                      ),
                      duration: Duration(seconds: 1),
                      crossFadeState: !zoomScreen
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                    ),
                    // Container(
                    //   alignment: Alignment.topCenter,
                    //   height: SizeConfig.blockSizeVertical * 45,
                    // ),
                    Container(
                      child: Positioned(
                        bottom: SizeConfig.blockSizeVertical * 8,
                        left: SizeConfig.blockSizeHorizontal * 16,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          // mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: SizeConfig.blockSizeVertical * 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Image.asset(
                                    !isOneRevealed
                                        ? ImagePath.kCardLightInactive
                                        : ImagePath.kCardLightActive,
                                    width: SizeConfig.blockSizeHorizontal *
                                        lightSize,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Image.asset(
                                    !isTwoRevealed
                                        ? ImagePath.kCardLightInactive
                                        : ImagePath.kCardLightActive,
                                    width: SizeConfig.blockSizeHorizontal *
                                        lightSize,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: Image.asset(
                                    !isThreeRevealed
                                        ? ImagePath.kCardLightInactive
                                        : ImagePath.kCardLightActive,
                                    width: SizeConfig.blockSizeHorizontal *
                                        lightSize,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: Image.asset(
                                    !isFourRevealed
                                        ? ImagePath.kCardLightInactive
                                        : ImagePath.kCardLightActive,
                                    width: SizeConfig.blockSizeHorizontal *
                                        lightSize,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: Image.asset(
                                    !isFiveRevealed
                                        ? ImagePath.kCardLightInactive
                                        : ImagePath.kCardLightActive,
                                    width: SizeConfig.blockSizeHorizontal *
                                        lightSize,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: Image.asset(
                                    !isSixRevealed
                                        ? ImagePath.kCardLightInactive
                                        : ImagePath.kCardLightActive,
                                    width: SizeConfig.blockSizeHorizontal *
                                        lightSize,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: Image.asset(
                                    !isSevenRevealed
                                        ? ImagePath.kCardLightInactive
                                        : ImagePath.kCardLightActive,
                                    width: SizeConfig.blockSizeHorizontal *
                                        lightSize,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: Positioned(
                        bottom: SizeConfig.blockSizeVertical * 8,
                        left: SizeConfig.blockSizeHorizontal * 16,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          // mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: SizeConfig.blockSizeVertical * 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: GestureDetector(
                                    onTap: () => _navigateToCardRevealScreen(
                                      selectedCard1,
                                      '1',
                                      isOneRevealed,
                                    ),
                                    child: Hero(
                                      tag: '1',
                                      child: Image.asset(
                                        !isOneRevealed
                                            ? ImagePath.kCardBack
                                            : selectedCard1,
                                        width: SizeConfig.blockSizeHorizontal *
                                            lightSize,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: GestureDetector(
                                    onTap: () => _navigateToCardRevealScreen(
                                      selectedCard2,
                                      '2',
                                      isTwoRevealed,
                                    ),
                                    child: Hero(
                                      tag: '2',
                                      child: Image.asset(
                                        !isTwoRevealed
                                            ? ImagePath.kCardBack
                                            : selectedCard2,
                                        width: SizeConfig.blockSizeHorizontal *
                                            lightSize,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: GestureDetector(
                                    onTap: () => _navigateToCardRevealScreen(
                                      selectedCard3,
                                      '3',
                                      isThreeRevealed,
                                    ),
                                    child: Hero(
                                      tag: '3',
                                      child: Image.asset(
                                        !isThreeRevealed
                                            ? ImagePath.kCardBack
                                            : selectedCard3,
                                        width: SizeConfig.blockSizeHorizontal *
                                            lightSize,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: GestureDetector(
                                    onTap: () => _navigateToCardRevealScreen(
                                      selectedCard4,
                                      '4',
                                      isFourRevealed,
                                    ),
                                    child: Hero(
                                      tag: '4',
                                      child: Image.asset(
                                        !isFourRevealed
                                            ? ImagePath.kCardBack
                                            : selectedCard4,
                                        width: SizeConfig.blockSizeHorizontal *
                                            lightSize,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: GestureDetector(
                                    onTap: () => _navigateToCardRevealScreen(
                                      selectedCard5,
                                      '5',
                                      isFiveRevealed,
                                    ),
                                    child: Hero(
                                      tag: '5',
                                      child: Image.asset(
                                        !isFiveRevealed
                                            ? ImagePath.kCardBack
                                            : selectedCard5,
                                        width: SizeConfig.blockSizeHorizontal *
                                            lightSize,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: GestureDetector(
                                    onTap: () => _navigateToCardRevealScreen(
                                      selectedCard6,
                                      '6',
                                      isSixRevealed,
                                    ),
                                    child: Hero(
                                      tag: '6',
                                      child: Image.asset(
                                        !isSixRevealed
                                            ? ImagePath.kCardBack
                                            : selectedCard6,
                                        width: SizeConfig.blockSizeHorizontal *
                                            lightSize,
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => _navigateToCardRevealScreen(
                                    selectedCard7,
                                    '7',
                                    isSevenRevealed,
                                  ),
                                  child: Hero(
                                    tag: '7',
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0),
                                      child: Image.asset(
                                        !isSevenRevealed
                                            ? ImagePath.kCardBack
                                            : selectedCard7,
                                        width: SizeConfig.blockSizeHorizontal *
                                            lightSize,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
