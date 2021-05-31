import 'dart:math';

import 'package:circle_list/circle_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tarot_app/global/widgets/background_template.dart';
import 'package:tarot_app/global/constants.dart';
import 'package:tarot_app/global/widgets/top_bar.dart';
import 'package:tarot_app/screens/card_reveal.dart';
import 'package:tarot_app/services/size_config.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

enum AniProps { x, y }

class ReadingScreen extends StatefulWidget {
  const ReadingScreen({Key key}) : super(key: key);
  static final String id = 'reading_screen';
  @override
  _ReadingScreenState createState() => _ReadingScreenState();
}

class _ReadingScreenState extends State<ReadingScreen>
    with SingleTickerProviderStateMixin {
  double lightSize = 15;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    // animationController.repeat(); //just to show it can be animated
  }

  @override
  void dispose() {
    // Don't forget to dispose the animation controller on class destruction
    animationController.dispose();
    super.dispose();
  }

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

  bool animateContainer = false;

  String selectedCard = CharacterCardPath.adrasteia;

  bool isOneRevealed = false;
  bool isTwoRevealed = false;

  bool isThreeRevealed = false;
  bool isFourRevealed = false;
  bool isFiveRevealed = false;
  bool isSixRevealed = false;
  bool isSevenRevealed = false;

  String selectedCard1 = CharacterCardPath.adrasteia;
  String selectedCard2 = CharacterCardPath.earth;
  String selectedCard3 = CharacterCardPath.diana;
  String selectedCard4 = CharacterCardPath.ambael;
  String selectedCard5 = CharacterCardPath.diana;
  String selectedCard6 = CharacterCardPath.adrasteia;
  String selectedCard7 = CharacterCardPath.earth;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isOneRevealed = false;
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
              Container(
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
              Spacer(),
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
                    Container(
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

class SingleFormationTableTop extends StatelessWidget {
  const SingleFormationTableTop({Key key}) : super(key: key);

  final lightSize = 15;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Container(
            // height: 200,
            padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 15),
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              ImagePath.kTable,
              width: SizeConfig.screenWidth,
              fit: BoxFit.fill,
            ),
          ),
          // Container(
          //   alignment: Alignment.topCenter,
          //   height: SizeConfig.blockSizeVertical * 45,
          // ),
          SizedBox(
            height: SizeConfig.blockSizeVertical * 10,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Image.asset(
                ImagePath.kCardLightInactive,
                width: SizeConfig.blockSizeHorizontal * lightSize,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ThreeFormationTableTop extends StatelessWidget {
  const ThreeFormationTableTop({Key key}) : super(key: key);
  final lightSize = 15;
  @override
  Widget build(BuildContext context) {
    return Container(
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
          Container(
            // height: 200,
            padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 15),
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              ImagePath.kTable,
              width: SizeConfig.screenWidth,
              fit: BoxFit.fill,
            ),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Image.asset(
                      ImagePath.kCardLightInactive,
                      width: SizeConfig.blockSizeHorizontal * lightSize,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Image.asset(
                            ImagePath.kCardLightInactive,
                            width: SizeConfig.blockSizeHorizontal * lightSize,
                          ),
                        ),
                        SizedBox(
                          height: 2,
                          width: SizeConfig.blockSizeHorizontal * 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Image.asset(
                            ImagePath.kCardLightInactive,
                            width: SizeConfig.blockSizeHorizontal * lightSize,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SevenFormationTableTop extends StatelessWidget {
  const SevenFormationTableTop({Key key}) : super(key: key);
  final double lightSize = 15;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Container(
            // height: 200,
            padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 15),
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              ImagePath.kTable,
              width: SizeConfig.screenWidth,
              fit: BoxFit.fill,
            ),
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
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Image.asset(
                          ImagePath.kCardLightInactive,
                          width: SizeConfig.blockSizeHorizontal * lightSize,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Image.asset(
                          ImagePath.kCardLightInactive,
                          width: SizeConfig.blockSizeHorizontal * lightSize,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Image.asset(
                          ImagePath.kCardLightInactive,
                          width: SizeConfig.blockSizeHorizontal * lightSize,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Image.asset(
                          ImagePath.kCardLightInactive,
                          width: SizeConfig.blockSizeHorizontal * lightSize,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Image.asset(
                          ImagePath.kCardLightInactive,
                          width: SizeConfig.blockSizeHorizontal * lightSize,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Image.asset(
                          ImagePath.kCardLightInactive,
                          width: SizeConfig.blockSizeHorizontal * lightSize,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Image.asset(
                          ImagePath.kCardLightInactive,
                          width: SizeConfig.blockSizeHorizontal * lightSize,
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
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Image.asset(
                          ImagePath.kCardBack,
                          width: SizeConfig.blockSizeHorizontal * lightSize,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Image.asset(
                          ImagePath.kCardBack,
                          width: SizeConfig.blockSizeHorizontal * lightSize,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Image.asset(
                          ImagePath.kCardBack,
                          width: SizeConfig.blockSizeHorizontal * lightSize,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Image.asset(
                          ImagePath.kCardBack,
                          width: SizeConfig.blockSizeHorizontal * lightSize,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Image.asset(
                          ImagePath.kCardBack,
                          width: SizeConfig.blockSizeHorizontal * lightSize,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Image.asset(
                          ImagePath.kCardBack,
                          width: SizeConfig.blockSizeHorizontal * lightSize,
                        ),
                      ),
                      Hero(
                        tag: 'card1',
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Image.asset(
                            ImagePath.kCardBack,
                            width: SizeConfig.blockSizeHorizontal * lightSize,
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
    );
  }
}
