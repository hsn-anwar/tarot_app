import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tarot_app/screens/browse_cards_screen.dart';
import 'package:tarot_app/screens/card_reveal.dart';
import 'package:tarot_app/screens/formation_screen.dart';
import 'package:tarot_app/screens/home_screen.dart';
import 'package:tarot_app/screens/reading_screens/single_card_formation_reading_screen.dart';
import 'package:tarot_app/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
      path: 'assets/translations',
      supportedLocales: [Locale('en'), Locale('de')],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  Image myImage1;
  Image myImage2;
  Image myImage3;
  Image myImage4;
  List<String> splashScreenImages = [
    'assets/images/splash_logo1.png',
    'assets/images/splash_logo2.png',
    'assets/images/splash_logo3.png',
    'assets/images/splash_logo4.png'
  ];
  @override
  Widget build(BuildContext context) {
    myImage1 = Image.asset(splashScreenImages[0], gaplessPlayback: true);
    myImage2 = Image.asset(splashScreenImages[1], gaplessPlayback: true);
    myImage3 = Image.asset(splashScreenImages[2], gaplessPlayback: true);
    myImage4 = Image.asset(splashScreenImages[3], gaplessPlayback: true);
    precacheImage(myImage1.image, context);
    precacheImage(myImage2.image, context);
    precacheImage(myImage3.image, context);
    precacheImage(myImage4.image, context);

    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Flutter Demo',
      theme: ThemeData(
          // primarySwatch: Colors.blue,
          ),
      home: SplashScreen(),
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        FormationScreen.id: (context) => FormationScreen(),
        BrowseCardsScreen.id: (context) => BrowseCardsScreen(),
        SplashScreen.id: (context) => SplashScreen(),
        CardRevealScreen.id: (context) => CardRevealScreen(),
        SingleCardFormationScreen.id: (context) => SingleCardFormationScreen(),
      },
    );
  }
}
