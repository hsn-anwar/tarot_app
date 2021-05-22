import 'package:flutter/material.dart';
import 'package:tarot_app/global/background_template.dart';
import 'package:tarot_app/global/buttons/setting_button.dart';
import 'package:tarot_app/global/card_formation.dart';
import 'package:tarot_app/global/top_bar.dart';
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

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: BackgroundTemplate(
        child: Stack(
          children: [
            Column(
              children: [
                TopBar(
                  title: 'formations'.tr(),
                  onSettingsTapped: showMenu,
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical * 5,
                ),
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
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            IntentionsScreen(cardFormation: 3)),
                  ),
                  child: CardFormation(
                    title: 'three_card_reading'.tr(),
                    formation: ThreeCardFormation(),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              IntentionsScreen(cardFormation: 7))),
                  child: CardFormation(
                    height: SizeConfig.blockSizeVertical * 3.5,
                    title: 'seven_card_reading'.tr(),
                    formation: SevenCardFormation(),
                  ),
                ),
              ],
            ),
            Menu(
              showSettingMenu: showSettingMenu,
            ),
            // GestureDetector(onTap: showMenu, child: SettingIcon()),
          ],
        ),
      ),
    );
  }
}
