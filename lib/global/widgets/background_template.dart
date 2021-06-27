import 'package:flutter/material.dart';
import 'package:tarot_app/global/widgets/background_blur.dart';
import 'package:tarot_app/services/size_config.dart';

import '../constants.dart';

class BackgroundTemplate extends StatelessWidget {
  final Widget child;
  final bool blur;
  const BackgroundTemplate({Key key, this.child, @required this.blur})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImagePath.kBg),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          this.blur ? BackgroundBlur() : Container(),
          SafeArea(child: this.child ?? null),
        ],
      ),
    );
  }
}
