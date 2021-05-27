import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class ImagePath {
  static const String kImagePath = 'assets/images/';
  static const String kBg = kImagePath + 'Main BG.png';
  static const String kCardIcon = kImagePath + 'Card Icon.png';
  static const String kBackButton = kImagePath + 'Back Button.png';
  static const String kBrowseCardIcon = kImagePath + 'Browse Card Icon.png';
  static const String kCardBack = kImagePath + 'Card Back Final 1080.png';
  static const String kCardLightActive = kImagePath + 'Card Light Active.png';
  static const String kCardLightInactive =
      kImagePath + 'Card Light Inactive.png';
  static const String kCardRackTopVineOne =
      kImagePath + 'Card Rack 1 top vine.png';
  static const String kCardRackOne = kImagePath + 'Card Rack 1.png';
  static const String kCardRackTopVineTwo =
      kImagePath + 'Card Rack 2 top vine.png';
  static const String kCardRackTwo = kImagePath + 'Card Rack 2.png';
  static const String kCardReadingOverlay =
      kImagePath + 'Card Reading Overlay.png';
  static const String kCloseButton = kImagePath + 'Close button.png';
  static const String kInfoButton = kImagePath + 'Info Button.png';
  static const String kLogoIcon = kImagePath + 'Logo Icon.png';
  static const String kLogo = kImagePath + 'Logo.png';
  static const String kPedestal = kImagePath + 'Pedestal.png';
  static const String kReadingBg = kImagePath + 'Reading BG.png';
  static const String kSettingsButton = kImagePath + 'Settings button.png';
  static const String kTableZoomed = kImagePath + 'Table Zoomed.png';
  static const String kTable = kImagePath + 'Table.png';
  static const String flame = kImagePath + 'flame.gif';
  static const String intentionsBackButton =
      kImagePath + 'Intentions Back Button.png';
  static const String brazier = kImagePath + 'Brazier.png';
}

class CharacterCardPath {
  static const String kImagePath = 'assets/characters/';
  static const String ambael = kImagePath + 'Ambael.png';
  static const String adrasteia = kImagePath + 'Adrasteia.png';
  static const String diana = kImagePath + 'Diana.png';
  static const String earth = kImagePath + 'Earth.png';
}

class MusicPath {
  static const String kMusicPath = 'assets/';
  static const String _ext = '.mp3';
  // kMusicPath + '' + _ext;
  static const String relaxing = kMusicPath + 'relaxing' + _ext;
  static const String epic_1 = kMusicPath + 'epic_option_1' + _ext;
  static const String epic_2 = kMusicPath + 'epic_option_2' + _ext;
  static const String atmo = kMusicPath + 'atmo' + _ext;
}

class CustomFonts {
  static const sherlock = 'sherlock';
  static const malgun = 'malgun';
  static const baskvill = 'baskvill';
}

class SingleCardIntentions {
  static final intention1 = 'single_card_int_1'.tr();
  static final intention2 = 'single_card_int_2'.tr();
  static final intention3 = 'single_card_int_3'.tr();
  static final intention4 = 'single_card_int_4'.tr();
  static final intention5 = 'single_card_int_5'.tr();
  static final intention6 = 'single_card_int_6'.tr();
  static final intention7 = 'single_card_int_7'.tr();
  static final intention8 = 'single_card_int_8'.tr();
  static final intention9 = 'single_card_int_9'.tr();
  static final intention10 = 'single_card_int_10'.tr();
  static final intention11 = 'single_card_int_11'.tr();
  static final intention12 = 'single_card_int_12'.tr();
  static final intention13 = 'single_card_int_13'.tr();
  static final intention14 = 'single_card_int_14'.tr();
  static final intention15 = 'single_card_int_15'.tr();
  static final intention16 = 'single_card_int_16'.tr();
  static final intention17 = 'single_card_int_17'.tr();
  static final intention18 = 'single_card_int_18'.tr();
}

class ThreeCardIntentions {
  static final String intention1 = 'three_card_int_1'.tr();
  static final intention2 = 'three_card_int_2'.tr();
  static final intention3 = 'three_card_int_3'.tr();
  static final intention4 = 'three_card_int_4'.tr();
  static final intention5 = 'three_card_int_5'.tr();
  static final intention6 = 'three_card_int_6'.tr();
  static final intention7 = 'three_card_int_7'.tr();
  static final intention8 = 'three_card_int_8'.tr();
  static final intention9 = 'three_card_int_9'.tr();
  static final intention10 = 'three_card_int_10'.tr();
}

class SevenCardIntentions {
  static final intention1 = 'seven_card_int_1'.tr();
}

class FormationInfo {
  static final String single = "single_card_info".tr();
  static final String three = "three_card_info".tr();
  static final String seven = "seven_card_info".tr();
}

TextStyle kInfoTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 17,
  fontFamily: CustomFonts.malgun,
);
