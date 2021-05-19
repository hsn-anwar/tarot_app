import 'package:flutter/material.dart';
import 'package:tarot_app/global/background_template.dart';
import 'package:tarot_app/global/buttons/small_rounded_button.dart';
import 'package:tarot_app/global/constants.dart';
import 'package:tarot_app/global/top_bar.dart';
import 'package:tarot_app/screens/view_card.dart';
import 'package:tarot_app/services/size_config.dart';
import 'package:easy_localization/easy_localization.dart';

class BrowseCardsScreen extends StatefulWidget {
  static final String id = '/browse_cards';
  @override
  _BrowseCardsScreenState createState() => _BrowseCardsScreenState();
}

class _BrowseCardsScreenState extends State<BrowseCardsScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: false == true
          ? SafeArea(
              child: Column(
                children: [
                  ViewCard(),
                  RoundedButton2(
                    title: "read".tr(),
                    onTap: () {},
                  ),
                ],
              ),
            )
          : BackgroundTemplate(
              child: Column(
                children: [
                  TopBar(title: 'Browse Cards'),
                  Text(
                    'Welcoming text or short explanation about the app and its purpose',
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: SizeConfig.blockSizeVertical * 10,
                      ),
                      Container(
                        height: 150,
                        width: double.infinity,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                width: double.infinity,
                                child: Image.asset(
                                  ImagePath.kCardRackOne,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Container(
                                    // color: Colors.pink,
                                    width: 100,
                                    height: 100,
                                    child: Image.asset(
                                      ImagePath.kCardBack,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Container(
                                    // color: Colors.pink,
                                    width: 100,
                                    height: 100,
                                    child: Image.asset(
                                      ImagePath.kCardBack,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Container(
                                    // color: Colors.pink,
                                    width: 100,
                                    height: 100,
                                    child: Image.asset(
                                      ImagePath.kCardBack,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Container(
                                    // color: Colors.pink,
                                    width: 100,
                                    height: 100,
                                    child: Image.asset(
                                      ImagePath.kCardBack,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                width: SizeConfig.screenWidth,
                                child: Image.asset(
                                  ImagePath.kCardRackTopVineOne,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical * 10,
                      ),
                      Stack(
                        children: [
                          Container(
                            width: SizeConfig.screenWidth,
                            child: Image.asset(
                              ImagePath.kCardRackTwo,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          Container(
                            width: SizeConfig.screenWidth,
                            child: Image.asset(
                              ImagePath.kCardRackTopVineTwo,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical * 10,
                      ),
                      Stack(
                        children: [
                          Container(
                            width: SizeConfig.screenWidth,
                            child: Image.asset(
                              ImagePath.kCardRackOne,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          Container(
                            width: SizeConfig.screenWidth,
                            child: Image.asset(
                              ImagePath.kCardRackTopVineOne,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
