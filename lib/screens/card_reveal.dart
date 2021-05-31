import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:tarot_app/global/constants.dart';
import 'package:tarot_app/global/widgets/background_blur.dart';
import 'package:tarot_app/global/widgets/background_template.dart';

class CardRevealScreen extends StatefulWidget {
  const CardRevealScreen({Key key}) : super(key: key);
  static const String id = '/card_reveal_screen';
  @override
  _CardRevealScreenState createState() => _CardRevealScreenState();
}

class _CardRevealScreenState extends State<CardRevealScreen> {
  void flipCard() {
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        cardKey.currentState.toggleCard();
      });
    });
  }

  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  @override
  void initState() {
    flipCard();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        cardKey.currentState.toggleCard();
        await Future.delayed(Duration(milliseconds: 500), () {});
        return true;
      },
      child: Scaffold(
        body: BackgroundTemplate(
          child: Stack(
            children: [
              BackgroundBlur(),
              FlipCard(
                  key: cardKey,
                  front: Hero(
                      tag: 'card1', child: Image.asset(ImagePath.kCardBack)),
                  back: Image.asset(CharacterCardPath.earth)),
            ],
          ),
        ),
      ),
    );
  }
}
