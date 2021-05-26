import 'package:flutter/material.dart';
import 'package:tarot_app/services/size_config.dart';

import '../buttons/setting_button.dart';

class TopBar extends StatelessWidget {
  final String title;
  final Function onSettingsTapped;
  const TopBar({Key key, @required this.title, this.onSettingsTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CloseIcon(),
          Spacer(),
          Text(
            this.title,
            style: TextStyle(
                color: Colors.white, fontSize: 25.0, fontFamily: 'baskvill'),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 0.0),
            child: Container(
              width: SizeConfig.blockSizeHorizontal * 8,
            ),
          ),
        ],
      ),
    );
  }
}
