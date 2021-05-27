import 'dart:math';

import 'package:circle_list/circle_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tarot_app/global/widgets/background_template.dart';
import 'package:tarot_app/global/constants.dart';
import 'package:tarot_app/global/widgets/top_bar.dart';
import 'package:tarot_app/services/size_config.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

enum AniProps { x, y }

class ReadingScreen extends StatefulWidget {
  const ReadingScreen({Key key}) : super(key: key);
  static final String id = 'reading_screen';
  @override
  _ReadingScreenState createState() => _ReadingScreenState();
}

class _ReadingScreenState extends State<ReadingScreen> {
  double lightSize = 15;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImagePath.kReadingBg),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              TopBar(title: ''),
              Container(
                height: SizeConfig.blockSizeVertical * 30,
                child: CircleList(
                  origin: Offset(0, 150),
                  children: List.generate(
                    10,
                    (index) {
                      return Image.asset(ImagePath.kCardBack);
                      // child: Image.asset(ImagePath.kCardBack)
                    },
                  ),
                ),
              ),
              Spacer(),
              Container(
                alignment: Alignment.bottomCenter,
                height: SizeConfig.blockSizeVertical * 50,
                width: double.infinity,
                child: Stack(
                  children: [
                    Positioned(
                      child: Container(
                        child: Row(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: SizeConfig.blockSizeVertical * 25,
                                  margin: EdgeInsets.only(
                                      top: SizeConfig.blockSizeVertical * 6),
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
                                    width: SizeConfig.blockSizeHorizontal * 18,
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
                            Spacer(),
                            Stack(
                              children: [
                                Container(
                                  height: SizeConfig.blockSizeVertical * 25,
                                  margin: EdgeInsets.only(
                                      top: SizeConfig.blockSizeVertical * 6),
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
                                    width: SizeConfig.blockSizeHorizontal * 18,
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
                      ),
                    ),
                    Container(
                      // height: 200,
                      padding: EdgeInsets.only(
                          top: SizeConfig.blockSizeVertical * 15),
                      alignment: Alignment.bottomCenter,
                      child: Image.asset(
                        ImagePath.kTable,
                        width: SizeConfig.screenWidth,
                        fit: BoxFit.fill,
                      ),
                    ),
                    // Container(
                    //   alignment: Alignment.topCenter,
                    //   height: SizeConfig.blockSizeVertical * 45,
                    // ),
                    Container(
                      child: Positioned(
                        bottom: SizeConfig.blockSizeVertical * 8,
                        left: SizeConfig.blockSizeHorizontal * 16,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          // mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: SizeConfig.blockSizeVertical * 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Image.asset(
                                    ImagePath.kCardLightInactive,
                                    width: SizeConfig.blockSizeHorizontal *
                                        lightSize,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Image.asset(
                                    ImagePath.kCardLightInactive,
                                    width: SizeConfig.blockSizeHorizontal *
                                        lightSize,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: Image.asset(
                                    ImagePath.kCardLightInactive,
                                    width: SizeConfig.blockSizeHorizontal *
                                        lightSize,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: Image.asset(
                                    ImagePath.kCardLightInactive,
                                    width: SizeConfig.blockSizeHorizontal *
                                        lightSize,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: Image.asset(
                                    ImagePath.kCardLightInactive,
                                    width: SizeConfig.blockSizeHorizontal *
                                        lightSize,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: Image.asset(
                                    ImagePath.kCardLightInactive,
                                    width: SizeConfig.blockSizeHorizontal *
                                        lightSize,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: Image.asset(
                                    ImagePath.kCardLightInactive,
                                    width: SizeConfig.blockSizeHorizontal *
                                        lightSize,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
