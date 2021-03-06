import 'package:flutter/material.dart';
import 'package:tarot_app/global/widgets/background_template.dart';
import 'package:tarot_app/global/constants.dart';
import 'package:tarot_app/models/character_card.dart';
import 'package:tarot_app/services/size_config.dart';

class CardView extends StatelessWidget {
  final CharacterCard card;
  final bool showInfo;
  const CardView({Key key, @required this.card, @required this.showInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      children: [
        Container(
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: SizeConfig.blockSizeVertical * 75,
                child: Image.asset(
                  this.card.path,
                ),
              ),
              this.showInfo
                  ? Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: SizeConfig.blockSizeVertical * 65,
                          child: Center(
                            child: Image.asset(
                              ImagePath.kCardReadingOverlay,
                              fit: BoxFit.fill,
                              width: SizeConfig.blockSizeHorizontal * 90,
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            this.card.description,
                            style: TextStyle(fontSize: 22),
                          ),
                        ),
                      ],
                    )
                  : Container(),
            ],
          ),
        ),
      ],
    );
  }
}
