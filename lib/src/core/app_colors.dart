

import 'package:flutter/material.dart';
import 'package:ass_project/src/core/app_strings.dart';
import 'package:ass_project/src/core/utils/hex_color.dart';


class AppColors{

  static var pop_up_menuTextStyle = const TextStyle(
   fontFamily: AppStrings.fontFamily2,
   fontStyle: FontStyle.normal,
   fontWeight: FontWeight.w400,
   fontSize: 12.0,
   color: Color.fromRGBO(255, 255, 255, 1),
 );

  static Color primaryUp = HexColor("#353434");
  static Color primaryDown = HexColor("#353434");

  static Color primary = HexColor("#111111");
  static Color secondary = HexColor("#393939");

  static Color primaryButton = HexColor("#0029FF");
  static Color secondaryButton = HexColor("#369FFF");

  static Color inputColor = HexColor("#2d2c2d");

  static Color hint = Colors.grey;
  
}