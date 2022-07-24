import 'package:diabe/utils/math_utils.dart';
import 'package:flutter/material.dart';

import '../utils/color_constant.dart';

class AppDecoration {
  static BoxDecoration get groupstylecornerradius => BoxDecoration(
        borderRadius: BorderRadius.circular(
          getHorizontalSize(
            18.00,
          ),
        ),
      );
  static BoxDecoration get groupstyleorange50cornerradius => BoxDecoration(
        color: ColorConstant.orange50,
        borderRadius: BorderRadius.circular(
          getHorizontalSize(
            24.00,
          ),
        ),
      );
  static BoxDecoration get groupstylegray200cornerradius => BoxDecoration(
        color: ColorConstant.gray200,
        borderRadius: BorderRadius.circular(
          getHorizontalSize(
            26.00,
          ),
        ),
        border: Border.all(
          color: ColorConstant.purpleA100,
          width: getHorizontalSize(
            0.40,
          ),
        ),
      );
  static BoxDecoration get groupstylewhiteA700 => BoxDecoration(
        color: ColorConstant.whiteA700,
      );
  static BoxDecoration get textstyleoutfitbold24 => BoxDecoration(
        color: ColorConstant.blueA400,
        borderRadius: BorderRadius.circular(
          getHorizontalSize(
            5.00,
          ),
        ),
      );
  static BoxDecoration get groupstylepink50cornerradius => BoxDecoration(
        color: ColorConstant.pink50,
        borderRadius: BorderRadius.circular(
          getHorizontalSize(
            24.00,
          ),
        ),
      );
  static BoxDecoration get groupstyleblue51cornerradius => BoxDecoration(
        color: ColorConstant.blue51,
        borderRadius: BorderRadius.circular(
          getHorizontalSize(
            30.00,
          ),
        ),
      );
  static BoxDecoration get textstylenunitosansregular161 => BoxDecoration(
        color: ColorConstant.blueA400,
        borderRadius: BorderRadius.circular(
          getHorizontalSize(
            5.00,
          ),
        ),
      );
}
