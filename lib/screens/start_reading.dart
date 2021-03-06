import 'package:flutter/material.dart';
import 'package:tarot_app/global/widgets/background_template.dart';
import 'package:tarot_app/global/buttons/setting_button.dart';
import 'package:tarot_app/global/widgets/card_spread.dart';
import 'package:tarot_app/global/widgets/top_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:tarot_app/global/widgets/menu.dart';
import 'package:tarot_app/screens/reading_screens/seven_formation_reading_screen.dart';
import 'package:tarot_app/screens/reading_screens/single_card_formation_reading_screen.dart';
import 'package:tarot_app/screens/reading_screens/three_card_formation_reading_screen.dart';
import 'package:tarot_app/services/size_config.dart';

class StartReadingScreen extends StatefulWidget {
  final String message;
  final int cardFormation;

  const StartReadingScreen({Key key, this.message, this.cardFormation})
      : super(key: key);
  @override
  _StartReadingScreenState createState() => _StartReadingScreenState();
}

class _StartReadingScreenState extends State<StartReadingScreen> {
  double getHeight() {
    if (widget.cardFormation == 1) {
      return 5;
    } else if (widget.cardFormation == 3) {
      return 5;
    } else {
      return 5.5;
    }
  }

  void showMenu() {
    print('tapped');
    setState(() {
      showSettingMenu = !showSettingMenu;
    });
  }

  bool showSettingMenu = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundTemplate(
        blur: true,
        child: Stack(
          children: [
            Column(
              children: [
                TopBar(
                  title: 'intentions'.tr(),
                  onSettingsTapped: showMenu,
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical * 15,
                ),
                CardSpread(
                  cardFormation: widget.cardFormation,
                  message: widget.message,
                  opPressed: () {
                    if (widget.cardFormation == 3) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ThreeCardFormationScreen(
                            message: widget.message,
                          ),
                        ),
                      );
                    } else if (widget.cardFormation == 1) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SingleCardFormationScreen(
                            message: widget.message,
                          ),
                        ),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SevenFormationReadingScreen(
                            message: widget.message,
                          ),
                        ),
                      );
                    }
                  },
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
