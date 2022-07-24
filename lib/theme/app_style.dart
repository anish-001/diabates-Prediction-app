import 'package:flutter/material.dart';

import '../utils/color_constant.dart';
import '../utils/math_utils.dart';

class AppStyle {
  static TextStyle textstylenunitosansbold16 =
      textstylenunitosansregular16.copyWith(
    fontWeight: FontWeight.w700,
  );

  static TextStyle textstyleregular20 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle textstylenunitosansbold281 =
      textstylenunitosansbold22.copyWith(
    fontSize: getFontSize(
      28,
    ),
  );

  static TextStyle textstyleoutfitmedium12 = TextStyle(
    color: ColorConstant.bluegray700,
    fontSize: getFontSize(
      12,
    ),
    fontFamily: 'Outfit',
    fontWeight: FontWeight.w500,
  );

  static TextStyle textstylenunitosansbold27 = TextStyle(
    color: ColorConstant.black901,
    fontSize: getFontSize(
      27,
    ),
    fontFamily: 'Nunito Sans',
    fontWeight: FontWeight.w700,
  );

  static TextStyle textstylenunitosansregular14 =
      textstylenunitosansregular141.copyWith(
    color: ColorConstant.black900,
  );

  static TextStyle textstylenunitosansbold28 =
      textstylenunitosansbold281.copyWith(
    color: ColorConstant.black900,
  );

  static TextStyle textstylenunitosansregular12 =
      textstylenunitosansregular122.copyWith(
    color: ColorConstant.bluegray300,
  );

  static TextStyle textstylenunitosansregular16 =
      textstylenunitosansregular32.copyWith(
    fontSize: getFontSize(
      16,
    ),
  );

  static TextStyle textstylenunitosansbold22 = TextStyle(
    color: ColorConstant.gray900,
    fontSize: getFontSize(
      22,
    ),
    fontFamily: 'Nunito Sans',
    fontWeight: FontWeight.w700,
  );

  static TextStyle textstyleregular16 = TextStyle(
    color: ColorConstant.bluegray401,
    fontSize: getFontSize(
      16,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle textstyleoutfitmedium16 = TextStyle(
    color: ColorConstant.gray700,
    fontSize: getFontSize(
      16,
    ),
    fontFamily: 'Outfit',
    fontWeight: FontWeight.w500,
  );

  static TextStyle textstylenunitosansregular32 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      32,
    ),
    fontFamily: 'Nunito Sans',
    fontWeight: FontWeight.w400,
  );

  static TextStyle textstyleoutfitbold24 = TextStyle(
    color: ColorConstant.whiteA700,
    fontSize: getFontSize(
      24,
    ),
    fontFamily: 'Outfit',
    fontWeight: FontWeight.w700,
  );

  static TextStyle textstyleoutfitmedium24 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      24,
    ),
    fontFamily: 'Outfit',
    fontWeight: FontWeight.w500,
  );

  static TextStyle textstylenunitosansregular121 =
      textstylenunitosansregular122.copyWith(
    color: ColorConstant.blue800,
  );

  static TextStyle textstylenunitosansregular161 =
      textstylenunitosansregular16.copyWith(
    color: ColorConstant.whiteA700,
    fontFamily: 'Nunito Sans',
    fontWeight: FontWeight.w400,
  );

  static TextStyle textstylenunitosansregular122 = TextStyle(
    color: ColorConstant.bluegray400,
    fontSize: getFontSize(
      12,
    ),
    fontFamily: 'Nunito Sans',
    fontWeight: FontWeight.w400,
  );

  static TextStyle textstylenunitosansregular141 = TextStyle(
    color: ColorConstant.gray900,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: 'Nunito Sans',
    fontWeight: FontWeight.w400,
  );
}
