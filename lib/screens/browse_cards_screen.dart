import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tarot_app/global/background_template.dart';
import 'package:tarot_app/global/buttons/small_rounded_button.dart';
import 'package:tarot_app/global/constants.dart';
import 'package:tarot_app/global/top_bar.dart';
import 'package:tarot_app/global/widgets/menu.dart';
import 'package:tarot_app/screens/view_card.dart';
import 'package:tarot_app/services/size_config.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:tarot_app/models/character_card.dart';

class BrowseCardsScreen extends StatefulWidget {
  static final String id = '/browse_cards';
  @override
  _BrowseCardsScreenState createState() => _BrowseCardsScreenState();
}

class _BrowseCardsScreenState extends State<BrowseCardsScreen> {
  List<CharacterCard> characterCardsList1 = [
    CharacterCard(
        path: CharacterCardPath.ambael,
        description: 'some desc here for ambael',
        name: 'ambael'),
    CharacterCard(
        path: CharacterCardPath.adrasteia,
        description: 'some desc here for adrasteia',
        name: 'adrasteia'),
    CharacterCard(
        path: CharacterCardPath.diana,
        description: 'some desc here for diana',
        name: 'diana'),
    CharacterCard(
        path: CharacterCardPath.earth,
        description: 'some desc here for earth',
        name: 'earth'),
  ];
  List<CharacterCard> characterCardsList2 = [
    CharacterCard(
        path: CharacterCardPath.ambael,
        description: 'some desc here for ambael',
        name: 'ambael'),
    CharacterCard(
        path: CharacterCardPath.adrasteia,
        description: 'some desc here for adrasteia',
        name: 'adrasteia'),
    CharacterCard(
        path: CharacterCardPath.diana,
        description: 'some desc here for diana',
        name: 'diana'),
    CharacterCard(
        path: CharacterCardPath.earth,
        description: 'some desc here for earth',
        name: 'earth'),
  ];
  List<CharacterCard> characterCardsList3 = [
    CharacterCard(
        path: CharacterCardPath.ambael,
        description: 'some desc here for ambael',
        name: 'ambael'),
    CharacterCard(
        path: CharacterCardPath.adrasteia,
        description: 'some desc here for adrasteia',
        name: 'adrasteia'),
    CharacterCard(
        path: CharacterCardPath.diana,
        description: 'some desc here for diana',
        name: 'diana'),
    CharacterCard(
        path: CharacterCardPath.earth,
        description: 'some desc here for earth',
        name: 'earth'),
  ];
  List<CharacterCard> characterCardsList4 = [
    CharacterCard(
        path: CharacterCardPath.ambael,
        description: 'some desc here for ambael',
        name: 'ambael'),
    CharacterCard(
        path: CharacterCardPath.adrasteia,
        description: 'some desc here for adrasteia',
        name: 'adrasteia'),
    CharacterCard(
        path: CharacterCardPath.diana,
        description: 'some desc here for diana',
        name: 'diana'),
    CharacterCard(
        path: CharacterCardPath.earth,
        description: 'some desc here for earth',
        name: 'earth'),
  ];

  bool showCharacterCard = false;
  bool showCardInfo = false;

  double _sigmaX = 4; // from 0-10
  double _sigmaY = 4; // from 0-10
  double _opacity = 0.2; // from 0-1.0

  String swipeDirection;

  bool showSettingMenu = false;

  void toggleCardInfo() {
    setState(() {
      showCardInfo = !showCardInfo;
    });
  }

  void toggleShowCardInfo() {
    setState(() {
      showCharacterCard = false;
      showCardInfo = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Text('Debug'),
        onPressed: () {
          setState(() {
            showCharacterCard = !showCharacterCard;
          });
        },
      ),
      body: BackgroundTemplate(
        child: Stack(
          children: [
            Column(
              children: [
                TopBar(
                  title: 'Browse Cards',
                  onSettingsTapped: () {
                    setState(() {
                      showCardInfo = !showCardInfo;
                      print(showCardInfo);
                    });
                  },
                ),
                Text(
                  'welcoming_text'.tr(),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      ListView(
                        primary: false,
                        children: [
                          SizedBox(
                            height: SizeConfig.blockSizeVertical * 10,
                          ),
                          Container(
                            height: 175,
                            width: double.infinity,
                            child: Stack(
                              children: [
                                TopRack(mode: TopRackMode.rackOne),
                                CardRow(
                                  cards: characterCardsList1,
                                  onCardTapped: (CharacterCard card) {
                                    print('tapped');
                                    print(card.name);
                                  },
                                ),
                                TopVine(mode: TopVineMode.vineOne)
                              ],
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical * 2,
                          ),
                          Container(
                            height: 175,
                            width: double.infinity,
                            child: Stack(
                              children: [
                                TopRack(mode: TopRackMode.rackTwo),
                                CardRow(
                                  cards: characterCardsList2,
                                  onCardTapped: (CharacterCard card) {
                                    print(card.name);
                                  },
                                ),
                                TopVine(mode: TopVineMode.vineTwo)
                              ],
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical * 2,
                          ),
                          Container(
                            height: 175,
                            width: double.infinity,
                            child: Stack(
                              children: [
                                TopRack(mode: TopRackMode.rackOne),
                                CardRow(
                                  cards: characterCardsList3,
                                  onCardTapped: (CharacterCard card) {
                                    print(card.name);
                                  },
                                ),
                                TopVine(mode: TopVineMode.vineOne)
                              ],
                            ),
                          ),
                        ],
                      ),
                      Visibility(
                        visible: showCharacterCard,
                        child: Container(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                                sigmaX: _sigmaX, sigmaY: _sigmaY),
                            child: Container(
                              color: Colors.black.withOpacity(_opacity),
                            ),
                          ),
                        ),
                      ),
                      showCharacterCard == true
                          ? Column(
                              children: [
                                GestureDetector(
                                  child: ViewCard(
                                    card: characterCardsList1[0],
                                    showInfo: showCardInfo,
                                  ),
                                  onPanUpdate: (details) {
                                    if (details.delta.dx < 0) {
                                      swipeDirection = 'left';
                                    } else if (details.delta.dx > 0) {
                                      swipeDirection = 'right';
                                    } else if (details.delta.dy < 0) {
                                      swipeDirection = 'up';
                                    } else if (details.delta.dy > 0) {
                                      swipeDirection = 'down';
                                    }
                                  },
                                  onPanEnd: (details) {
                                    print(swipeDirection);
                                    if (swipeDirection == 'down') {
                                      toggleShowCardInfo();
                                    } else if (swipeDirection == 'left') {
                                      toggleCardInfo();
                                    }
                                  },
                                ),
                                SizedBox(
                                  height: SizeConfig.blockSizeVertical * 2,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        toggleShowCardInfo();
                                      },
                                      child: Container(
                                        width:
                                            SizeConfig.blockSizeHorizontal * 10,
                                        child:
                                            Image.asset(ImagePath.kBackButton),
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
                              ],
                            )
                          : Container(),
                      Menu(
                        showSettingMenu: showSettingMenu,
                      ),
                    ],
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

class CardRow extends StatelessWidget {
  const CardRow({Key key, @required this.cards, @required this.onCardTapped})
      : super(key: key);
  final List<CharacterCard> cards;
  final Function onCardTapped;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onCardTapped(cards[0]),
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              // color: Colors.pink,
              width: 100,
              height: 100,
              child: Image.asset(cards[0].path),
            ),
          ),
        ),
        GestureDetector(
          onTap: onCardTapped(cards[1]),
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              // color: Colors.pink,
              width: 100,
              height: 100,
              child: Image.asset(cards[1].path),
            ),
          ),
        ),
        GestureDetector(
          onTap: onCardTapped(cards[2]),
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              // color: Colors.pink,
              width: 100,
              height: 100,
              child: Image.asset(cards[2].path),
            ),
          ),
        ),
        GestureDetector(
          onTap: onCardTapped(cards[3]),
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              // color: Colors.pink,
              width: 100,
              height: 100,
              child: Image.asset(cards[3].path),
            ),
          ),
        ),
      ],
    );
  }
}

enum TopVineMode { vineOne, vineTwo }

class TopVine extends StatelessWidget {
  const TopVine({Key key, @required this.mode}) : super(key: key);
  final TopVineMode mode;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: SizeConfig.screenWidth,
        child: Image.asset(
          mode == TopVineMode.vineOne
              ? ImagePath.kCardRackTopVineOne
              : ImagePath.kCardRackTopVineTwo,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}

enum TopRackMode { rackOne, rackTwo }

class TopRack extends StatelessWidget {
  const TopRack({Key key, @required this.mode}) : super(key: key);
  final TopRackMode mode;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        child: Image.asset(
          mode == TopRackMode.rackOne
              ? ImagePath.kCardRackOne
              : ImagePath.kCardRackTwo,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
