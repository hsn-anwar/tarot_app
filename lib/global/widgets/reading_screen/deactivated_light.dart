import 'package:flutter/material.dart';
import 'package:tarot_app/services/size_config.dart';

import '../../constants.dart';

class DeactivatedLight extends StatelessWidget {
  const DeactivatedLight(
      {Key key, @required this.alignment, @required this.zoom})
      : super(key: key);
  final Alignment alignment;
  final bool zoom;

  @override
  Widget build(BuildContext context) {
    return AnimatedAlign(
      alignment: this.alignment,
      duration: Duration(seconds: 1),
      child: AnimatedContainer(
        width: SizeConfig.blockSizeHorizontal * (!this.zoom ? 15 : 20),
        duration: Duration(seconds: 1),
        child: Image.asset(
          ImagePath.kCardLightActive,
        ),
      ),
    );
  }
}
