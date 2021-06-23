import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tarot_app/global/widgets/background_template.dart';
import 'package:tarot_app/global/buttons/setting_button.dart';
import 'package:tarot_app/global/buttons/small_rounded_button.dart';
import 'package:tarot_app/global/constants.dart';
import 'package:tarot_app/global/widgets/top_bar.dart';
import 'package:tarot_app/global/widgets/menu.dart';
import 'package:tarot_app/screens/card_view.dart';
import 'package:tarot_app/screens/view_card.dart';
import 'package:tarot_app/services/size_config.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:tarot_app/models/character_card.dart';
import 'package:flip_card/flip_card.dart';

class BrowseCardsScreen extends StatefulWidget {
  static final String id = '/browse_cards';
  @override
  _BrowseCardsScreenState createState() => _BrowseCardsScreenState();
}

class _BrowseCardsScreenState extends State<BrowseCardsScreen> {
  List<CharacterCard> characterCardsList1 = [
    CharacterCard(
        path: EnglishCharacterCardPath.ambael,
        description: "ambael_desc".tr(),
        name: 'ambael'),
    CharacterCard(
        path: EnglishCharacterCardPath.adrasteia,
        description: 'adrasteia_desc'.tr(),
        name: 'adrasteia'),
    CharacterCard(
        path: EnglishCharacterCardPath.diana,
        description: 'diana_desc'.tr(),
        name: 'diana'),
    CharacterCard(
        path: EnglishCharacterCardPath.earth,
        description: 'earth_desc'.tr(),
        name: 'earth'),
  ];
  List<CharacterCard> characterCardsList2 = [
    CharacterCard(
        path: EnglishCharacterCardPath.ambael,
        description: "ambael_desc".tr(),
        name: 'ambael1'),
    CharacterCard(
        path: EnglishCharacterCardPath.adrasteia,
        description: 'adrasteia_desc'.tr(),
        name: 'adrasteia1'),
    CharacterCard(
        path: EnglishCharacterCardPath.diana,
        description: 'diana_desc'.tr(),
        name: 'diana1'),
    CharacterCard(
        path: EnglishCharacterCardPath.earth,
        description: 'earth_desc'.tr(),
        name: 'earth1'),
  ];
  List<CharacterCard> characterCardsList3 = [
    CharacterCard(
        path: EnglishCharacterCardPath.ambael,
        description: "ambael_desc".tr(),
        name: 'ambael2'),
    CharacterCard(
        path: EnglishCharacterCardPath.adrasteia,
        description: 'adrasteia_desc'.tr(),
        name: 'adrasteia2'),
    CharacterCard(
        path: EnglishCharacterCardPath.diana,
        description: 'diana_desc'.tr(),
        name: 'diana2'),
    CharacterCard(
        path: EnglishCharacterCardPath.earth,
        description: 'earth_desc'.tr(),
        name: 'earth2'),
  ];
  List<CharacterCard> characterCardsList4 = [
    CharacterCard(
        path: EnglishCharacterCardPath.ambael,
        description: "ambael_desc".tr(),
        name: 'ambael3'),
    CharacterCard(
        path: EnglishCharacterCardPath.adrasteia,
        description: 'adrasteia_desc'.tr(),
        name: 'adrasteia3'),
    CharacterCard(
        path: EnglishCharacterCardPath.diana,
        description: 'diana_desc'.tr(),
        name: 'diana3'),
    CharacterCard(
        path: EnglishCharacterCardPath.earth,
        description: 'earth_desc'.tr(),
        name: 'earth3'),
  ];
  List<CharacterCard> characterCardsList5 = [
    CharacterCard(
        path: EnglishCharacterCardPath.ambael,
        description: "ambael_desc".tr(),
        name: 'ambael4'),
    CharacterCard(
        path: EnglishCharacterCardPath.adrasteia,
        description: 'adrasteia_desc'.tr(),
        name: 'adrasteia4'),
    CharacterCard(
        path: EnglishCharacterCardPath.diana,
        description: 'diana_desc'.tr(),
        name: 'diana4'),
    CharacterCard(
        path: EnglishCharacterCardPath.earth,
        description: 'earth_desc'.tr(),
        name: 'earth4'),
  ];
  List<CharacterCard> characterCardsList6 = [
    CharacterCard(
        path: EnglishCharacterCardPath.ambael,
        description: "ambael_desc".tr(),
        name: 'ambael5'),
    CharacterCard(
        path: EnglishCharacterCardPath.adrasteia,
        description: 'adrasteia_desc'.tr(),
        name: 'adrasteia5'),
    CharacterCard(
        path: EnglishCharacterCardPath.diana,
        description: 'diana_desc'.tr(),
        name: 'diana5'),
    CharacterCard(
        path: EnglishCharacterCardPath.earth,
        description: 'earth_desc'.tr(),
        name: 'earth5'),
  ];
  List<CharacterCard> characterCardsList7 = [
    CharacterCard(
        path: EnglishCharacterCardPath.ambael,
        description: "ambael_desc".tr(),
        name: 'ambael6'),
    CharacterCard(
        path: EnglishCharacterCardPath.adrasteia,
        description: 'adrasteia_desc'.tr(),
        name: 'adrasteia6'),
    CharacterCard(
        path: EnglishCharacterCardPath.diana,
        description: 'diana_desc'.tr(),
        name: 'diana6'),
    CharacterCard(
        path: EnglishCharacterCardPath.earth,
        description: 'earth_desc'.tr(),
        name: 'earth6'),
  ];
  List<CharacterCard> characterCardsList8 = [
    CharacterCard(
        path: EnglishCharacterCardPath.ambael,
        description: "ambael_desc".tr(),
        name: 'ambael7'),
    CharacterCard(
        path: EnglishCharacterCardPath.adrasteia,
        description: 'adrasteia_desc'.tr(),
        name: 'adrasteia7'),
    CharacterCard(
        path: EnglishCharacterCardPath.diana,
        description: 'diana_desc'.tr(),
        name: 'diana7'),
    CharacterCard(
        path: EnglishCharacterCardPath.earth,
        description: 'earth_desc'.tr(),
        name: 'earth7'),
  ];
  List<CharacterCard> characterCardsList9 = [
    CharacterCard(
        path: EnglishCharacterCardPath.ambael,
        description: "ambael_desc".tr(),
        name: 'ambael8'),
    CharacterCard(
        path: EnglishCharacterCardPath.adrasteia,
        description: 'adrasteia_desc'.tr(),
        name: 'adrasteia8'),
    CharacterCard(
        path: EnglishCharacterCardPath.diana,
        description: 'diana_desc'.tr(),
        name: 'diana8'),
    CharacterCard(
        path: EnglishCharacterCardPath.earth,
        description: 'earth_desc'.tr(),
        name: 'earth8'),
  ];
  List<CharacterCard> characterCardsList10 = [
    CharacterCard(
        path: EnglishCharacterCardPath.ambael,
        description: "ambael_desc".tr(),
        name: 'ambael9'),
    CharacterCard(
        path: EnglishCharacterCardPath.adrasteia,
        description: 'adrasteia_desc'.tr(),
        name: 'adrasteia9'),
    CharacterCard(
        path: EnglishCharacterCardPath.diana,
        description: 'diana_desc'.tr(),
        name: 'diana9'),
    CharacterCard(
        path: EnglishCharacterCardPath.earth,
        description: 'earth_desc'.tr(),
        name: 'earth9'),
  ];
  List<CharacterCard> characterCardsList11 = [
    CharacterCard(
        path: EnglishCharacterCardPath.ambael,
        description: "ambael_desc".tr(),
        name: 'ambael10'),
    CharacterCard(
        path: EnglishCharacterCardPath.adrasteia,
        description: 'adrasteia_desc'.tr(),
        name: 'adrasteia10'),
    CharacterCard(
        path: EnglishCharacterCardPath.diana,
        description: 'diana_desc'.tr(),
        name: 'diana10'),
    CharacterCard(
        path: EnglishCharacterCardPath.earth,
        description: 'earth_desc'.tr(),
        name: 'earth10'),
  ];
  List<CharacterCard> characterCardsList12 = [
    CharacterCard(
        path: EnglishCharacterCardPath.ambael,
        description: "ambael_desc".tr(),
        name: 'ambael11'),
    CharacterCard(
        path: EnglishCharacterCardPath.adrasteia,
        description: 'adrasteia_desc'.tr(),
        name: 'adrasteia11'),
    CharacterCard(
        path: EnglishCharacterCardPath.diana,
        description: 'diana_desc'.tr(),
        name: 'diana11'),
    CharacterCard(
        path: EnglishCharacterCardPath.earth,
        description: 'earth_desc'.tr(),
        name: 'earth11'),
  ];

  List<CharacterCard> deCharacterCardsList1 = [
    CharacterCard(
        path: DeutschCharacterCardPath.ambael,
        description: "ambael_desc".tr(),
        name: 'ambael'),
    CharacterCard(
        path: DeutschCharacterCardPath.adrasteia,
        description: 'adrasteia_desc'.tr(),
        name: 'adrasteia'),
    CharacterCard(
        path: DeutschCharacterCardPath.diana,
        description: 'diana_desc'.tr(),
        name: 'diana'),
    CharacterCard(
        path: DeutschCharacterCardPath.earth,
        description: 'earth_desc'.tr(),
        name: 'earth'),
  ];
  List<CharacterCard> deCharacterCardsList2 = [
    CharacterCard(
        path: DeutschCharacterCardPath.ambael,
        description: "ambael_desc".tr(),
        name: 'ambael1'),
    CharacterCard(
        path: DeutschCharacterCardPath.adrasteia,
        description: 'adrasteia_desc'.tr(),
        name: 'adrasteia1'),
    CharacterCard(
        path: DeutschCharacterCardPath.diana,
        description: 'diana_desc'.tr(),
        name: 'diana1'),
    CharacterCard(
        path: DeutschCharacterCardPath.earth,
        description: 'earth_desc'.tr(),
        name: 'earth1'),
  ];
  List<CharacterCard> deCharacterCardsList3 = [
    CharacterCard(
        path: DeutschCharacterCardPath.ambael,
        description: "ambael_desc".tr(),
        name: 'ambael2'),
    CharacterCard(
        path: DeutschCharacterCardPath.adrasteia,
        description: 'adrasteia_desc'.tr(),
        name: 'adrasteia2'),
    CharacterCard(
        path: DeutschCharacterCardPath.diana,
        description: 'diana_desc'.tr(),
        name: 'diana2'),
    CharacterCard(
        path: DeutschCharacterCardPath.earth,
        description: 'earth_desc'.tr(),
        name: 'earth2'),
  ];
  List<CharacterCard> deCharacterCardsList4 = [
    CharacterCard(
        path: DeutschCharacterCardPath.ambael,
        description: "ambael_desc".tr(),
        name: 'ambael3'),
    CharacterCard(
        path: DeutschCharacterCardPath.adrasteia,
        description: 'adrasteia_desc'.tr(),
        name: 'adrasteia3'),
    CharacterCard(
        path: DeutschCharacterCardPath.diana,
        description: 'diana_desc'.tr(),
        name: 'diana3'),
    CharacterCard(
        path: DeutschCharacterCardPath.earth,
        description: 'earth_desc'.tr(),
        name: 'earth3'),
  ];
  List<CharacterCard> deCharacterCardsList5 = [
    CharacterCard(
        path: DeutschCharacterCardPath.ambael,
        description: "ambael_desc".tr(),
        name: 'ambael4'),
    CharacterCard(
        path: DeutschCharacterCardPath.adrasteia,
        description: 'adrasteia_desc'.tr(),
        name: 'adrasteia4'),
    CharacterCard(
        path: DeutschCharacterCardPath.diana,
        description: 'diana_desc'.tr(),
        name: 'diana4'),
    CharacterCard(
        path: DeutschCharacterCardPath.earth,
        description: 'earth_desc'.tr(),
        name: 'earth4'),
  ];
  List<CharacterCard> deCharacterCardsList6 = [
    CharacterCard(
        path: DeutschCharacterCardPath.ambael,
        description: "ambael_desc".tr(),
        name: 'ambael5'),
    CharacterCard(
        path: DeutschCharacterCardPath.adrasteia,
        description: 'adrasteia_desc'.tr(),
        name: 'adrasteia5'),
    CharacterCard(
        path: DeutschCharacterCardPath.diana,
        description: 'diana_desc'.tr(),
        name: 'diana5'),
    CharacterCard(
        path: DeutschCharacterCardPath.earth,
        description: 'earth_desc'.tr(),
        name: 'earth5'),
  ];
  List<CharacterCard> deCharacterCardsList7 = [
    CharacterCard(
        path: DeutschCharacterCardPath.ambael,
        description: "ambael_desc".tr(),
        name: 'ambael6'),
    CharacterCard(
        path: DeutschCharacterCardPath.adrasteia,
        description: 'adrasteia_desc'.tr(),
        name: 'adrasteia6'),
    CharacterCard(
        path: DeutschCharacterCardPath.diana,
        description: 'diana_desc'.tr(),
        name: 'diana6'),
    CharacterCard(
        path: DeutschCharacterCardPath.earth,
        description: 'earth_desc'.tr(),
        name: 'earth6'),
  ];
  List<CharacterCard> deCharacterCardsList8 = [
    CharacterCard(
        path: DeutschCharacterCardPath.ambael,
        description: "ambael_desc".tr(),
        name: 'ambael7'),
    CharacterCard(
        path: DeutschCharacterCardPath.adrasteia,
        description: 'adrasteia_desc'.tr(),
        name: 'adrasteia7'),
    CharacterCard(
        path: DeutschCharacterCardPath.diana,
        description: 'diana_desc'.tr(),
        name: 'diana7'),
    CharacterCard(
        path: DeutschCharacterCardPath.earth,
        description: 'earth_desc'.tr(),
        name: 'earth7'),
  ];
  List<CharacterCard> deCharacterCardsList9 = [
    CharacterCard(
        path: DeutschCharacterCardPath.ambael,
        description: "ambael_desc".tr(),
        name: 'ambael8'),
    CharacterCard(
        path: DeutschCharacterCardPath.adrasteia,
        description: 'adrasteia_desc'.tr(),
        name: 'adrasteia8'),
    CharacterCard(
        path: DeutschCharacterCardPath.diana,
        description: 'diana_desc'.tr(),
        name: 'diana8'),
    CharacterCard(
        path: DeutschCharacterCardPath.earth,
        description: 'earth_desc'.tr(),
        name: 'earth8'),
  ];
  List<CharacterCard> deCharacterCardsList10 = [
    CharacterCard(
        path: DeutschCharacterCardPath.ambael,
        description: "ambael_desc".tr(),
        name: 'ambael9'),
    CharacterCard(
        path: DeutschCharacterCardPath.adrasteia,
        description: 'adrasteia_desc'.tr(),
        name: 'adrasteia9'),
    CharacterCard(
        path: DeutschCharacterCardPath.diana,
        description: 'diana_desc'.tr(),
        name: 'diana9'),
    CharacterCard(
        path: DeutschCharacterCardPath.earth,
        description: 'earth_desc'.tr(),
        name: 'earth9'),
  ];
  List<CharacterCard> deCharacterCardsList11 = [
    CharacterCard(
        path: DeutschCharacterCardPath.ambael,
        description: "ambael_desc".tr(),
        name: 'ambael10'),
    CharacterCard(
        path: DeutschCharacterCardPath.adrasteia,
        description: 'adrasteia_desc'.tr(),
        name: 'adrasteia10'),
    CharacterCard(
        path: DeutschCharacterCardPath.diana,
        description: 'diana_desc'.tr(),
        name: 'diana10'),
    CharacterCard(
        path: DeutschCharacterCardPath.earth,
        description: 'earth_desc'.tr(),
        name: 'earth10'),
  ];
  List<CharacterCard> deCharacterCardsList12 = [
    CharacterCard(
        path: DeutschCharacterCardPath.ambael,
        description: "ambael_desc".tr(),
        name: 'ambael11'),
    CharacterCard(
        path: DeutschCharacterCardPath.adrasteia,
        description: 'adrasteia_desc'.tr(),
        name: 'adrasteia11'),
    CharacterCard(
        path: DeutschCharacterCardPath.diana,
        description: 'diana_desc'.tr(),
        name: 'diana11'),
    CharacterCard(
        path: DeutschCharacterCardPath.earth,
        description: 'earth_desc'.tr(),
        name: 'earth11'),
  ];

  bool showCharacterCard = false;
  bool showCardInfo = false;

  double _sigmaX = 4; // from 0-10
  double _sigmaY = 4; // from 0-10
  double _opacity = 0.2; // from 0-1.0

  String swipeDirection;

  bool showSettingMenu = false;
  CharacterCard cardToShow;

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

  void onCardTapped(CharacterCard card) {
    print('tapped');
    print(card.name);
    setState(() {
      cardToShow = card;
      showCharacterCard = true;
    });
  }

  void showMenu() {
    print('tapped');
    setState(() {
      showSettingMenu = !showSettingMenu;
    });
  }

  List characterList1 = [];
  List characterList2 = [];
  List characterList3 = [];
  List characterList4 = [];
  List characterList5 = [];
  List characterList6 = [];
  List characterList7 = [];
  List characterList8 = [];
  List characterList9 = [];
  List characterList10 = [];
  List characterList11 = [];
  List characterList12 = [];

  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    print(context.locale);

    characterList1 = context.locale == Locale('en')
        ? characterCardsList1
        : deCharacterCardsList1;

    characterList2 = context.locale == Locale('en')
        ? characterCardsList2
        : deCharacterCardsList2;
    characterList3 = context.locale == Locale('en')
        ? characterCardsList3
        : deCharacterCardsList3;
    characterList4 = context.locale == Locale('en')
        ? characterCardsList4
        : deCharacterCardsList4;
    characterList5 = context.locale == Locale('en')
        ? characterCardsList5
        : deCharacterCardsList5;
    characterList6 = context.locale == Locale('en')
        ? characterCardsList6
        : deCharacterCardsList6;
    characterList7 = context.locale == Locale('en')
        ? characterCardsList7
        : deCharacterCardsList7;
    characterList8 = context.locale == Locale('en')
        ? characterCardsList8
        : deCharacterCardsList8;
    characterList9 = context.locale == Locale('en')
        ? characterCardsList9
        : deCharacterCardsList9;
    characterList10 = context.locale == Locale('en')
        ? characterCardsList10
        : deCharacterCardsList10;
    characterList11 = context.locale == Locale('en')
        ? characterCardsList11
        : deCharacterCardsList11;
    characterList12 = context.locale == Locale('en')
        ? characterCardsList12
        : deCharacterCardsList12;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Text('Debug'),
        onPressed: () {
          cardKey.currentState.toggleCard();
        },
      ),
      body: BackgroundTemplate(
        child: Stack(
          children: [
            Column(
              children: [
                TopBar(
                  title: 'Browse Cards',
                  onSettingsTapped: showMenu,
                ),
                Text(
                  'browse_welcoming_text'.tr(),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
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
                                TopRack(),
                                CardRow(
                                  cards: characterList1,
                                  onCardTapped: (CharacterCard card) =>
                                      onCardTapped(card),
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
                                TopRack(),
                                CardRow(
                                  cards: characterList2,
                                  onCardTapped: (CharacterCard card) =>
                                      onCardTapped(card),
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
                                TopRack(),
                                CardRow(
                                  cards: characterList3,
                                  onCardTapped: (CharacterCard card) =>
                                      onCardTapped(card),
                                ),
                                TopVine(mode: TopVineMode.vineOne)
                              ],
                            ),
                          ),
                          Container(
                            height: 175,
                            width: double.infinity,
                            child: Stack(
                              children: [
                                TopRack(),
                                CardRow(
                                  cards: characterList4,
                                  onCardTapped: (CharacterCard card) =>
                                      onCardTapped(card),
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
                                TopRack(),
                                CardRow(
                                  cards: characterList5,
                                  onCardTapped: (CharacterCard card) =>
                                      onCardTapped(card),
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
                                TopRack(),
                                CardRow(
                                  cards: characterList6,
                                  onCardTapped: (CharacterCard card) =>
                                      onCardTapped(card),
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
                                TopRack(),
                                CardRow(
                                  cards: characterList7,
                                  onCardTapped: (CharacterCard card) =>
                                      onCardTapped(card),
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
                                TopRack(),
                                CardRow(
                                  cards: characterList8,
                                  onCardTapped: (CharacterCard card) =>
                                      onCardTapped(card),
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
                                TopRack(),
                                CardRow(
                                  cards: characterList9,
                                  onCardTapped: (CharacterCard card) =>
                                      onCardTapped(card),
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
                                TopRack(),
                                CardRow(
                                  cards: characterList10,
                                  onCardTapped: (CharacterCard card) =>
                                      onCardTapped(card),
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
                                TopRack(),
                                CardRow(
                                  cards: characterList11,
                                  onCardTapped: (CharacterCard card) =>
                                      onCardTapped(card),
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
                                TopRack(),
                                CardRow(
                                  cards: characterList12,
                                  onCardTapped: (CharacterCard card) =>
                                      onCardTapped(card),
                                ),
                                TopVine(mode: TopVineMode.vineTwo)
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
                      Container(),
                      showCharacterCard == true
                          ? Column(
                              children: [
                                GestureDetector(
                                  child: CardView(
                                    card: cardToShow,
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
                                    } else if (swipeDirection == 'left' &&
                                        !showCardInfo) {
                                      // toggleCardInfo();
                                      setState(() {
                                        showCardInfo = true;
                                      });
                                    } else if (swipeDirection == 'right' &&
                                        showCardInfo) {
                                      setState(() {
                                        showCardInfo = false;
                                      });
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
                    ],
                  ),
                ),
              ],
            ),
            Menu(
              showSettingMenu: showSettingMenu,
            ),
            GestureDetector(onTap: showMenu, child: SettingIcon()),
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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: GestureDetector(
            onTap: () {
              // this.onCardTapped(this.cards[0]);
              Navigator.push(
                context,
                PageRouteBuilder(
                  transitionDuration: Duration(seconds: 1),
                  pageBuilder: (_, __, ___) => ViewCard(
                    card: this.cards[0],
                  ),
                ),
              );
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //       builder: (context) => ViewCard(
              //             card: this.cards[0],
              //           )),
              // );
            },
            child: Container(
              width: SizeConfig.blockSizeHorizontal * 25,
              height: SizeConfig.blockSizeHorizontal * 25,
              child: Hero(
                tag: '${this.cards[0].name}',
                child: Image.asset(
                  cards[0].path,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            // this.onCardTapped(this.cards[1]);
            Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: Duration(seconds: 1),
                pageBuilder: (_, __, ___) => ViewCard(
                  card: this.cards[1],
                ),
              ),
            );
          },
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              // color: Colors.pink,
              width: SizeConfig.blockSizeHorizontal * 25,
              height: SizeConfig.blockSizeHorizontal * 25,
              child: Hero(
                  tag: '${this.cards[1].name}',
                  child: Image.asset(cards[1].path)),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            // this.onCardTapped(this.cards[2]);
            Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: Duration(seconds: 2),
                pageBuilder: (_, __, ___) => ViewCard(
                  card: this.cards[2],
                ),
              ),
            );
          },
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              // color: Colors.pink,
              width: SizeConfig.blockSizeHorizontal * 25,
              height: SizeConfig.blockSizeHorizontal * 25,
              child: Hero(
                  tag: '${this.cards[2].name}',
                  child: Image.asset(cards[2].path)),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            // this.onCardTapped(this.cards[3]);
            Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: Duration(seconds: 1),
                pageBuilder: (_, __, ___) => ViewCard(
                  card: this.cards[3],
                ),
              ),
            );
          },
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              // color: Colors.pink,
              width: SizeConfig.blockSizeHorizontal * 25,
              height: SizeConfig.blockSizeHorizontal * 25,
              child: Hero(
                  tag: '${this.cards[3].name}',
                  child: Image.asset(cards[3].path)),
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
      child: IgnorePointer(
        child: Container(
          width: SizeConfig.screenWidth,
          child: Image.asset(
            mode == TopVineMode.vineOne
                ? ImagePath.kCardRackTopVineOne
                : ImagePath.kCardRackTopVineTwo,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}

class TopRack extends StatelessWidget {
  const TopRack({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        child: Image.asset(
          ImagePath.kCardRackOne,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
