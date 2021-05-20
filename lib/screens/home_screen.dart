import 'dart:ui';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:tarot_app/global/background_template.dart';
import 'package:tarot_app/global/buttons/rounded_button.dart';
import 'package:tarot_app/global/buttons/setting_button.dart';
import 'package:tarot_app/global/constants.dart';
import 'package:tarot_app/screens/browse_cards_screen.dart';
import 'package:tarot_app/screens/formation_screen.dart';
import 'package:tarot_app/services/size_config.dart';
import 'package:morphable_shape/morphable_shape.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audioplayers.dart';

class HomeScreen extends StatefulWidget {
  static final String id = '/home_screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ShapeBorder rectangle = BubbleShapeBorder(
    side: ShapeSide.top,
    arrowCenterPosition: 90.0.toPercentLength,
    arrowHeadPosition: 90.0.toPercentLength,
    arrowHeight: 4.0.toPercentLength,
    arrowWidth: 10.0.toPercentLength,
    borderRadius: 100.0.toPercentLength,
  );

  bool showSettingMenu = false;

  void showMenu() {
    print('tapped');
    setState(() {
      showSettingMenu = !showSettingMenu;
    });
  }

  double _sigmaX = 4; // from 0-10
  double _sigmaY = 4; // from 0-10
  double _opacity = 0.2; // from 0-1.0

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: BackgroundTemplate(
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(height: SizeConfig.blockSizeVertical * 10),
                Container(
                  child: Image.asset(ImagePath.kLogoIcon),
                ),
                SizedBox(height: SizeConfig.blockSizeVertical * 5),
                SizedBox(height: SizeConfig.blockSizeVertical * 15),
                RoundedButton(
                  title: "start_a_reading".tr(),
                  onPressed: () =>
                      Navigator.pushNamed(context, FormationScreen.id),
                ),
                SizedBox(height: SizeConfig.blockSizeVertical * 2),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(ImagePath.kBrowseCardIcon),
                      SizedBox(
                        width: SizeConfig.blockSizeHorizontal * 3,
                      ),
                      TextButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, BrowseCardsScreen.id),
                        child: Text(
                          'browse_cards'.tr(),
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Visibility(
              visible: showSettingMenu,
              child: Container(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: _sigmaX, sigmaY: _sigmaY),
                  child: Container(
                    color: Colors.black.withOpacity(_opacity),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: showSettingMenu,
              child: Column(
                children: [
                  SizedBox(height: SizeConfig.blockSizeVertical * 6),
                  Material(
                    shape: rectangle,
                    clipBehavior: Clip.antiAlias,
                    child: Container(
                      width: SizeConfig.screenWidth,
                      height: SizeConfig.blockSizeVertical * 60,
                      color: Color(0xFFF371D61),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'music'.tr(),
                            style: TextStyle(color: Colors.white, fontSize: 40),
                          ),
                          MusicToggleButtons(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(onTap: showMenu, child: SettingIcon()),
          ],
        ),
      ),
    );
  }
}

class MusicToggleButtons extends StatefulWidget {
  @override
  _MusicToggleButtonsState createState() => _MusicToggleButtonsState();
}

class _MusicToggleButtonsState extends State<MusicToggleButtons> {
  bool isRelaxingSelected = true;
  bool isEpicSelected = false;
  bool isMeditativeSelected = false;
  bool isOffSelected = false;
  AudioPlayer audioPlayer = AudioPlayer();

  AudioPlayer player = AudioPlayer(); //add this
  AudioCache cache = new AudioCache();

  void playMusic() async {
    if (isRelaxingSelected) {
      print(MusicPath.relaxing);
      player = await cache.loop('relaxing.mp3');
    } else if (isEpicSelected) {
      player = await cache.loop('epic_option_1.mp3');
    } else if (isMeditativeSelected) {
      player = await cache.loop('atmo.mp3');
    } else if (isOffSelected) {
      player.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ToggleButton(
              onPressed: () {
                setState(() {
                  isRelaxingSelected = true;
                  isEpicSelected = false;
                  isMeditativeSelected = false;
                  isOffSelected = false;
                  playMusic();
                });
              },
              title: 'relaxing'.tr(),
              isPressed: isRelaxingSelected,
            ),
            SizedBox(
              width: 15,
            ),
            ToggleButton(
              onPressed: () {
                setState(() {
                  isRelaxingSelected = false;
                  isEpicSelected = true;
                  isMeditativeSelected = false;
                  isOffSelected = false;
                  playMusic();
                });
              },
              title: 'epic'.tr(),
              isPressed: isEpicSelected,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ToggleButton(
              onPressed: () {
                setState(() {
                  isRelaxingSelected = false;
                  isEpicSelected = false;
                  isMeditativeSelected = true;
                  isOffSelected = false;
                  playMusic();
                });
              },
              title: 'meditative'.tr(),
              isPressed: isMeditativeSelected,
            ),
            SizedBox(
              width: 15,
            ),
            ToggleButton(
              onPressed: () {
                setState(() {
                  isRelaxingSelected = false;
                  isEpicSelected = false;
                  isMeditativeSelected = false;
                  isOffSelected = true;
                  playMusic();
                });
              },
              title: 'off'.tr(),
              isPressed: isOffSelected,
            ),
          ],
        ),
      ],
    );
  }
}

class ToggleButton extends StatelessWidget {
  final String title;
  final Function onPressed;
  final bool isPressed;

  const ToggleButton(
      {Key key,
      @required this.title,
      @required this.onPressed,
      @required this.isPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: SizeConfig.blockSizeHorizontal * 30,
        height: SizeConfig.blockSizeVertical * 5,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: StadiumBorder(),
              primary: this.isPressed == true
                  ? Color.fromARGB(255, 130, 46, 129)
                  : Colors.transparent,
              shadowColor: Color.fromARGB(255, 130, 46, 129),
              side: BorderSide(
                color: Color.fromARGB(255, 130, 46, 129),
              ),
            ),
            onPressed: this.onPressed,
            child: Text(this.title)),
      ),
    );
  }
}
