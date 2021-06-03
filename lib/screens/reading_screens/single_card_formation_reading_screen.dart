import 'dart:math';
import 'package:circle_list/circle_list.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tarot_app/global/constants.dart';
import 'package:tarot_app/global/widgets/top_bar.dart';
import 'package:tarot_app/screens/card_reveal.dart';
import 'package:tarot_app/services/size_config.dart';
import 'package:animations/animations.dart';

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
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
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
            Future.delayed(const Duration(milliseconds: 300), () {
              cardKey.currentState.toggleCard();
            });
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
          child: Stack(
            children: [
              Column(
                children: [
                  TopBar(title: 'is screen zoomed? $zoomScreen'),
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
                        Pedestals(),
                        TableTop(),
                        SingleLight(),
                        // Positioned(
                        //   bottom: SizeConfig.blockSizeVertical * 20,
                        //   left: SizeConfig.blockSizeHorizontal * 40,
                        //   child: Container(
                        //     width: SizeConfig.blockSizeHorizontal * 15,
                        //     height: SizeConfig.blockSizeHorizontal * 15,
                        //     child: OpenContainer(
                        //       closedColor: Colors.transparent,
                        //       openColor: Colors.transparent.withOpacity(1.0),
                        //       transitionType:
                        //           ContainerTransitionType.fadeThrough,
                        //       transitionDuration: Duration(seconds: 1),
                        //       closedBuilder: (_, openContainer) {
                        //         return FlipCard(
                        //           flipOnTouch: false,
                        //           front: Image.asset(ImagePath.kCardBack),
                        //           back: Image.asset(CharacterCardPath.diana),
                        //         );
                        //       },
                        //       openBuilder: (_, closeContainer) => Container(
                        //         height: 50,
                        //         width: 50,
                        //         color: Colors.red,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  )
                ],
              ),
              AnimatedAlign(
                child: AnimatedContainer(
                  width: !zoomScreen
                      ? SizeConfig.blockSizeHorizontal * 15
                      : SizeConfig.screenWidth,
                  duration: Duration(seconds: 1),
                  child: FlipCard(
                    key: cardKey,
                    flipOnTouch: false,
                    speed: 1 * 1000,
                    front: Image.asset(ImagePath.kCardBack),
                    back: Image.asset(CharacterCardPath.diana),
                  ),
                ),
                duration: Duration(seconds: 1),
                alignment: !zoomScreen ? Alignment(0, .5) : Alignment.center,
              ),
              // Positioned(
              //   bottom: SizeConfig.blockSizeVertical * 16,
              //   left: SizeConfig.blockSizeHorizontal * 40,
              //   child: AnimatedSwitcher(
              //     duration: Duration(seconds: 1),
              //     transitionBuilder:
              //         (Widget child, Animation<double> animation) {
              //       return ScaleTransition(child: child, scale: animation);
              //     },
              //     child: !zoomScreen
              //         ? SingleCard(
              //             key: ValueKey<int>(1),
              //           )
              //         : Container(
              //             key: ValueKey<int>(2),
              //             child: Image.asset(
              //               ImagePath.kCardBack,
              //               fit: BoxFit.fitWidth,
              //               height: SizeConfig.blockSizeHorizontal * 75,
              //             ),
              //           ),
              //   ),
              // ),
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
      alignment: Alignment.bottomCenter,
      child: Image.asset(
        ImagePath.kTable,
        width: SizeConfig.screenWidth,
        fit: BoxFit.fill,
      ),
    );
  }
}

class SingleLight extends StatelessWidget {
  const SingleLight({Key key}) : super(key: key);
  final double lightSize = 15;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: SizeConfig.blockSizeVertical * 16,
      left: SizeConfig.blockSizeHorizontal * 40,
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
