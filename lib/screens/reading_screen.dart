import 'package:circle_list/circle_list.dart';
import 'package:flutter/material.dart';
import 'package:tarot_app/global/background_template.dart';
import 'package:tarot_app/global/constants.dart';
import 'package:tarot_app/global/top_bar.dart';
import 'package:tarot_app/services/size_config.dart';

class ReadingScreen extends StatefulWidget {
  const ReadingScreen({Key key}) : super(key: key);
  static final String id = 'reading_screen';
  @override
  _ReadingScreenState createState() => _ReadingScreenState();
}

class _ReadingScreenState extends State<ReadingScreen> {
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
              CircleList(
                origin: Offset(0, 150),
                children: List.generate(
                  10,
                  (index) {
                    return Image.asset(ImagePath.kCardBack);
                  },
                ),
              ),
              Container(
                // height: SizeConfig.blockSizeVertical * 30,
                width: double.infinity,
                child: Stack(
                  children: [
                    Image.asset(
                      ImagePath.kTable,
                      width: SizeConfig.screenWidth,
                      fit: BoxFit.fitWidth,
                    ),
                    // Column(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   children: [
                    //     Row(
                    //       mainAxisAlignment: MainAxisAlignment.center,
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         Image.asset(
                    //           ImagePath.kCardLightInactive,
                    //           width: SizeConfig.blockSizeHorizontal * 25,
                    //         ),
                    //         Image.asset(
                    //           ImagePath.kCardLightInactive,
                    //           width: SizeConfig.blockSizeHorizontal * 25,
                    //         ),
                    //       ],
                    //     ),
                    //     Row(
                    //       mainAxisAlignment: MainAxisAlignment.center,
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         Image.asset(
                    //           ImagePath.kCardLightInactive,
                    //           width: SizeConfig.blockSizeHorizontal * 25,
                    //         ),
                    //         Image.asset(
                    //           ImagePath.kCardLightInactive,
                    //           width: SizeConfig.blockSizeHorizontal * 25,
                    //         ),
                    //         Image.asset(
                    //           ImagePath.kCardLightInactive,
                    //           width: SizeConfig.blockSizeHorizontal * 25,
                    //         ),
                    //       ],
                    //     ),
                    //     Row(
                    //       mainAxisAlignment: MainAxisAlignment.center,
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         Image.asset(
                    //           ImagePath.kCardLightInactive,
                    //           width: SizeConfig.blockSizeHorizontal * 25,
                    //         ),
                    //         Image.asset(
                    //           ImagePath.kCardLightInactive,
                    //           width: SizeConfig.blockSizeHorizontal * 25,
                    //         ),
                    //       ],
                    //     )
                    //   ],
                    // )
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
