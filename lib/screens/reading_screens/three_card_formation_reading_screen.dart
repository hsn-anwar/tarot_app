import 'package:circle_list/circle_list.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spring/spring.dart';
import 'package:tarot_app/global/buttons/setting_button.dart';
import 'package:tarot_app/global/constants.dart';
import 'package:tarot_app/global/widgets/background_blur.dart';
import 'package:tarot_app/global/widgets/menu.dart';
import 'package:tarot_app/global/widgets/reading_screen/animated_background.dart';
import 'package:tarot_app/global/widgets/reading_screen/deactivated_light.dart';
import 'package:tarot_app/global/widgets/reading_screen/pedestals.dart';
import 'package:tarot_app/global/widgets/reading_screen/table_top.dart';
import 'package:tarot_app/global/widgets/reading_screen/text_title.dart';
import 'package:tarot_app/global/widgets/top_bar.dart';
import 'package:tarot_app/services/music_service.dart';
import 'package:tarot_app/services/size_config.dart';

class ThreeCardFormationScreen extends StatefulWidget {
  const ThreeCardFormationScreen({Key key, @required this.message})
      : super(key: key);
  final String message;

  static final String id = '/three_card_formation_screen';

  @override
  _ThreeCardFormationScreenState createState() =>
      _ThreeCardFormationScreenState();
}

class _ThreeCardFormationScreenState extends State<ThreeCardFormationScreen> {
  double lightSize = 15;
  AnimationController animationController;
  bool zoomScreen = false;
  bool animateContainer = false;
  SpringController _scaleController =
      SpringController(initialAnim: Motion.pause);
  SpringController _translateController =
      SpringController(initialAnim: Motion.pause);
  bool zoomTableTop = false;
  bool isCardSelected = false;

  bool cardOneSelected = false;
  bool cardTwoSelected = false;
  bool cardThreeSelected = false;

  GlobalKey<FlipCardState> cardKey1 = GlobalKey<FlipCardState>();
  GlobalKey<FlipCardState> cardKey2 = GlobalKey<FlipCardState>();
  GlobalKey<FlipCardState> cardKey3 = GlobalKey<FlipCardState>();
  SpringController _lightFadeController =
      SpringController(initialAnim: Motion.pause);

  SpringController _translateController2 =
      SpringController(initialAnim: Motion.pause);
  List<String> words = [];
  int wordIndex = 0;

  SpringController _cardFadeController1 =
      SpringController(initialAnim: Motion.pause);

  SpringController _cardFadeController2 =
      SpringController(initialAnim: Motion.pause);

  SpringController _cardFadeController3 =
      SpringController(initialAnim: Motion.pause);

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
        onPressed: debug,
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
                        message: words[wordIndex],
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
                              start: 0.9,
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
                                animStatus: (AnimStatus status) {
                                  print('scale: $status');
                                }),
                          ),
                          // SingleLight(lightSize: !zoomTableTop ? 15 : 20),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              isCardSelected ? BackgroundBlur() : Container(),
              AnimatedBackground(
                alignmentX: 0,
                alignmentY: !zoomTableTop ? 0.28 : -0.04,
                cardKey: cardKey1,
                cardSize: !zoomTableTop ? 16 : 20,
                cardDescription: "desc desc desc desc",
                characterImagePath: EnglishCharacterCardPath.adrasteia,
                title: cardOneSelected ? words[0] : '',
                onAnimateCallback: (bool value) => onCardOneTapped(value),
                showCard: cardTwoSelected || cardThreeSelected ? false : true,
                springController: _cardFadeController1,
                isCardFocused: showCardOne,
              ),
              AnimatedBackground(
                alignmentX: !zoomTableTop ? -0.42 : -0.6,
                alignmentY: !zoomTableTop ? 0.57 : 0.39,
                cardKey: cardKey2,
                cardSize: !zoomTableTop ? 16 : 20,
                cardDescription: "desc desc desc desc",
                characterImagePath: EnglishCharacterCardPath.earth,
                title: cardTwoSelected ? words[1] : '',
                onAnimateCallback: (bool value) => onCardTwoTapped(value),
                showCard: cardOneSelected || cardThreeSelected ? false : true,
                springController: _cardFadeController2,
                isCardFocused: showCardTwo,
              ),
              AnimatedBackground(
                alignmentX: !zoomTableTop ? 0.45 : 0.62,
                alignmentY: !zoomTableTop ? 0.57 : 0.39,
                cardKey: cardKey3,
                cardSize: !zoomTableTop ? 16 : 20,
                cardDescription: "desc desc desc desc",
                characterImagePath: EnglishCharacterCardPath.ambael,
                title: cardThreeSelected ? words[2] : '',
                onAnimateCallback: (bool value) => onCardThreeTapped(value),
                showCard: cardOneSelected || cardTwoSelected ? false : true,
                springController: _cardFadeController3,
                isCardFocused: showCardThree,
              ),
              Spring.blink(
                springController: _lightFadeController,
                startOpacity: 1,
                endOpacity: 0,
                animDuration: Duration(milliseconds: isCardSelected ? 700 : 0),
                child: ThreeFormationLight(
                  alignment: !zoomTableTop
                      ? Alignment(-0.01, 0.4)
                      : Alignment(-0.01, 0.1),
                  zoom: zoomTableTop,
                ),
              ),
              Spring.blink(
                springController: _lightFadeController,
                startOpacity: 1,
                endOpacity: 0,
                animDuration: Duration(milliseconds: isCardSelected ? 700 : 0),
                child: ThreeFormationLight(
                  alignment: !zoomTableTop
                      ? Alignment(-0.5, 0.72)
                      : Alignment(-0.7, 0.55),
                  zoom: zoomTableTop,
                ),
              ),
              Spring.blink(
                springController: _lightFadeController,
                startOpacity: 1,
                endOpacity: 0,
                animDuration: Duration(milliseconds: isCardSelected ? 700 : 0),
                child: ThreeFormationLight(
                  alignment: !zoomTableTop
                      ? Alignment(0.5, 0.72)
                      : Alignment(0.7, 0.55),
                  zoom: zoomTableTop,
                ),
              ),
              Menu(
                showSettingMenu: showSettingMenu,
              ),
              GestureDetector(onTap: showMenu, child: SettingIcon()),
            ],
          ),
        ),
      ),
    );
  }

  bool showSettingMenu = false;

  void showMenu() {
    print('tapped');
    print(MusicService.instance.musicFile);
    setState(() {
      showSettingMenu = !showSettingMenu;
    });
  }

  bool showCardOne() {
    // cardTwoSelected || cardThreeSelected ? false : true,

    if (cardTwoSelected || cardThreeSelected)
      return false;
    else
      return true;
  }

  bool showCardTwo() {
    if (cardOneSelected || cardThreeSelected)
      return false;
    else
      return true;
  }

  bool showCardThree() {
    if (cardOneSelected || cardTwoSelected)
      return false;
    else
      return true;
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

  void onCardOneTapped(bool value) {
    animateTableUp(value);

    if (value) {
      // _cardFadeController1.play(motion: Motion.play);
      _cardFadeController2.play(motion: Motion.play);
      _cardFadeController3.play(motion: Motion.play);
    } else {
      // _cardFadeController1.play(motion: Motion.reverse);
      _cardFadeController2.play(motion: Motion.reverse);
      _cardFadeController3.play(motion: Motion.reverse);
    }

    setState(() {
      isCardSelected = value;
      cardOneSelected = value;
      cardTwoSelected = false;
      cardThreeSelected = false;
    });
    print('cardOneStatus: $cardOneSelected');
  }

  void onCardTwoTapped(bool value) {
    animateTableUp(value);
    if (value) {
      _cardFadeController1.play(motion: Motion.play);
      // _cardFadeController2.play(motion: Motion.play);
      _cardFadeController3.play(motion: Motion.play);
    } else {
      _cardFadeController1.play(motion: Motion.reverse);
      // _cardFadeController2.play(motion: Motion.reverse);
      _cardFadeController3.play(motion: Motion.reverse);
    }
    setState(() {
      isCardSelected = value;
      cardOneSelected = false;
      cardTwoSelected = value;
      cardThreeSelected = false;
    });

    print('cardOneStatus: $cardTwoSelected');
  }

  void onCardThreeTapped(bool value) {
    animateTableUp(value);
    if (value) {
      _cardFadeController1.play(motion: Motion.play);
      _cardFadeController2.play(motion: Motion.play);
      // _cardFadeController3.play(motion: Motion.play);
    } else {
      _cardFadeController1.play(motion: Motion.reverse);
      _cardFadeController2.play(motion: Motion.reverse);
      // _cardFadeController3.play(motion: Motion.reverse);
    }
    setState(() {
      isCardSelected = value;
      cardOneSelected = false;
      cardTwoSelected = false;
      cardThreeSelected = value;
    });
    print('cardOneStatus: $cardThreeSelected');
  }

  void getMessage() {
    String w = widget.message.replaceAll("\n", "-");
    print(w);
    List<String> temp = w.split("-");

    for (int i = 0; i <= temp.length - 1; i++) {
      words.add(temp[i].trim());
    }

    print(words);
  }

  void debug() async {
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
  }
}
