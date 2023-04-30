import 'package:flutter/material.dart';

import '../export.dart';

class TextStyles {
  final euclidRegular = TextStyle(
    fontFamily: "EuclidSquare",
    color: Colors.black,
    fontSize: sizes.fontRatio * 17,
    fontWeight: FontWeight.w400,
  );

  final euclidBold = TextStyle(
      color: colors.black,
      fontFamily: "EuclidSquare",
      fontSize: sizes.fontRatio * 20,
      fontWeight: FontWeight.w500);

  final euclidLight = TextStyle(
    color: colors.black,
    fontFamily: "EuclidSquare",
    fontSize: sizes.fontRatio * 16,
  );

  final cabinRegular = TextStyle(
      fontFamily: "Cabin",
      color: Colors.black,
      fontSize: sizes.fontRatio * 18,
      fontWeight: FontWeight.w400);

  final cabinBold = TextStyle(
      color: colors.black,
      fontFamily: "Cabin",
      fontSize: sizes.fontRatio * 20,
      fontWeight: FontWeight.w500);

  final cabinLight = TextStyle(
    color: colors.black,
    fontFamily: "Cabin",
    fontSize: sizes.fontRatio * 14,
    fontWeight: FontWeight.w400,
  );
}
