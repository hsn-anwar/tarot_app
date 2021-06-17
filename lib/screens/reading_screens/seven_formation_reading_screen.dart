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
  bool cardFourSelected = false;
  bool cardFiveSelected = false;
  bool cardSixSelected = false;
  bool cardSevenSelected = false;

  GlobalKey<FlipCardState> cardKey1 = GlobalKey<FlipCardState>();
  GlobalKey<FlipCardState> cardKey2 = GlobalKey<FlipCardState>();
  GlobalKey<FlipCardState> cardKey3 = GlobalKey<FlipCardState>();
  GlobalKey<FlipCardState> cardKey4 = GlobalKey<FlipCardState>();
  GlobalKey<FlipCardState> cardKey5 = GlobalKey<FlipCardState>();
  GlobalKey<FlipCardState> cardKey6 = GlobalKey<FlipCardState>();
  GlobalKey<FlipCardState> cardKey7 = GlobalKey<FlipCardState>();

  bool cardOneRevealed = false;
  bool cardTwoRevealed = false;
  bool cardThreeRevealed = false;
  bool cardFourRevealed = false;
  bool cardFiveRevealed = false;
  bool cardSixRevealed = false;
  bool cardSevenRevealed = false;

  SpringController _translateController2 =
      SpringController(initialAnim: Motion.pause);

  List<String> words = [];
  int wordIndex = 0;

  SpringController _lightFadeController =
      SpringController(initialAnim: Motion.pause);

  SpringController _cardFadeController1 =
      SpringController(initialAnim: Motion.pause);

  SpringController _cardFadeController2 =
      SpringController(initialAnim: Motion.pause);

  SpringController _cardFadeController3 =
      SpringController(initialAnim: Motion.pause);

  SpringController _cardFadeController4 =
      SpringController(initialAnim: Motion.pause);

  SpringController _cardFadeController5 =
      SpringController(initialAnim: Motion.pause);

  SpringController _cardFadeController6 =
      SpringController(initialAnim: Motion.pause);

  SpringController _cardFadeController7 =
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
                                animDuration: Duration(milliseconds: 800),
                                springController: _scaleController,
                                child: TableTop(),
                                animStatus: (AnimStatus status) {
                                  print('scale: $status');
                                }),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              isCardSelected ? BackgroundBlur() : Container(),
              // First Row
              // Left --> Right
              AnimatedBackground(
                alignmentX: !zoomTableTop ? -0.32 : -0.47,
                alignmentY: !zoomTableTop ? 0.3 : -0.08,
                cardKey: cardKey1,
                cardSize: !zoomTableTop ? 11 : 13,
                cardDescription: "desc desc desc desc",
                characterImagePath: EnglishCharacterCardPath.adrasteia,
                title: cardOneSelected ? words[0] : '',
                onAnimateCallback: (bool value) => onCardOneTapped(value),
                showCard: showCardOne(),
                springController: _cardFadeController1,
                isCardFocused: showCardOne,
              ),
              AnimatedBackground(
                alignmentX: !zoomTableTop ? 0.325 : 0.49,
                alignmentY: !zoomTableTop ? 0.3 : -0.08,
                cardKey: cardKey2,
                cardSize: !zoomTableTop ? 11 : 13,
                cardDescription: "desc desc desc desc",
                characterImagePath: EnglishCharacterCardPath.earth,
                title: cardTwoSelected ? words[1] : '',
                onAnimateCallback: (bool value) => onCardTwoTapped(value),
                showCard: showCardTwo(),
                springController: _cardFadeController2,
                isCardFocused: showCardTwo,
              ),
              // Second Row
              // Left --> Right
              AnimatedBackground(
                alignmentX: !zoomTableTop ? -0.64 : -0.95,
                alignmentY: !zoomTableTop ? 0.49 : 0.24,
                cardKey: cardKey3,
                cardSize: !zoomTableTop ? 11 : 13,
                cardDescription: "desc desc desc desc",
                characterImagePath: EnglishCharacterCardPath.ambael,
                title: cardThreeSelected ? words[2] : '',
                onAnimateCallback: (bool value) => onCardThreeTapped(value),
                showCard: showCardThree(),
                springController: _cardFadeController3,
                isCardFocused: showCardThree,
                // tableTranslationController: null,
              ),
              AnimatedBackground(
                alignmentX: !zoomTableTop ? 0 : 0,
                alignmentY: !zoomTableTop ? 0.49 : 0.24,
                cardKey: cardKey4,
                cardSize: !zoomTableTop ? 11 : 13,
                cardDescription: "desc desc desc desc",
                characterImagePath: EnglishCharacterCardPath.ambael,
                title: cardThreeSelected ? words[3] : '',
                onAnimateCallback: (bool value) => onCardFourTapped(value),
                showCard: showCardFour(),
                springController: _cardFadeController4,
                isCardFocused: showCardFour,
              ),
              AnimatedBackground(
                alignmentX: !zoomTableTop ? 0.65 : 0.95,
                alignmentY: !zoomTableTop ? 0.49 : 0.24,
                cardKey: cardKey5,
                cardSize: !zoomTableTop ? 11 : 13,
                cardDescription: "desc desc desc desc",
                characterImagePath: EnglishCharacterCardPath.ambael,
                title: cardThreeSelected ? words[4] : '',
                onAnimateCallback: (bool value) => onCardFiveTapped(value),
                showCard: showCardFive(),
                springController: _cardFadeController5,
                isCardFocused: showCardFive,
              ),
              // Third row
              // Left --> Right
              AnimatedBackground(
                alignmentX: !zoomTableTop ? -0.32 : -0.47,
                alignmentY: !zoomTableTop ? 0.7 : 0.55,
                cardKey: cardKey6,
                cardSize: !zoomTableTop ? 11 : 13,
                cardDescription: "desc desc desc desc",
                characterImagePath: EnglishCharacterCardPath.adrasteia,
                title: cardOneSelected ? words[5] : '',
                onAnimateCallback: (bool value) => onCardSixTapped(value),
                showCard: showCardSix(),
                springController: _cardFadeController6,
                isCardFocused: showCardSix,
              ),
              AnimatedBackground(
                alignmentX: !zoomTableTop ? 0.33 : 0.49,
                alignmentY: !zoomTableTop ? 0.7 : 0.55,
                cardKey: cardKey7,
                cardSize: !zoomTableTop ? 11 : 13,
                cardDescription: "desc desc desc desc",
                characterImagePath: EnglishCharacterCardPath.earth,
                title: cardTwoSelected ? words[6] : '',
                onAnimateCallback: (bool value) => onCardSevenTapped(value),
                showCard: showCardSeven(),
                springController: _cardFadeController7,
                isCardFocused: showCardSeven,
              ),
              Spring.blink(
                springController: _lightFadeController,
                startOpacity: 1,
                endOpacity: 0,
                animDuration: Duration(milliseconds: isCardSelected ? 700 : 0),
                child: SevenFormationLight(
                  alignment: !zoomTableTop
                      ? Alignment(-0.35, 0.38)
                      : Alignment(-0.535, -0.02),
                  zoom: zoomTableTop,
                ),
              ),

              Spring.blink(
                springController: _lightFadeController,
                startOpacity: 1,
                endOpacity: 0,
                animDuration: Duration(milliseconds: isCardSelected ? 700 : 0),
                child: SevenFormationLight(
                  alignment: !zoomTableTop
                      ? Alignment(0.35, 0.38)
                      : Alignment(0.535, -0.02),
                  zoom: zoomTableTop,
                ),
              ),

              Spring.blink(
                springController: _lightFadeController,
                startOpacity: 1,
                endOpacity: 0,
                animDuration: Duration(milliseconds: isCardSelected ? 700 : 0),
                child: SevenFormationLight(
                  alignment: !zoomTableTop
                      ? Alignment(-0.7, 0.58)
                      : Alignment(-1.07, 0.32),
                  zoom: zoomTableTop,
                ),
              ),

              Spring.blink(
                springController: _lightFadeController,
                startOpacity: 1,
                endOpacity: 0,
                animDuration: Duration(milliseconds: isCardSelected ? 700 : 0),
                child: SevenFormationLight(
                  alignment: !zoomTableTop
                      ? Alignment(-0.01, 0.58)
                      : Alignment(-0.01, 0.32),
                  zoom: zoomTableTop,
                ),
              ),

              Spring.blink(
                springController: _lightFadeController,
                startOpacity: 1,
                endOpacity: 0,
                animDuration: Duration(milliseconds: isCardSelected ? 700 : 0),
                child: SevenFormationLight(
                  alignment: !zoomTableTop
                      ? Alignment(0.7, 0.58)
                      : Alignment(1.05, 0.32),
                  zoom: zoomTableTop,
                ),
              ),

              Spring.blink(
                springController: _lightFadeController,
                startOpacity: 1,
                endOpacity: 0,
                animDuration: Duration(milliseconds: isCardSelected ? 700 : 0),
                child: SevenFormationLight(
                  alignment: !zoomTableTop
                      ? Alignment(-0.35, 0.8)
                      : Alignment(-0.535, 0.65),
                  zoom: zoomTableTop,
                ),
              ),

              Spring.blink(
                springController: _lightFadeController,
                startOpacity: 1,
                endOpacity: 0,
                animDuration: Duration(milliseconds: isCardSelected ? 700 : 0),
                child: SevenFormationLight(
                  alignment: !zoomTableTop
                      ? Alignment(0.35, 0.8)
                      : Alignment(0.535, 0.65),
                  zoom: zoomTableTop,
                ),
              ),
              // cardOneRevealed
              //     ? CardIntention(
              //         alignment: Alignment(-0.55, -0.24),
              //         intention: words[0],
              //         isCardSelected: isCardSelected,
              //         controller: _lightFadeController,
              //       )
              //     : Container(),
              // cardTwoRevealed
              //     ? CardIntention(
              //         alignment: Alignment(0.56, -0.24),
              //         intention: words[1],
              //         isCardSelected: isCardSelected,
              //         controller: _lightFadeController,
              //       )
              //     : Container(),
              // cardThreeRevealed
              //     ? CardIntention(
              //         alignment: Alignment(-1.1, 0.07),
              //         intention: words[2],
              //         isCardSelected: isCardSelected,
              //         controller: _lightFadeController,
              //       )
              //     : Container(),
              // cardFourRevealed
              //     ? CardIntention(
              //         alignment: Alignment(0, 0.07),
              //         intention: words[3],
              //         isCardSelected: isCardSelected,
              //         controller: _lightFadeController,
              //       )
              //     : Container(),
              // cardFiveRevealed
              //     ? CardIntention(
              //         alignment: Alignment(1.17, 0.07),
              //         intention: words[4],
              //         controller: _lightFadeController,
              //         isCardSelected: isCardSelected,
              //       )
              //     : Container(),
              // cardSixSelected
              //     ? CardIntention(
              //         alignment: Alignment(-0.57, 0.36),
              //         intention: words[5],
              //         controller: _lightFadeController,
              //         isCardSelected: isCardSelected,
              //       )
              //     : Container(),
              // cardSevenSelected
              //     ? CardIntention(
              //         alignment: Alignment(0.57, 0.36),
              //         intention: words[5],
              //         controller: _lightFadeController,
              //         isCardSelected: isCardSelected,
              //       )
              //     : Container(),
              CardIntention(
                alignment: Alignment(-0.55, -0.24),
                intention: words[0],
                isCardSelected: isCardSelected,
                controller: _lightFadeController,
                isCardRevealed: cardOneRevealed,
              ),
              CardIntention(
                alignment: Alignment(0.56, -0.24),
                intention: words[1],
                isCardSelected: isCardSelected,
                controller: _lightFadeController,
                isCardRevealed: cardTwoRevealed,
              ),
              CardIntention(
                alignment: Alignment(-1.1, 0.07),
                intention: words[2],
                isCardSelected: isCardSelected,
                controller: _lightFadeController,
                isCardRevealed: cardThreeRevealed,
              ),
              CardIntention(
                alignment: Alignment(0, 0.07),
                intention: words[3],
                isCardSelected: isCardSelected,
                controller: _lightFadeController,
                isCardRevealed: cardFourRevealed,
              ),
              CardIntention(
                alignment: Alignment(1.17, 0.07),
                intention: words[4],
                controller: _lightFadeController,
                isCardSelected: isCardSelected,
                isCardRevealed: cardFiveRevealed,
              ),

              CardIntention(
                alignment: Alignment(-0.57, 0.36),
                intention: words[5],
                controller: _lightFadeController,
                isCardSelected: isCardSelected,
                isCardRevealed: cardSixRevealed,
              ),

              CardIntention(
                alignment: Alignment(0.57, 0.36),
                intention: words[5],
                controller: _lightFadeController,
                isCardSelected: isCardSelected,
                isCardRevealed: cardSevenRevealed,
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

  void animateTableUp(bool value) {
    print(value);
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
    print('card 1 tapped');
    print('oldValue: $cardOneSelected');

    if (value) {
      // _cardFadeController1.play(motion: Motion.play);
      _cardFadeController2.play(motion: Motion.play);
      _cardFadeController3.play(motion: Motion.play);
      _cardFadeController4.play(motion: Motion.play);
      _cardFadeController5.play(motion: Motion.play);
      _cardFadeController6.play(motion: Motion.play);
      _cardFadeController7.play(motion: Motion.play);
    } else {
      // _cardFadeController1.play(motion: Motion.reverse);
      Future.delayed(Duration(seconds: 1), () {});
      setState(() {
        cardOneRevealed = true;
      });
      _cardFadeController2.play(motion: Motion.reverse);
      _cardFadeController3.play(motion: Motion.reverse);
      _cardFadeController4.play(motion: Motion.reverse);
      _cardFadeController5.play(motion: Motion.reverse);
      _cardFadeController6.play(motion: Motion.reverse);
      _cardFadeController7.play(motion: Motion.reverse);
    }

    setState(() {
      isCardSelected = value;
      cardOneSelected = value;
      cardTwoSelected = false;
      cardThreeSelected = false;
      cardFourSelected = false;
      cardFiveSelected = false;
      cardSixSelected = false;
      cardSevenSelected = false;
    });
    print('cardOneStatus: $cardOneSelected');
  }

  void onCardTwoTapped(bool value) {
    animateTableUp(value);

    print('card 1 tapped');
    print('oldValue: $cardOneSelected');

    print(value);

    if (value) {
      _cardFadeController1.play(motion: Motion.play);
      // _cardFadeController2.play(motion: Motion.play);
      _cardFadeController3.play(motion: Motion.play);
      _cardFadeController4.play(motion: Motion.play);
      _cardFadeController5.play(motion: Motion.play);
      _cardFadeController6.play(motion: Motion.play);
      _cardFadeController7.play(motion: Motion.play);
    } else {
      _cardFadeController1.play(motion: Motion.reverse);
      // _cardFadeController2.play(motion: Motion.reverse);
      _cardFadeController3.play(motion: Motion.reverse);
      _cardFadeController4.play(motion: Motion.reverse);
      _cardFadeController5.play(motion: Motion.reverse);
      _cardFadeController6.play(motion: Motion.reverse);
      _cardFadeController7.play(motion: Motion.reverse);
    }
    setState(() {
      isCardSelected = value;
      cardTwoSelected = value;
      cardTwoRevealed = true;

      cardOneSelected = false;
      cardThreeSelected = false;
      cardFourSelected = false;
      cardFiveSelected = false;
      cardSixSelected = false;
      cardSevenSelected = false;
    });
    print('cardOneStatus: $cardOneSelected');
  }

  void onCardThreeTapped(bool value) {
    animateTableUp(value);

    print('card 1 tapped');
    print('oldValue: $cardOneSelected');
    if (value) {
      _cardFadeController1.play(motion: Motion.play);
      _cardFadeController2.play(motion: Motion.play);
      // _cardFadeController3.play(motion: Motion.play);
      _cardFadeController4.play(motion: Motion.play);
      _cardFadeController5.play(motion: Motion.play);
      _cardFadeController6.play(motion: Motion.play);
      _cardFadeController7.play(motion: Motion.play);
    } else {
      _cardFadeController1.play(motion: Motion.reverse);
      _cardFadeController2.play(motion: Motion.reverse);
      // _cardFadeController3.play(motion: Motion.reverse);
      _cardFadeController4.play(motion: Motion.reverse);
      _cardFadeController5.play(motion: Motion.reverse);
      _cardFadeController6.play(motion: Motion.reverse);
      _cardFadeController7.play(motion: Motion.reverse);
    }

    setState(() {
      isCardSelected = value;
      cardThreeSelected = value;
      cardThreeRevealed = true;

      cardOneSelected = false;
      cardTwoSelected = false;
      cardFourSelected = false;
      cardFiveSelected = false;
      cardSixSelected = false;
      cardSevenSelected = false;
    });
    print('cardOneStatus: $cardOneSelected');
  }

  void onCardFourTapped(bool value) {
    animateTableUp(value);

    print('card 1 tapped');
    print('oldValue: $cardOneSelected');

    if (value) {
      _cardFadeController1.play(motion: Motion.play);
      _cardFadeController2.play(motion: Motion.play);
      _cardFadeController3.play(motion: Motion.play);
      // _cardFadeController4.play(motion: Motion.play);
      _cardFadeController5.play(motion: Motion.play);
      _cardFadeController6.play(motion: Motion.play);
      _cardFadeController7.play(motion: Motion.play);
    } else {
      _cardFadeController1.play(motion: Motion.reverse);
      _cardFadeController2.play(motion: Motion.reverse);
      _cardFadeController3.play(motion: Motion.reverse);
      // _cardFadeController4.play(motion: Motion.reverse);
      _cardFadeController5.play(motion: Motion.reverse);
      _cardFadeController6.play(motion: Motion.reverse);
      _cardFadeController7.play(motion: Motion.reverse);
    }

    setState(() {
      isCardSelected = value;
      cardFourSelected = value;
      cardFourRevealed = true;

      cardOneSelected = false;
      cardTwoSelected = false;
      cardThreeSelected = false;
      cardFiveSelected = false;
      cardSixSelected = false;
      cardSevenSelected = false;
    });
    print('cardOneStatus: $cardOneSelected');
  }

  void onCardFiveTapped(bool value) {
    animateTableUp(value);

    print('card 1 tapped');
    print('oldValue: $cardOneSelected');

    if (value) {
      _cardFadeController1.play(motion: Motion.play);
      _cardFadeController2.play(motion: Motion.play);
      _cardFadeController3.play(motion: Motion.play);
      _cardFadeController4.play(motion: Motion.play);
      // _cardFadeController5.play(motion: Motion.play);
      _cardFadeController6.play(motion: Motion.play);
      _cardFadeController7.play(motion: Motion.play);
    } else {
      _cardFadeController1.play(motion: Motion.reverse);
      _cardFadeController2.play(motion: Motion.reverse);
      _cardFadeController3.play(motion: Motion.reverse);
      _cardFadeController4.play(motion: Motion.reverse);
      // _cardFadeController5.play(motion: Motion.reverse);
      _cardFadeController6.play(motion: Motion.reverse);
      _cardFadeController7.play(motion: Motion.reverse);
    }

    setState(() {
      isCardSelected = value;
      cardFiveSelected = value;
      cardFiveRevealed = true;

      cardOneSelected = false;
      cardTwoSelected = false;
      cardThreeSelected = false;
      cardFourSelected = false;
      cardSixSelected = false;
      cardSevenSelected = false;
    });
    print('cardOneStatus: $cardOneSelected');
  }

  void onCardSixTapped(bool value) {
    animateTableUp(value);

    print('card 1 tapped');
    print('oldValue: $cardOneSelected');

    if (value) {
      _cardFadeController1.play(motion: Motion.play);
      _cardFadeController2.play(motion: Motion.play);
      _cardFadeController3.play(motion: Motion.play);
      _cardFadeController4.play(motion: Motion.play);
      _cardFadeController5.play(motion: Motion.play);
      // _cardFadeController6.play(motion: Motion.play);
      _cardFadeController7.play(motion: Motion.play);
    } else {
      _cardFadeController1.play(motion: Motion.reverse);
      _cardFadeController2.play(motion: Motion.reverse);
      _cardFadeController3.play(motion: Motion.reverse);
      _cardFadeController4.play(motion: Motion.reverse);
      _cardFadeController5.play(motion: Motion.reverse);
      // _cardFadeController6.play(motion: Motion.reverse);
      _cardFadeController7.play(motion: Motion.reverse);
    }

    setState(() {
      isCardSelected = value;
      cardSixSelected = value;
      cardSixRevealed = true;

      cardOneSelected = false;
      cardTwoSelected = false;
      cardThreeSelected = false;
      cardFourSelected = false;
      cardFiveSelected = false;
      cardSevenSelected = false;
    });
    print('cardOneStatus: $cardOneSelected');
  }

  void onCardSevenTapped(bool value) {
    animateTableUp(value);

    print('card 1 tapped');
    print('oldValue: $cardOneSelected');

    if (value) {
      _cardFadeController1.play(motion: Motion.play);
      _cardFadeController2.play(motion: Motion.play);
      _cardFadeController3.play(motion: Motion.play);
      _cardFadeController4.play(motion: Motion.play);
      _cardFadeController5.play(motion: Motion.play);
      _cardFadeController6.play(motion: Motion.play);
      // _cardFadeController7.play(motion: Motion.play);
    } else {
      _cardFadeController1.play(motion: Motion.reverse);
      _cardFadeController2.play(motion: Motion.reverse);
      _cardFadeController3.play(motion: Motion.reverse);
      _cardFadeController4.play(motion: Motion.reverse);
      _cardFadeController5.play(motion: Motion.reverse);
      _cardFadeController6.play(motion: Motion.reverse);
      // _cardFadeController7.play(motion: Motion.reverse);
    }

    setState(() {
      isCardSelected = value;
      cardSevenSelected = value;
      cardSevenRevealed = true;

      cardOneSelected = false;
      cardTwoSelected = false;
      cardThreeSelected = false;
      cardFourSelected = false;
      cardFiveSelected = false;
      cardSixSelected = false;
    });
    print('cardOneStatus: $cardOneSelected');
  }

  bool showCardOne() {
    if (cardTwoSelected ||
        cardThreeSelected ||
        cardFourSelected ||
        cardFiveSelected ||
        cardSixSelected ||
        cardSevenSelected) {
      return false;
    } else {
      return true;
    }
  }

  bool showCardTwo() {
    if (cardOneSelected ||
        cardThreeSelected ||
        cardFourSelected ||
        cardFiveSelected ||
        cardSixSelected ||
        cardSevenSelected) {
      return false;
    } else {
      return true;
    }
  }

  bool showCardThree() {
    if (cardOneSelected ||
        cardTwoSelected ||
        cardFourSelected ||
        cardFiveSelected ||
        cardSixSelected ||
        cardSevenSelected) {
      return false;
    } else {
      return true;
    }
  }

  bool showCardFour() {
    if (cardOneSelected ||
        cardTwoSelected ||
        cardThreeSelected ||
        cardFiveSelected ||
        cardSixSelected ||
        cardSevenSelected) {
      return false;
    } else {
      return true;
    }
  }

  bool showCardFive() {
    if (cardOneSelected ||
        cardTwoSelected ||
        cardThreeSelected ||
        cardFourSelected ||
        cardSixSelected ||
        cardSevenSelected) {
      return false;
    } else {
      return true;
    }
  }

  bool showCardSix() {
    if (cardOneSelected ||
        cardTwoSelected ||
        cardThreeSelected ||
        cardFourSelected ||
        cardFiveSelected ||
        cardSevenSelected) {
      return false;
    } else {
      return true;
    }
  }

  bool showCardSeven() {
    if (cardOneSelected ||
        cardTwoSelected ||
        cardThreeSelected ||
        cardFourSelected ||
        cardFiveSelected ||
        cardSixSelected) {
      return false;
    } else {
      return true;
    }
  }
}

class CardIntention extends StatelessWidget {
  const CardIntention(
      {Key key,
      @required this.alignment,
      @required this.intention,
      @required this.isCardSelected,
      @required this.isCardRevealed,
      @required this.controller})
      : super(key: key);
  final Alignment alignment;
  final String intention;
  final bool isCardSelected;
  final SpringController controller;
  final bool isCardRevealed;
  @override
  Widget build(BuildContext context) {
    return this.isCardRevealed
        ? Spring.blink(
            springController: this.controller,
            startOpacity: 1,
            endOpacity: 0,
            animDuration: Duration(milliseconds: isCardSelected ? 800 : 0),
            child: Align(
              alignment: this.alignment,
              child: Container(
                alignment: Alignment(0, 0),
                width: SizeConfig.blockSizeHorizontal * 30,
                height: SizeConfig.blockSizeVertical * 5,
                // color: Colors.red,
                child: Card(
                  color: Color.fromARGB(255, 54, 27, 68).withOpacity(0.7),
                  shape: RoundedRectangleBorder(
                      side: new BorderSide(color: Colors.purple, width: 2.0),
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      this.intention,
                      style: TextStyle(color: Colors.white, fontSize: 11),
                    ),
                  ),
                ),
              ),
            ),
          )
        : Container();
  }
}
