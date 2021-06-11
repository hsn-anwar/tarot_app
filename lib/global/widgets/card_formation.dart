import 'package:flutter/material.dart';
import 'package:tarot_app/services/size_config.dart';

import '../buttons/setting_button.dart';
import '../constants.dart';
import 'package:easy_localization/easy_localization.dart';

class SingleCardFormation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 32),
      child: CardIcon(
        size: 15,
      ),
    );
  }
}

class ThreeCardFormation extends StatelessWidget {
  final double cardSize = 10.0;
  // final double spaceHeight = 35.0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              SizedBox(
                height: SizeConfig.blockSizeVertical * 4,
              ),
              CardIcon(
                size: cardSize,
              )
            ],
          ),
          Column(
            children: [
              CardIcon(
                size: cardSize,
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 4,
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: SizeConfig.blockSizeVertical * 4,
              ),
              CardIcon(
                size: cardSize,
              )
            ],
          ),
        ],
      ),
    );
  }
}

class SevenCardFormation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double cardSize = 8;
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CardIcon(size: cardSize),
              Container(
                width: SizeConfig.blockSizeHorizontal * 6,
              ),
              CardIcon(size: cardSize),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CardIcon(size: cardSize),
              Container(
                width: SizeConfig.blockSizeHorizontal * 6,
              ),
              CardIcon(size: cardSize),
              Container(
                width: SizeConfig.blockSizeHorizontal * 6,
              ),
              CardIcon(size: cardSize),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CardIcon(size: cardSize),
              Container(
                width: SizeConfig.blockSizeHorizontal * 6,
              ),
              CardIcon(size: cardSize),
            ],
          ),
        ],
      ),
    );
  }
}

class CardFormation extends StatefulWidget {
  final String title;
  final Widget formation;
  final double height;
  final Function onInfoTapped;
  final int cardFormation;

  const CardFormation(
      {Key key,
      @required this.title,
      @required this.formation,
      this.height,
      @required this.onInfoTapped,
      @required this.cardFormation})
      : super(key: key);

  @override
  _CardFormationState createState() => _CardFormationState();
}

class _CardFormationState extends State<CardFormation> {
  bool isInfoTapped = false;

  void toggleInfoTapped() {
    setState(() {
      isInfoTapped = !isInfoTapped;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
      // height: SizeConfig.blockSizeVertical *
      //     (this.height != null ? this.height : 22),
      width: SizeConfig.blockSizeHorizontal * 85,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        // color: Color(0xFFF371D61).withOpacity(0.7),
        color: Color.fromARGB(255, 74, 19, 94).withOpacity(0.8),
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(),
                    Spacer(),
                    Text(
                      this.widget.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Spacer(),
                    GestureDetector(onTap: toggleInfoTapped, child: InfoIcon()),
                  ],
                ),
              ),
              !isInfoTapped
                  ? this.widget.formation
                  : Container(
                      padding: const EdgeInsets.all(16.0),
                      child: this.widget.cardFormation == 1
                          ? Text(
                              FormationInfo.single.tr(),
                              style: kInfoTextStyle,
                              textAlign: TextAlign.justify,
                            )
                          : this.widget.cardFormation == 3
                              ? Text(
                                  FormationInfo.three.tr(),
                                  style: kInfoTextStyle,
                                  textAlign: TextAlign.justify,
                                )
                              : Text(FormationInfo.seven.tr(),
                                  textAlign: TextAlign.justify,
                                  style: kInfoTextStyle),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
