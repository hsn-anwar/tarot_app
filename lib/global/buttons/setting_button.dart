import 'package:flutter/material.dart';
import 'package:tarot_app/services/size_config.dart';

import '../constants.dart';

class SettingIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 25.0, top: 8.0),
        child: Container(
          width: SizeConfig.blockSizeHorizontal * 8,
          child: Image.asset(ImagePath.kSettingsButton),
        ),
      ),
    );
  }
}

class CloseIcon extends StatelessWidget {
  final double size;

  const CloseIcon({Key key, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(right: 10.0, top: 8.0),
        child: Container(
          width: SizeConfig.blockSizeHorizontal * 10,
          child: Image.asset(ImagePath.kCloseButton),
        ),
      ),
    );
  }
}

class InfoIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0, top: 8.0),
      child: Container(
        width: SizeConfig.blockSizeHorizontal * 7,
        child: Image.asset(ImagePath.kInfoButton),
      ),
    );
  }
}

class CardIcon extends StatelessWidget {
  final double size;

  const CardIcon({Key key, @required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: SizeConfig.blockSizeHorizontal * this.size,
        child: Image.asset(ImagePath.kCardIcon),
      ),
    );
  }
}

class BackIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0, top: 8.0),
      child: Container(
        width: SizeConfig.blockSizeHorizontal * 7,
        child: Image.asset(ImagePath.kInfoButton),
      ),
    );
  }
}
