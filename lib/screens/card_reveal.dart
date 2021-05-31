import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:tarot_app/global/constants.dart';
import 'package:tarot_app/global/widgets/background_blur.dart';
import 'package:tarot_app/global/widgets/background_template.dart';

class CardRevealScreen extends StatefulWidget {
  const CardRevealScreen({Key key, this.card, this.cardIndex, this.isRevealed})
      : super(key: key);
  static const String id = '/card_reveal_screen';

  final String card;
  final String cardIndex;
  final bool isRevealed;
  @override
  _CardRevealScreenState createState() => _CardRevealScreenState();
}

class _CardRevealScreenState extends State<CardRevealScreen> {
  void flipCard() {
    if (!widget.isRevealed) {
      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          cardKey.currentState.toggleCard();
        });
      });
    }
  }

  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  @override
  void initState() {
    flipCard();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundTemplate(
        child: Stack(
          children: [
            BackgroundBlur(),
            Center(
              child: FlipCard(
                  key: cardKey,
                  front: Hero(
                    tag: widget.cardIndex,
                    child: !widget.isRevealed
                        ? Image.asset(ImagePath.kCardBack)
                        : Image.asset(widget.card),
                  ),
                  back: Image.asset(widget.card)),
            ),
          ],
        ),
      ),
    );
  }
}
