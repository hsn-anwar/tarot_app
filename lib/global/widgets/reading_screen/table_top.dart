import 'package:flutter/material.dart';
import 'package:tarot_app/services/size_config.dart';

import '../../constants.dart';

class TableTop extends StatelessWidget {
  const TableTop({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 200,
      padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 15),
      alignment: Alignment.center,
      child: Image.asset(
        ImagePath.kTable,
        width: SizeConfig.screenWidth,
        fit: BoxFit.fill,
      ),
    );
  }
}
