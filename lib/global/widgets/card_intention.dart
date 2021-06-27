import 'package:flutter/material.dart';
import 'package:spring/spring.dart';
import 'package:tarot_app/services/size_config.dart';

class CardIntention extends StatelessWidget {
  const CardIntention(
      {Key key,
      @required this.alignment,
      @required this.intention,
      @required this.isCardSelected,
      @required this.isCardRevealed,
      @required this.controller})
      : super(key: key);
  final Alignment alignment;
  final String intention;
  final bool isCardSelected;
  final SpringController controller;
  final bool isCardRevealed;
  @override
  Widget build(BuildContext context) {
    return this.isCardRevealed
        ? Spring.blink(
            springController: this.controller,
            startOpacity: 1,
            endOpacity: 0,
            animDuration: Duration(milliseconds: isCardSelected ? 800 : 0),
            child: Align(
              alignment: this.alignment,
              child: Container(
                alignment: Alignment(0, 0),
                width: SizeConfig.blockSizeHorizontal * 30,
                height: SizeConfig.blockSizeVertical * 5,
                // color: Colors.red,
                child: Card(
                  color: Color.fromARGB(255, 54, 27, 68).withOpacity(0.7),
                  shape: RoundedRectangleBorder(
                      side: new BorderSide(color: Colors.purple, width: 2.0),
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      this.intention,
                      style: TextStyle(color: Colors.white, fontSize: 11),
                    ),
                  ),
                ),
              ),
            ),
          )
        : Container();
  }
}
