import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tarot_app/services/size_config.dart';

class BackgroundBlur extends StatelessWidget {
  const BackgroundBlur({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: SizeConfig.screenHeight,
      width: SizeConfig.screenWidth,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
        child: Container(
          color: Colors.black.withOpacity(0.2),
        ),
      ),
    );
  }
}
