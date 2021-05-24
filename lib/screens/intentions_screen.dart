import 'package:flutter/material.dart';
import 'package:tarot_app/global/background_template.dart';
import 'package:tarot_app/global/buttons/rounded_button.dart';
import 'package:tarot_app/global/buttons/setting_button.dart';
import 'package:tarot_app/global/card_formation.dart';
import 'package:tarot_app/global/card_spread.dart';
import 'package:tarot_app/global/constants.dart';
import 'package:tarot_app/global/top_bar.dart';
import 'package:tarot_app/global/widgets/menu.dart';
import 'package:tarot_app/screens/start_reading.dart';
import 'package:tarot_app/services/size_config.dart';
import 'package:easy_localization/easy_localization.dart';

class IntentionsScreen extends StatefulWidget {
  final int cardFormation;

  const IntentionsScreen({Key key, @required this.cardFormation})
      : super(key: key);
  @override
  _IntentionsScreenState createState() => _IntentionsScreenState();
}

class _IntentionsScreenState extends State<IntentionsScreen> {
  @override
  void initState() {
    super.initState();
  }

  final String message1 = 'purpose1'.tr();
  final String message2 = 'purpose2'.tr();
  final String message3 = 'purpose3'.tr();
  final String message4 = 'purpose4'.tr();
  String selectedMessage;

  void navigateToStartReading(int cardFormation, String message) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => StartReadingScreen(
                  cardFormation: cardFormation,
                  message: message,
                )));
  }

  double getHeight() {
    if (widget.cardFormation == 1) {
      return 3.3;
    } else if (widget.cardFormation == 3) {
      return 3.3;
    } else {
      return 4;
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
    SizeConfig().init(context);
    return Scaffold(
      body: BackgroundTemplate(
        child: Stack(
          children: [
            SingleChildScrollView(
              primary: false,
              child: Column(
                children: [
                  TopBar(
                    title: 'Intentions'.tr(),
                    onSettingsTapped: showMenu,
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 5,
                  ),
                  CardSpread(
                    cardFormation: widget.cardFormation,
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 5,
                  ),
                  Text(
                    'reading_purpose'.tr(),
                    style: TextStyle(color: Colors.white, fontSize: 17),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 5,
                  ),
                  Container(
                      height: SizeConfig.blockSizeVertical * 35,
                      child: SingleCardSpreadButtons(
                        formation: widget.cardFormation,
                      )),
                  // RoundedButton(
                  //   title: message1,
                  //   onPressed: () =>
                  //       navigateToStartReading(widget.cardFormation, message1),
                  // ),
                  // RoundedButton(
                  //   title: message2,
                  //   onPressed: () =>
                  //       navigateToStartReading(widget.cardFormation, message2),
                  // ),
                  // RoundedButton(
                  //   title: message3,
                  //   onPressed: () =>
                  //       navigateToStartReading(widget.cardFormation, message3),
                  // ),
                  // RoundedButton(
                  //   title: message4,
                  //   onPressed: () =>
                  //       navigateToStartReading(widget.cardFormation, message4),
                  // ),
                ],
              ),
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

class SingleCardSpreadButtons extends StatelessWidget {
  SingleCardSpreadButtons({Key key, this.formation}) : super(key: key);

  final int formation;

  final List singleCardIntentions = [
    SingleCardIntentions.intention1,
    SingleCardIntentions.intention2,
    SingleCardIntentions.intention3,
    SingleCardIntentions.intention4,
    SingleCardIntentions.intention5,
    SingleCardIntentions.intention6,
    SingleCardIntentions.intention7,
    SingleCardIntentions.intention8,
    SingleCardIntentions.intention9,
    SingleCardIntentions.intention10,
    SingleCardIntentions.intention11,
    SingleCardIntentions.intention12,
    SingleCardIntentions.intention13,
    SingleCardIntentions.intention14,
    SingleCardIntentions.intention15,
    SingleCardIntentions.intention16,
    SingleCardIntentions.intention17,
    SingleCardIntentions.intention18,
  ];

  final List threeCardIntentions = [
    ThreeCardIntentions.intention1,
    ThreeCardIntentions.intention2,
    ThreeCardIntentions.intention3,
    ThreeCardIntentions.intention4,
    ThreeCardIntentions.intention5,
    ThreeCardIntentions.intention6,
    ThreeCardIntentions.intention7,
    ThreeCardIntentions.intention8,
    ThreeCardIntentions.intention9,
    ThreeCardIntentions.intention10,
  ];

  final List sevenCardIntentions = [
    SevenCardIntentions.intention1,
    SevenCardIntentions.intention2,
    SevenCardIntentions.intention3,
    SevenCardIntentions.intention4,
    SevenCardIntentions.intention5,
    SevenCardIntentions.intention6,
    SevenCardIntentions.intention7,
  ];

  @override
  Widget build(BuildContext context) {
    print(this.formation);

    return ListView.builder(
      itemCount: this.formation == 1
          ? singleCardIntentions.length - 1
          : this.formation == 3
              ? threeCardIntentions.length - 1
              : sevenCardIntentions.length - 1,
      itemBuilder: (context, index) {
        return RoundedButton(
          title: this.formation == 1
              ? singleCardIntentions[index]
              : this.formation == 3
                  ? threeCardIntentions[index]
                  : sevenCardIntentions[index],
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => StartReadingScreen(
                          cardFormation: this.formation,
                          message: this.formation == 1
                              ? singleCardIntentions[index]
                              : this.formation == 3
                                  ? threeCardIntentions[index]
                                  : sevenCardIntentions[index],
                        )));
          },
        );
      },
    );
  }
}
