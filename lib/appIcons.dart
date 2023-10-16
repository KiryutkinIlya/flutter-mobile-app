// Place fonts/appIcons.ttf in your fonts/ directory and
// add the following to your pubspec.yaml
// flutter:
//   fonts:
//    - family: appIcons
//      fonts:
//       - asset: fonts/appIcons.ttf

// Flutter imports:
import 'package:flutter/widgets.dart';

class AppIcons {
  AppIcons._();

  static const String _fontFamily = 'appIcons';

  static const IconData error = IconData(0xe901, fontFamily: _fontFamily);
  static const IconData sunrise = IconData(0xe902, fontFamily: _fontFamily);
  static const IconData sunset = IconData(0xe900, fontFamily: _fontFamily);
  static const IconData sunDay = IconData(0xe904, fontFamily: _fontFamily);
  static const IconData rainyDay = IconData(0xe903, fontFamily: _fontFamily);
  static const IconData moon = IconData(0xe905, fontFamily: _fontFamily);

}
