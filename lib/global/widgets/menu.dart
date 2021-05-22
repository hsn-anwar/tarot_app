import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:tarot_app/global/constants.dart';
import 'package:tarot_app/services/music_service.dart';
import 'package:tarot_app/services/size_config.dart';
import 'package:easy_localization/easy_localization.dart';
import 'dart:ui';
import 'package:morphable_shape/morphable_shape.dart';

class MusicToggleButtons extends StatefulWidget {
  @override
  _MusicToggleButtonsState createState() => _MusicToggleButtonsState();
}

class _MusicToggleButtonsState extends State<MusicToggleButtons> {
  bool isRelaxingSelected = false;
  bool isEpicSelected = false;
  bool isMeditativeSelected = false;
  bool isOffSelected = true;
  AudioPlayer audioPlayer = AudioPlayer();

  // AudioPlayer player = AudioPlayer(); //add this
  // AudioCache cache = new AudioCache();

  AudioPlayer player = MusicService.instance.audioPlayer;
  AudioCache cache = MusicService.instance.audioCache;

  void playMusic() async {
    // MyApp.of(context).setLocale(Locale.fromSubtags(languageCode: 'de'));
    if (isRelaxingSelected) {
      print(MusicPath.relaxing);
      MusicService.instance.playRelaxingMusic();
    } else if (isEpicSelected) {
      player.stop();
      MusicService.instance.playEpicMusic();
    } else if (isMeditativeSelected) {
      MusicService.instance.playMeditativeMusic();
    } else if (isOffSelected) {
      MusicService.instance.stopMusic();
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

class LanguageToggleButtons extends StatefulWidget {
  const LanguageToggleButtons({Key key}) : super(key: key);

  @override
  _LanguageToggleButtonsState createState() => _LanguageToggleButtonsState();
}

class _LanguageToggleButtonsState extends State<LanguageToggleButtons> {
  bool isEnglishSelected = true;
  bool isDutchSelected = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ToggleButton(
          onPressed: () {
            setState(() {
              isDutchSelected = false;
              isEnglishSelected = true;
              context.setLocale(Locale('en'));
            });
          },
          title: 'English',
          isPressed: isEnglishSelected,
        ),
        SizedBox(
          width: 15,
        ),
        ToggleButton(
          onPressed: () {
            setState(() {
              isEnglishSelected = false;
              isDutchSelected = true;
              context.setLocale(Locale('de'));
            });
          },
          title: 'Dutch',
          isPressed: isDutchSelected,
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

class Menu extends StatelessWidget {
  Menu({Key key, @required this.showSettingMenu}) : super(key: key);
  final bool showSettingMenu;
  final ShapeBorder rectangle = BubbleShapeBorder(
    side: ShapeSide.top,
    arrowCenterPosition: 90.0.toPercentLength,
    arrowHeadPosition: 90.0.toPercentLength,
    arrowHeight: 4.0.toPercentLength,
    arrowWidth: 10.0.toPercentLength,
    borderRadius: 100.0.toPercentLength,
  );
  final double _sigmaX = 4; // from 0-10
  final double _sigmaY = 4; // from 0-10
  final double _opacity = 0.2; // from 0-1.0
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                      Text(
                        'language'.tr(),
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      ),
                      LanguageToggleButtons(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
