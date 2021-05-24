import 'package:flutter/material.dart';
import 'package:tarot_app/services/size_config.dart';
import 'package:easy_localization/easy_localization.dart';
import 'buttons/rounded_button.dart';
import 'buttons/setting_button.dart';
import 'card_formation.dart';

class CardSpread extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF371D61),
      width: SizeConfig.screenWidth,
      child: Column(
        children: [
          SizedBox(
            height: 15.0,
          ),
          Row(
            children: [
              BackIcon(),
              Spacer(),
              Text(
                this.cardFormation == 1
                    ? "single_card_spread".tr()
                    : this.cardFormation == 3
                        ? "three_card_spread".tr()
                        : "seven_card_spread".tr(),
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              Spacer(),
              InfoIcon(),
            ],
          ),
          SizedBox(
            height: 15.0,
          ),
          Container(
            child: this.cardFormation == 1
                ? SingleCardFormation()
                : this.cardFormation == 3
                    ? ThreeCardFormation()
                    : SevenCardFormation(),
          ),
          SizedBox(
            height: 15.0,
          ),
          this.message != null
              ? Text(
                  message,
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
          this.opPressed != null
              ? RoundedButton(
                  title: 'start_reading'.tr(),
                  onPressed: this.opPressed,
                  width: 40,
                  height: 6,
                )
              : Container(),
        ],
      ),
    );
  }
}
