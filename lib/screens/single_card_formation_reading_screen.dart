import 'dart:math';
import 'package:circle_list/circle_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tarot_app/global/constants.dart';
import 'package:tarot_app/global/widgets/top_bar.dart';
import 'package:tarot_app/screens/card_reveal.dart';
import 'package:tarot_app/services/size_config.dart';

class SingleCardFormationScreen extends StatefulWidget {
  const SingleCardFormationScreen({Key key}) : super(key: key);
  static final String id = '/single_card_formation_screen';
  @override
  _SingleCardFormationScreenState createState() =>
      _SingleCardFormationScreenState();
}

class _SingleCardFormationScreenState extends State<SingleCardFormationScreen>
    with TickerProviderStateMixin {
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
        else if (cardIndex == '3') isThreeRevealed = true;
      });
    });
  }

  bool zoomScreen = false;

  void _onCardSelected() {
    if (formation == 3) {
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

  bool isFormationCompleted = false;
  int formation = 0;

  String selectedCard1 = CharacterCardPath.adrasteia;
  String selectedCard2 = CharacterCardPath.earth;
  String selectedCard3 = CharacterCardPath.diana;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            zoomScreen = !zoomScreen;
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
              Visibility(
                visible: !zoomScreen,
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
              !zoomScreen
                  ? Spacer()
                  : SizedBox(
                      height: SizeConfig.blockSizeVertical * 7,
                    ),
              Container(
                color: Colors.red,
                alignment: Alignment.bottomCenter,
                height: SizeConfig.blockSizeVertical * 75,
                width: double.infinity,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        // color: Colors.pink,
                        width: double.infinity,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  color: Colors.green,
                                  height: SizeConfig.blockSizeVertical * 25,
                                  margin: EdgeInsets.only(
                                      top: SizeConfig.blockSizeVertical * 6),
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
                                  margin: EdgeInsets.only(
                                      top: SizeConfig.blockSizeVertical * 6),
                                  child: Image.asset(
                                    ImagePath.kPedestal,
                                    fit: BoxFit.fitHeight,
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
                    AnimatedSwitcher(
                        duration: Duration(seconds: 1),
                        transitionBuilder:
                            (Widget child, Animation<double> animation) {
                          return ScaleTransition(
                            scale: animation,
                            child: child,
                          );
                        },
                        child: Container(
                          height: SizeConfig.blockSizeVertical * 50,
                          child: !zoomScreen
                              ? Container(
                                  // height: 200,
                                  key: ValueKey<int>(2),
                                  padding: EdgeInsets.only(
                                      top: SizeConfig.blockSizeVertical * 15),
                                  alignment: Alignment.bottomCenter,
                                  child: Image.asset(
                                    ImagePath.kTable,
                                    width: SizeConfig.screenWidth,
                                    fit: BoxFit.fill,
                                  ),
                                )
                              : Container(
                                  key: ValueKey<int>(1),
                                  padding: EdgeInsets.only(
                                      top: SizeConfig.blockSizeVertical * 15),
                                  alignment: Alignment.bottomCenter,
                                  child: Image.asset(
                                    ImagePath.kTableZoomed,
                                    width: SizeConfig.screenWidth,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                        )),
                    // Positioned(
                    //   bottom: SizeConfig.blockSizeVertical * 16,
                    //   left: SizeConfig.blockSizeHorizontal * 40,
                    //   child: Padding(
                    //     padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    //     child: Image.asset(
                    //       ImagePath.kCardLightInactive,
                    //       width: SizeConfig.blockSizeHorizontal * lightSize,
                    //     ),
                    //   ),
                    // ),
                    // Positioned(
                    //   bottom: SizeConfig.blockSizeVertical * 20,
                    //   left: SizeConfig.blockSizeHorizontal * 40,
                    //   child: Padding(
                    //     padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    //     child: Image.asset(
                    //       ImagePath.kCardBack,
                    //       width: SizeConfig.blockSizeHorizontal * lightSize,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
