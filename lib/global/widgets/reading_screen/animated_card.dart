import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:tarot_app/services/size_config.dart';

import '../../constants.dart';

class AnimatedCard extends StatefulWidget {
  const AnimatedCard({
    Key key,
    @required this.cardKey,
    @required this.onAnimateCallback,
    @required this.alignmentX,
    @required this.alignmentY,
    this.cardSize,
  }) : super(key: key);
  final GlobalKey<FlipCardState> cardKey;
  final Function onAnimateCallback;
  // final Function toggleDetailsCallback;
  // final Function closeCardCallback;
  final double alignmentX;
  final double alignmentY;
  final double cardSize;
  @override
  _AnimatedCardState createState() => _AnimatedCardState();
}

class _AnimatedCardState extends State<AnimatedCard> {
  bool animateCard = false;
  bool isCardRevealed = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedAlign(
      child: AnimatedContainer(
        width: !animateCard
            ? SizeConfig.blockSizeHorizontal * widget.cardSize
            : SizeConfig.screenWidth,
        duration: Duration(seconds: 1),
        child: GestureDetector(
          onTap: () {
            setState(() {
              print('tapped');
              animateCard = !animateCard;
              widget.onAnimateCallback(animateCard);

              if (!isCardRevealed) {
                Future.delayed(const Duration(milliseconds: 300), () {
                  widget.cardKey.currentState.toggleCard();
                  isCardRevealed = true;
                });
              }
            });
          },
          child: FlipCard(
            key: widget.cardKey,
            flipOnTouch: false,
            speed: 1 * 1000,
            front: !isCardRevealed
                ? Image.asset(
                    ImagePath.kCardBack,
                    width: SizeConfig.screenWidth,
                  )
                : Image.asset(
                    CharacterCardPath.diana,
                    width: SizeConfig.screenWidth,
                  ),
            back: Image.asset(
              CharacterCardPath.diana,
              width: SizeConfig.screenWidth,
            ),
          ),
        ),
      ),
      duration: Duration(seconds: 1),
      alignment: !animateCard
          ? Alignment(
              widget.alignmentX,
              widget.alignmentY,
            )
          : Alignment.center,
    );
  }
}
