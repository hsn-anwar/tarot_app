import 'package:flutter/material.dart';
import 'package:tarot_app/services/size_config.dart';

import '../../constants.dart';

class SingleFormationLight extends StatelessWidget {
  const SingleFormationLight(
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
        width: SizeConfig.blockSizeHorizontal * (!this.zoom ? 30 : 35),
        duration: Duration(seconds: 1),
        child: Image.asset(
          ImagePath.kCardLightActive,
        ),
      ),
    );
  }
}

class ThreeFormationLight extends StatelessWidget {
  const ThreeFormationLight(
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
        width: SizeConfig.blockSizeHorizontal * (!this.zoom ? 27 : 30),
        duration: Duration(seconds: 1),
        child: Image.asset(
          ImagePath.kCardLightActive,
        ),
      ),
    );
  }
}

class SevenFormationLight extends StatelessWidget {
  const SevenFormationLight(
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
        width: SizeConfig.blockSizeHorizontal * (!this.zoom ? 18 : 22),
        duration: Duration(seconds: 1),
        child: IgnorePointer(
          child: Image.asset(
            ImagePath.kCardLightActive,
          ),
        ),
      ),
    );
  }
}
