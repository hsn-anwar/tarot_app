import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tarot_app/services/size_config.dart';

import '../../constants.dart';

class Pedestals extends StatelessWidget {
  const Pedestals({Key key, @required this.zoom}) : super(key: key);

  final bool zoom;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                height: SizeConfig.blockSizeVertical * 28,
                margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 1),
                child: Image.asset(
                  ImagePath.kPedestal,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                bottom: SizeConfig.blockSizeVertical * 18,
                left: SizeConfig.blockSizeHorizontal * 7,
                child: Container(
                  // color: Colors.pink,
                  padding: EdgeInsets.all(8),
                  width: SizeConfig.blockSizeHorizontal * 25,
                  child: Image.asset(
                    ImagePath.brazier,
                    fit: BoxFit.fill,
                    // height:
                    // SizeConfig.blockSizeHorizontal * 10,
                    // width: SizeConfig.blockSizeHorizontal * 25,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: SizedBox(),
          ),
          Stack(
            children: [
              Container(
                height: SizeConfig.blockSizeVertical * 28,
                margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 1),
                child: Image.asset(
                  ImagePath.kPedestal,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                bottom: SizeConfig.blockSizeVertical * 18,
                left: SizeConfig.blockSizeHorizontal * 20,
                child: Container(
                  // color: Colors.pink,
                  padding: EdgeInsets.all(8),
                  width: SizeConfig.blockSizeHorizontal * 25,
                  child: Transform(
                    transform: Matrix4.rotationY(pi),
                    child: Image.asset(
                      ImagePath.brazier,
                      fit: BoxFit.fill,
                      // height:
                      // SizeConfig.blockSizeHorizontal * 10,
                      // width: SizeConfig.blockSizeHorizontal * 25,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
