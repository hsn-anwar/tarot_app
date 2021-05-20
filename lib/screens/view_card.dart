import 'package:flutter/material.dart';
import 'package:tarot_app/global/background_template.dart';
import 'package:tarot_app/global/constants.dart';
import 'package:tarot_app/models/character_card.dart';
import 'package:tarot_app/services/size_config.dart';

class ViewCard extends StatelessWidget {
  final CharacterCard card;
  final bool showInfo;
  const ViewCard({Key key, @required this.card, @required this.showInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                child: Image.asset(
                  this.card.path,
                ),
              ),
              this.showInfo
                  ? Stack(
                      children: [
                        Container(
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
