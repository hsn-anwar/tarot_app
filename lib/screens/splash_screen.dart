import 'package:flutter/material.dart';
import 'package:tarot_app/screens/home_screen.dart';
import 'package:tarot_app/services/size_config.dart';
import 'package:spring/spring.dart';
import 'dart:io';

// https://pub.dev/packages/path_provider
import 'package:path_provider/path_provider.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'splash_screen';

  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SpringController _springController =
      SpringController(initialAnim: Motion.pause);

  AnimStatus animStatus;

  int imageIndex = 0;

  void loadImages() async {
    precacheImage(AssetImage('...'), context);
  }

  List<String> splashScreenImages = [
    'assets/images/splash_logo1.png',
    'assets/images/splash_logo2.png',
    'assets/images/splash_logo3.png',
    'assets/images/splash_logo4.png'
  ];

  void transitionPage() {
    Future.delayed(Duration(milliseconds: 500), () {
      Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                HomeScreen(),
            transitionDuration: Duration(seconds: 2),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ));
    });
  }

  void initializeScreen() async {
    await Future.delayed(Duration(milliseconds: 1000), () {});

    await Future.delayed(Duration(milliseconds: 1000), () {
      setState(() {
        imageIndex = 1;
      });
    });
    await Future.delayed(Duration(milliseconds: 1000), () {
      setState(() {
        imageIndex = 2;
      });
    });
    await Future.delayed(Duration(milliseconds: 1000), () {
      setState(() {
        imageIndex = 3;
      });
    });
    await Future.delayed(Duration(milliseconds: 400), () {});

    // Future.delayed(Duration(milliseconds: 100), (){});
    _springController.play(motion: Motion.play);
  }

  Image myImage1;
  Image myImage2;
  Image myImage3;
  Image myImage4;

  @override
  void initState() {
    super.initState();

    myImage1 = Image.asset(splashScreenImages[0], gaplessPlayback: true);
    myImage2 = Image.asset(splashScreenImages[1], gaplessPlayback: true);
    myImage3 = Image.asset(splashScreenImages[2], gaplessPlayback: true);
    myImage4 = Image.asset(splashScreenImages[3], gaplessPlayback: true);

    initializeScreen();
  }

  @override
  void didChangeDependencies() {
    print('did change called');

    super.didChangeDependencies();
    // precacheImage(myImage1.image, context);
    // precacheImage(myImage2.image, context);
    // precacheImage(myImage3.image, context);
    // precacheImage(myImage4.image, context);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 139, 59, 139),
      body: SafeArea(
        child: Container(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          child: Column(
            children: [
              SizedBox(height: SizeConfig.blockSizeVertical * 15),
              Spring.translate(
                springController: _springController,
                beginOffset: Offset(0, SizeConfig.blockSizeVertical * 19),
                endOffset: Offset.zero,
                animStatus: (AnimStatus _status) {
                  animStatus = _status;
                  if (_status == AnimStatus.completed) {
                    _springController.play(motion: Motion.pause);

                    transitionPage();
                  } else if (_status == AnimStatus.dismissed) {
                    _springController.play(motion: Motion.pause);
                  }
                },
                child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 1),
                  child: Container(
                    key: ValueKey(imageIndex),
                    width: SizeConfig.blockSizeVertical * 20,
                    child: imageIndex == 0
                        ? myImage1
                        : imageIndex == 1
                            ? myImage2
                            : imageIndex == 2
                                ? myImage3
                                : myImage4,
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 40,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     ElevatedButton(
              //         onPressed: () {
              //           transitionPage();
              //         },
              //         child: Text('Transition')),
              //     SizedBox(
              //       width: 25,
              //     ),
              //     ElevatedButton(
              //         onPressed: () {
              //           if (animStatus == AnimStatus.completed) {
              //             _springController.play(motion: Motion.reverse);
              //           } else {
              //             _springController.play();
              //           }
              //         },
              //         child: Text('Translate')),
              //     SizedBox(
              //       width: 25,
              //     ),
              //     ElevatedButton(
              //         onPressed: () {
              //           setState(() {
              //             if (imageIndex <= 2) {
              //               imageIndex++;
              //             } else {
              //               imageIndex = 0;
              //             }
              //           });
              //         },
              //         child: Text('Switch'))
              //   ],
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     ElevatedButton(
              //         onPressed: () async {}, child: Text('Automate')),
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}
