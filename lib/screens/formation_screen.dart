import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tarot_app/global/widgets/background_blur.dart';
import 'package:tarot_app/global/widgets/background_template.dart';
import 'package:tarot_app/global/buttons/setting_button.dart';
import 'package:tarot_app/global/widgets/card_formation.dart';
import 'package:tarot_app/global/widgets/top_bar.dart';
import 'package:tarot_app/global/widgets/menu.dart';
import 'package:tarot_app/services/size_config.dart';
import 'package:easy_localization/easy_localization.dart';

import 'intentions_screen.dart';

class FormationScreen extends StatefulWidget {
  static final String id = 'formation_screen';
  @override
  _FormationScreenState createState() => _FormationScreenState();
}

class _FormationScreenState extends State<FormationScreen> {
  bool showSettingMenu = false;
  void showMenu() {
    print('tapped');
    setState(() {
      showSettingMenu = !showSettingMenu;
    });
  }

  bool isSingleCardInfoSelected = false;
  bool isThreeCardInfoSelected = false;
  bool isSevenCardInfoSelected = false;

  void toggleSingleFormationInfo() {
    setState(() {
      isSingleCardInfoSelected = !isSingleCardInfoSelected;
    });
  }

  void toggleThreeFormationInfo() {
    setState(() {
      isThreeCardInfoSelected = !isThreeCardInfoSelected;
    });
  }

  void toggleSevenFormationInfo() {
    setState(() {
      isSevenCardInfoSelected = !isSevenCardInfoSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: BackgroundTemplate(
        child: Stack(
          children: [
            BackgroundBlur(),
            Column(
              children: [
                TopBar(
                  title: 'formations'.tr(),
                  onSettingsTapped: showMenu,
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical * 2.5,
                ),
                Text(
                  "formation_heading".tr(),
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical * 2.5,
                ),
                Flexible(
                  child: ListView(
                    primary: false,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      IntentionsScreen(cardFormation: 1)),
                            ),
                            child: CardFormation(
                              title: 'single_card_reading'.tr(),
                              formation: SingleCardFormation(),
                              onInfoTapped: toggleSingleFormationInfo,
                              cardFormation: 1,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      IntentionsScreen(cardFormation: 3)),
                            ),
                            child: CardFormation(
                              // height: SizeConfig.blockSizeVertical * 3.5,
                              title: 'three_card_reading'.tr(),
                              formation: ThreeCardFormation(),
                              onInfoTapped: toggleThreeFormationInfo,
                              cardFormation: 3,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        IntentionsScreen(cardFormation: 7))),
                            child: CardFormation(
                              // height: SizeConfig.blockSizeVertical * 3.5,
                              title: 'seven_card_reading'.tr(),
                              formation: SevenCardFormation(),
                              onInfoTapped: toggleSevenFormationInfo,
                              cardFormation: 7,
                            ),
                          ),
                        ],
                      ),
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
