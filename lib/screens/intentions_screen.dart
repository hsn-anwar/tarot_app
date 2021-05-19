import 'package:flutter/material.dart';
import 'package:tarot_app/global/background_template.dart';
import 'package:tarot_app/global/buttons/rounded_button.dart';
import 'package:tarot_app/global/buttons/setting_button.dart';
import 'package:tarot_app/global/card_formation.dart';
import 'package:tarot_app/global/card_spread.dart';
import 'package:tarot_app/global/top_bar.dart';
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

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: BackgroundTemplate(
        child: Column(
          children: [
            TopBar(title: 'Intentions'.tr()),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 5,
            ),
            CardSpread(
              cardFormation: widget.cardFormation,
              height: SizeConfig.blockSizeVertical * getHeight(),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 5,
            ),
            Text('reading_purpose'.tr()),
            RoundedButton(
              title: message1,
              onPressed: () =>
                  navigateToStartReading(widget.cardFormation, message1),
            ),
            RoundedButton(
              title: message2,
              onPressed: () =>
                  navigateToStartReading(widget.cardFormation, message2),
            ),
            RoundedButton(
              title: message3,
              onPressed: () =>
                  navigateToStartReading(widget.cardFormation, message3),
            ),
            RoundedButton(
              title: message4,
              onPressed: () =>
                  navigateToStartReading(widget.cardFormation, message4),
            ),
          ],
        ),
      ),
    );
  }
}
