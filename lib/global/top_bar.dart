import 'package:flutter/material.dart';

import 'buttons/setting_button.dart';

class TopBar extends StatelessWidget {
  final String title;

  const TopBar({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(onTap: showMenu, child: CloseIcon()),
        Spacer(),
        Text(this.title),
        Spacer(),
        GestureDetector(onTap: showMenu, child: SettingIcon()),
      ],
    );
  }
}
