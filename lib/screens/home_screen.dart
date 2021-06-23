import 'dart:ui';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:tarot_app/global/widgets/background_template.dart';
import 'package:tarot_app/global/buttons/rounded_button.dart';
import 'package:tarot_app/global/buttons/setting_button.dart';
import 'package:tarot_app/global/constants.dart';
import 'package:tarot_app/global/widgets/menu.dart';
import 'package:tarot_app/main.dart';
import 'package:tarot_app/screens/browse_cards_screen.dart';
import 'package:tarot_app/screens/formation_screen.dart';
import 'package:tarot_app/screens/splash_screen.dart';
import 'package:tarot_app/services/music_service.dart';
import 'package:tarot_app/services/size_config.dart';
import 'package:morphable_shape/morphable_shape.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audioplayers.dart';
import '';

class HomeScreen extends StatefulWidget {
  static final String id = '/home_screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showSettingMenu = false;

  void showMenu() {
    print('tapped');
    print(MusicService.instance.musicFile);
    setState(() {
      showSettingMenu = !showSettingMenu;
    });
  }

  bool isMusicPlaying;

  AudioPlayer player = MusicService.instance.audioPlayer;

  void initializeBackgroundMusic() {
    MusicService.instance.playRelaxingMusic();
    print('sadasdasd');
  }

  bool _showSplashScreen = true;

  void dismissSplashScreen() {
    Future.delayed(Duration(milliseconds: 8000), () {
      setState(() {
        _showSplashScreen = false;
      });
    });
    // Future.delayed(Duration(seconds: 9), () {
    //   setState(() {
    //     _hideSPlashScreen = true;
    //   });
    // });
  }

  @override
  void initState() {
    // dismissSplashScreen();
    initializeBackgroundMusic();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            Navigator.pushNamed(context, SplashScreen.id);
          });
        },
        child: Text('DEBUG'),
      ),
      body: Stack(
        children: [
          BackgroundTemplate(
            child: Stack(
              children: [
                Column(
                  children: [
                    SizedBox(height: SizeConfig.blockSizeVertical * 15),
                    Container(
                      child: Image.asset(
                        ImagePath.kLogoIcon,
                        width: SizeConfig.blockSizeVertical * 20,
                      ),
                    ),
                    SizedBox(height: SizeConfig.blockSizeVertical * 5),
                    Text(
                      "title".tr(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: CustomFonts.sherlock,
                        fontSize: SizeConfig.blockSizeHorizontal * 11,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: SizeConfig.blockSizeVertical * 5),
                    Text(
                      "home_welcoming_text".tr(),
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: SizeConfig.blockSizeVertical * 10),
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
                          Container(
                              width: SizeConfig.blockSizeHorizontal * 10,
                              child: Image.asset(ImagePath.kBrowseCardIcon)),
                          SizedBox(
                            width: SizeConfig.blockSizeHorizontal * 3,
                          ),
                          TextButton(
                            onPressed: () => Navigator.pushNamed(
                                context, BrowseCardsScreen.id),
                            child: Text(
                              'browse_cards'.tr(),
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                              ),
                            ),
                          )
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
          // IgnorePointer(
          //   ignoring: !_showSplashScreen,
          //   child: AnimatedOpacity(
          //     opacity: _showSplashScreen ? 1.0 : 0.0,
          //     duration: Duration(seconds: 1),
          //     child: Container(
          //       height: SizeConfig.screenHeight,
          //       width: SizeConfig.screenWidth,
          //       child: Image.asset(
          //         'assets/splash/Splash.gif',
          //         width: SizeConfig.screenWidth,
          //         fit: BoxFit.fill,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
