import 'package:flutter/material.dart';

import 'buttons/setting_button.dart';

class TopBar extends StatelessWidget {
  final String title;
  final Function onSettingsTapped;
  const TopBar({Key key, @required this.title, this.onSettingsTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(onTap: showMenu, child: CloseIcon()),
        Spacer(),
        Text(
          this.title,
          style: TextStyle(
              color: Colors.white, fontSize: 25.0, fontFamily: 'baskvill'),
        ),
        Spacer(),
        GestureDetector(onTap: this.onSettingsTapped, child: SettingIcon()),
      ],
    );
  }
}
