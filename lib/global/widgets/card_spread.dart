import 'package:flutter/material.dart';
import 'package:tarot_app/global/constants.dart';
import 'package:tarot_app/services/size_config.dart';
import 'package:easy_localization/easy_localization.dart';
import '../buttons/rounded_button.dart';
import '../buttons/setting_button.dart';
import 'card_formation.dart';

class CardSpread extends StatefulWidget {
  final int cardFormation;
  final Function opPressed;
  final String message;

  const CardSpread({
    Key key,
    @required this.cardFormation,
    this.opPressed,
    this.message,
  }) : super(key: key);

  @override
  _CardSpreadState createState() => _CardSpreadState();
}

class _CardSpreadState extends State<CardSpread> {
  void toggleInfoText() {
    setState(() {
      showInfo = !showInfo;
    });
  }

  bool showInfo = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF822E81).withOpacity(0.2),
      width: SizeConfig.screenWidth,
      child: Column(
        children: [
          SizedBox(
            height: 15.0,
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: BackIcon(),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  this.widget.cardFormation == 1
                      ? "single_card_reading".tr()
                      : this.widget.cardFormation == 3
                          ? "three_card_spread".tr()
                          : "seven_card_spread".tr(),
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              Spacer(),
              GestureDetector(onTap: toggleInfoText, child: InfoIcon()),
            ],
          ),
          SizedBox(
            height: 15.0,
          ),
          !showInfo
              ? Container(
                  child: this.widget.cardFormation == 1
                      ? SingleCardFormation()
                      : this.widget.cardFormation == 3
                          ? ThreeCardFormation()
                          : SevenCardFormation(),
                )
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: this.widget.cardFormation == 1
                        ? Text(
                            FormationInfo.single.tr(),
                            style: kInfoTextStyle,
                          )
                        : this.widget.cardFormation == 3
                            ? Text(
                                FormationInfo.three.tr(),
                                style: kInfoTextStyle,
                              )
                            : Text(FormationInfo.seven.tr(),
                                style: kInfoTextStyle),
                  ),
                ),
          SizedBox(
            height: 15.0,
          ),
          this.widget.message != null
              ? Text(
                  widget.message,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                )
              : Container(),
          SizedBox(
            height: 15.0,
          ),
          this.widget.opPressed != null
              ? RoundedButton(
                  title: 'start_reading'.tr(),
                  onPressed: this.widget.opPressed,
                  width: 40,
                  height: 6,
                )
              : Container(),
        ],
      ),
    );
  }
}
