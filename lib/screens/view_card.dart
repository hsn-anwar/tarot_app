import 'package:flutter/material.dart';
import 'package:tarot_app/global/buttons/small_rounded_button.dart';
import 'package:tarot_app/global/constants.dart';
import 'package:tarot_app/global/widgets/background_blur.dart';
import 'package:tarot_app/global/widgets/background_template.dart';
import 'package:tarot_app/models/character_card.dart';
import 'package:tarot_app/screens/card_view.dart';
import 'package:tarot_app/services/size_config.dart';
import 'package:easy_localization/easy_localization.dart';

class ViewCard extends StatefulWidget {
  const ViewCard({Key key, @required this.card}) : super(key: key);
  final CharacterCard card;
  @override
  _ViewCardState createState() => _ViewCardState();
}

class _ViewCardState extends State<ViewCard> {
  bool showCardInfo = false;
  bool showButtons = false;
  void toggleShowCardInfo() {}
  void toggleCardInfo() {}

  void initializeScreen() {
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        showButtons = true;
      });
    });
  }

  @override
  void initState() {
    initializeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: BackgroundTemplate(
        child: Stack(
          children: [
            BackgroundBlur(),
            AnimatedPositioned(
              bottom: !showButtons
                  ? SizeConfig.blockSizeVertical * 15
                  : SizeConfig.blockSizeVertical * 5,
              child: Container(
                width: SizeConfig.screenWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        toggleShowCardInfo();
                      },
                      child: Container(
                        width: SizeConfig.blockSizeHorizontal * 10,
                        child: Image.asset(ImagePath.kBackButton),
                      ),
                    ),
                    SizedBox(
                      width: SizeConfig.blockSizeHorizontal * 5,
                    ),
                    RoundedButton2(
                      title: showCardInfo == false ? "read".tr() : "hide".tr(),
                      onTap: toggleCardInfo,
                    ),
                  ],
                ),
              ),
              duration: Duration(seconds: 2),
            ),
            Container(
              height: SizeConfig.screenHeight,
              child: Center(
                child: Hero(
                    tag: '${widget.card.name}',
                    child: Image.asset(widget.card.path)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
