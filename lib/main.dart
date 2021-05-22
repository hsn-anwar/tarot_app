import 'package:audioplayers/audioplayers.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tarot_app/screens/browse_cards_screen.dart';
import 'package:tarot_app/screens/formation_screen.dart';
import 'package:tarot_app/screens/home_screen.dart';
import 'package:tarot_app/services/music_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
      path: 'assets/translations',
      supportedLocales: [Locale('en'), Locale('de')],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  // audioManager

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Flutter Demo',
      theme: ThemeData(
          // primarySwatch: Colors.blue,
          ),
      home: HomeScreen(),
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        FormationScreen.id: (context) => FormationScreen(),
        BrowseCardsScreen.id: (context) => BrowseCardsScreen(),
      },
    );
  }
}
