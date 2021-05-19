import 'package:flutter/material.dart';
import 'package:tarot_app/global/background_template.dart';
import 'package:tarot_app/global/card_spread.dart';
import 'package:tarot_app/global/top_bar.dart';
import 'package:easy_localization/easy_localization.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundTemplate(
        child: Column(
          children: [
            TopBar(title: 'intentions'.tr()),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 15,
            ),
            CardSpread(
              cardFormation: widget.cardFormation,
              message: widget.message,
              opPressed: () {},
              height: SizeConfig.blockSizeVertical * getHeight(),
            ),
          ],
        ),
      ),
    );
  }
}
