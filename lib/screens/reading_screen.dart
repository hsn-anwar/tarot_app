import 'package:circle_list/circle_list.dart';
import 'package:flutter/material.dart';
import 'package:tarot_app/global/background_template.dart';
import 'package:tarot_app/global/constants.dart';
import 'package:tarot_app/global/top_bar.dart';
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

  final _tween = TimelineTween<AniProps>()
    ..addScene(begin: 0.seconds, duration: 1.seconds)
        .animate(AniProps.x, tween: (-100.0).tweenTo(100.0))
    ..addScene(begin: 1.seconds, duration: 1.seconds)
        .animate(AniProps.y, tween: (-100.0).tweenTo(100.0))
    ..addScene(begin: 2.seconds, duration: 1.seconds)
        .animate(AniProps.x, tween: (100.0).tweenTo(-100.0))
    ..addScene(begin: 3.seconds, duration: 1.seconds)
        .animate(AniProps.y, tween: (100.0).tweenTo(-100.0));

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
                height: 250,
                child: CircleList(
                  origin: Offset(0, 150),
                  children: List.generate(
                    10,
                    (index) {
                      return LoopAnimation(
                        tween: _tween,
                        builder: (BuildContext context, Widget child,
                            TimelineValue<AniProps> value) {
                          return Transform.translate(
                            offset: Offset(
                              value.get(AniProps.x),
                              value.get(AniProps.y),
                            ),
                            child: Image.asset(ImagePath.kCardBack),
                          );
                        },
                        // child: Image.asset(ImagePath.kCardBack)
                      );
                    },
                  ),
                ),
              ),
              Spacer(),
              Container(
                alignment: Alignment.bottomCenter,
                height: SizeConfig.blockSizeVertical * 45,
                width: double.infinity,
                child: Stack(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          ImagePath.kPedestal,
                          fit: BoxFit.fitHeight,
                          height: SizeConfig.blockSizeVertical * 25,
                        ),
                        Spacer(),
                        Image.asset(
                          ImagePath.kPedestal,
                          fit: BoxFit.fitHeight,
                          height: SizeConfig.blockSizeVertical * 25,
                        ),
                      ],
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset(
                        ImagePath.kTable,
                        width: SizeConfig.screenWidth,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Column(
                      // mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: SizeConfig.blockSizeVertical * 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Image.asset(
                                ImagePath.kCardLightInactive,
                                width:
                                    SizeConfig.blockSizeHorizontal * lightSize,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Image.asset(
                                ImagePath.kCardLightInactive,
                                width:
                                    SizeConfig.blockSizeHorizontal * lightSize,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Image.asset(
                                ImagePath.kCardLightInactive,
                                width:
                                    SizeConfig.blockSizeHorizontal * lightSize,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Image.asset(
                                ImagePath.kCardLightInactive,
                                width:
                                    SizeConfig.blockSizeHorizontal * lightSize,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Image.asset(
                                ImagePath.kCardLightInactive,
                                width:
                                    SizeConfig.blockSizeHorizontal * lightSize,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Image.asset(
                                ImagePath.kCardLightInactive,
                                width:
                                    SizeConfig.blockSizeHorizontal * lightSize,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Image.asset(
                                ImagePath.kCardLightInactive,
                                width:
                                    SizeConfig.blockSizeHorizontal * lightSize,
                              ),
                            ),
                          ],
                        )
                      ],
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
