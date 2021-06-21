import 'package:flutter/material.dart';
import 'package:tarot_app/screens/home_screen.dart';
import 'package:tarot_app/services/size_config.dart';
import 'package:spring/spring.dart';

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

  List<String> splashScreenImages = [
    'assets/images/splash_logo1.png',
    'assets/images/splash_logo2.png',
    'assets/images/splash_logo3.png',
    'assets/images/splash_logo4.png'
  ];

  Image image1 = Image.asset('assets/images/splash_logo1.png');
  Image image2 = Image.asset('assets/images/splash_logo2.png');
  Image image3 = Image.asset('assets/images/splash_logo3.png');
  Image image4 = Image.asset('assets/images/splash_logo4.png');

  void transitionPage() {
    Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => HomeScreen(),
          transitionDuration: Duration(seconds: 2),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ));
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
                      width: SizeConfig.blockSizeVertical * 20,
                      child: Image.asset(splashScreenImages[imageIndex])),
                ),
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        transitionPage();
                      },
                      child: Text('Transition')),
                  SizedBox(
                    width: 25,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (animStatus == AnimStatus.completed) {
                          _springController.play(motion: Motion.reverse);
                        } else {
                          _springController.play();
                        }
                      },
                      child: Text('Translate')),
                  SizedBox(
                    width: 25,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (imageIndex <= 2) {
                            imageIndex++;
                          } else {
                            imageIndex = 0;
                          }
                        });
                      },
                      child: Text('Switch'))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        await Future.delayed(Duration(milliseconds: 400), () {
                          setState(() {
                            imageIndex = 1;
                          });
                        });
                        await Future.delayed(Duration(milliseconds: 400), () {
                          setState(() {
                            imageIndex = 2;
                          });
                        });
                        await Future.delayed(Duration(milliseconds: 400), () {
                          setState(() {
                            imageIndex = 3;
                          });
                        });
                        // Future.delayed(Duration(milliseconds: 100), (){});
                        _springController.play(motion: Motion.play);
                      },
                      child: Text('Automate')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
