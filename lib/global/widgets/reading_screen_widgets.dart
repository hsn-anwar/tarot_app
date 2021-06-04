import 'dart:math';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:tarot_app/services/size_config.dart';

import '../constants.dart';

class ZoomedTableTop extends StatelessWidget {
  const ZoomedTableTop({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 200,
      padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 15),
      alignment: Alignment.bottomCenter,
      child: Image.asset(
        ImagePath.kTableZoomed,
        width: SizeConfig.screenWidth,
        fit: BoxFit.fill,
      ),
    );
  }
}

class ZoomedPedestals extends StatelessWidget {
  const ZoomedPedestals({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Container(
        child: Row(
          children: [
            Stack(
              children: [
                Container(
                  height: SizeConfig.blockSizeVertical * 25,
                  margin:
                      EdgeInsets.only(top: SizeConfig.blockSizeVertical * 6),
                  child: Image.asset(
                    ImagePath.kPedestal,
                    fit: BoxFit.fitHeight,
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
                  margin:
                      EdgeInsets.only(top: SizeConfig.blockSizeVertical * 6),
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
    );
  }
}

class SingleLight extends StatelessWidget {
  const SingleLight({Key key, @required this.bottom, @required this.left})
      : super(key: key);
  final double lightSize = 15;
  final double bottom;
  final double left;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: SizeConfig.blockSizeVertical * bottom,
      left: SizeConfig.blockSizeHorizontal * left,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Image.asset(
          ImagePath.kCardLightInactive,
          width: SizeConfig.blockSizeHorizontal * lightSize,
        ),
      ),
    );
  }
}

class AnimatedCard extends StatefulWidget {
  const AnimatedCard({
    Key key,
    @required this.cardKey,
    @required this.onAnimateCallback,
    @required this.alignmentX,
    @required this.alignmentY,
  }) : super(key: key);
  final GlobalKey<FlipCardState> cardKey;
  final Function onAnimateCallback;
  final double alignmentX;
  final double alignmentY;
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
            ? SizeConfig.blockSizeHorizontal * 15
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
            speed: 2 * 1000,
            front: !isCardRevealed
                ? Image.asset(ImagePath.kCardBack)
                : Image.asset(CharacterCardPath.diana),
            back: Image.asset(CharacterCardPath.diana),
          ),
        ),
      ),
      duration: Duration(seconds: 1),
      alignment: !animateCard
          ? Alignment(widget.alignmentX, widget.alignmentY)
          : Alignment.center,
    );
  }
}
