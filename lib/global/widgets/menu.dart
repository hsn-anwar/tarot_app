import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:tarot_app/enums/music.dart';
import 'package:tarot_app/global/constants.dart';
import 'package:tarot_app/services/language_service.dart';
import 'package:tarot_app/services/music_service.dart';
import 'package:tarot_app/services/size_config.dart';
import 'package:easy_localization/easy_localization.dart';
import 'dart:ui';
import 'package:morphable_shape/morphable_shape.dart';
import 'package:tarot_app/enums/language.dart';
import 'package:url_launcher/url_launcher.dart';

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

  void initializeToggleButtons() {
    Music musicFile = MusicService.instance.musicFile;
    if (musicFile == Music.off) {
      setState(() {
        isRelaxingSelected = false;
        isEpicSelected = false;
        isMeditativeSelected = false;
        isOffSelected = true;
      });
    } else if (musicFile == Music.relaxing) {
      setState(() {
        isRelaxingSelected = true;
        isEpicSelected = false;
        isMeditativeSelected = false;
        isOffSelected = false;
      });
    } else if (musicFile == Music.epic) {
      setState(() {
        isRelaxingSelected = false;
        isEpicSelected = true;
        isMeditativeSelected = false;
        isOffSelected = false;
      });
    } else if (musicFile == Music.meditative) {
      setState(() {
        isRelaxingSelected = false;
        isEpicSelected = false;
        isMeditativeSelected = true;
        isOffSelected = false;
      });
    }
  }

  @override
  void initState() {
    initializeToggleButtons();
    super.initState();
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

  void initializeToggleButtons(BuildContext context) {
    // context.locale;
    print(context.locale);
    if (context.locale == Locale('en')) {
      setState(() {
        isEnglishSelected = true;
        isDutchSelected = false;
      });
    } else if (context.locale == Locale('de')) {
      setState(() {
        isEnglishSelected = false;
        isDutchSelected = true;
      });
    }
  }

  @override
  void initState() {
    // initializeToggleButtons();
    super.initState();
  }

  bool isLanguageChecked = false;

  @override
  Widget build(BuildContext context) {
    // print(context.locale);

    if (!isLanguageChecked) {
      initializeToggleButtons(context);
      isLanguageChecked = true;
    }

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
          title: 'Deutsch',
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

  final String _url = 'https://www.google.com';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Stack(
      children: [
        Visibility(
          visible: showSettingMenu,
          child: Container(
            height: SizeConfig.screenHeight,
            width: SizeConfig.screenWidth,
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
                color: Colors.transparent,
                clipBehavior: Clip.antiAlias,
                child: Container(
                  width: SizeConfig.screenWidth,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(ImagePath.settingsOverlay),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: SizeConfig.blockSizeVertical * 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'music'.tr(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: SizeConfig.blockSizeHorizontal * 7,
                            fontFamily: CustomFonts.baskvill,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MusicToggleButtons(),
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical * 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'language'.tr(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: SizeConfig.blockSizeHorizontal * 7,
                            fontFamily: CustomFonts.baskvill,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: LanguageToggleButtons(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: SizeConfig.blockSizeVertical * 7,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Read ',
                                style: TextStyle(color: Colors.white),
                              ),
                              InkWell(
                                onTap: () async {
                                  print('tapped');
                                  await canLaunch(_url)
                                      ? await launch(_url)
                                      : throw 'Could not launch $_url';
                                },
                                child: Text(
                                  'Privacy Policy',
                                  style: TextStyle(
                                    color: Colors.white,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
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
