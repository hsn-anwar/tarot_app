import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swipedetector/swipedetector.dart';
import 'package:tarot_app/global/buttons/small_rounded_button.dart';
import 'package:tarot_app/global/constants.dart';
import 'package:tarot_app/global/widgets/background_blur.dart';
import 'package:tarot_app/global/widgets/background_template.dart';
import 'package:tarot_app/models/character_card.dart';
import 'package:tarot_app/screens/card_view.dart';
import 'package:tarot_app/services/size_config.dart';
import 'package:easy_localization/easy_localization.dart';

class ViewCard extends StatefulWidget {
  const ViewCard({Key key, @required this.card}) : super(key: key);
  final CharacterCard card;
  @override
  _ViewCardState createState() => _ViewCardState();
}

class _ViewCardState extends State<ViewCard> {
  bool showCardInfo = false;
  bool showButtons = false;

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
    Future.delayed(const Duration(seconds: 2, microseconds: 200), () {
      if (mounted)
        setState(() {
          showButtons = true;
        });
    });
  }

  @override
  void initState() {
    initializeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return WillPopScope(
      onWillPop: () async {
        setState(() {
          showButtons = false;
          showCardInfo = false;
        });
        return true;
      },
      child: Scaffold(
        body: BackgroundTemplate(
          child: Stack(
            children: [
              BackgroundBlur(),
              AnimatedPositioned(
                bottom: !showButtons
                    ? SizeConfig.blockSizeVertical * 15
                    : SizeConfig.blockSizeVertical * 2,
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
                            });
                            Navigator.pop(context);
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
                duration: Duration(seconds: 2),
              ),
              GestureDetector(
                onHorizontalDragUpdate: (details) {
                  // Note: Sensitivity is integer used when you don't want to mess up vertical drag
                  int sensitivity = 8;
                  if (details.delta.dx > sensitivity) {
                    print('swipe right');
                    setState(() {
                      showCardInfo = true;
                    });
                  } else if (details.delta.dx < -sensitivity) {
                    print('swipe left');
                    setState(() {
                      showCardInfo = false;
                    });
                  }
                },
                onVerticalDragUpdate: (details) {
                  int sensitivity = 8;
                  if (details.delta.dy > sensitivity) {
                    print('swipe down');
                    setState(() {
                      showButtons = false;
                      showCardInfo = false;
                      Navigator.pop(context);
                    });
                  } else if (details.delta.dy < -sensitivity) {
                    // Up Swipe
                  }
                },
                child: Stack(
                  children: [
                    Container(
                      height: SizeConfig.screenHeight,
                      child: Center(
                        child: Hero(
                            tag: '${widget.card.name}',
                            child: Image.asset(widget.card.path)),
                      ),
                    ),
                    Visibility(
                      visible: showCardInfo,
                      child: Center(
                        child: Stack(
                          children: [
                            Container(
                              child: Center(
                                child: Image.asset(
                                  ImagePath.kCardReadingOverlay,
                                  fit: BoxFit.fitWidth,
                                  width: double.infinity,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                      visible: showCardInfo,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: SizeConfig.blockSizeHorizontal * 60,
                            child: Center(
                              child: Text(
                                'dashfioas fashoidas sadofhoisdahf osdihfvoisd fihaofiopqe aioshfoieaf fioahfoiea oiahfioaef aifhaeiohf asfoiheafioa oaihfeoaif iofhaeiof aoihfae0hf aoifhaoeihf aofihaoeif aofiehieaof afoihaefoae oiaefhfoiae aoeifaioehf oiaehfoaeif oaifhoiaehf',
                                style: TextStyle(
                                  fontFamily: CustomFonts.malgun,
                                  // color: Colors.white,
                                  fontSize: SizeConfig.blockSizeHorizontal * 5,
                                  // fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
