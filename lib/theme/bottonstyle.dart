import 'package:flutter/material.dart';

import 'colors.dart';
import 'fontstyle.dart';

var positiveButtonStyle = OutlinedButton.styleFrom(
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
  side: const BorderSide(color: Colors.transparent),
  primary: Colors.black,
  backgroundColor: primaryColor,
  textStyle: defaultButtonText,
  elevation: 0.0,
);
var whiteButton = OutlinedButton.styleFrom(
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
  side: const BorderSide(color: Colors.transparent),
  primary: Colors.black,
  backgroundColor: Colors.white,
  textStyle: defaultButtonText,
  elevation: 0.0,
);

var secondaryButton = OutlinedButton.styleFrom(
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
  side: const BorderSide(color: Colors.black),
  primary: Colors.black,
  backgroundColor: Colors.white,
  textStyle: defaultButtonText,
  elevation: 0.0,
);
