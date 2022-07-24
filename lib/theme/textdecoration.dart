import 'package:flutter/material.dart';

import 'colors.dart';
import 'fontstyle.dart';

var textFieldDecoration = InputDecoration(
    fillColor: Colors.white,
    filled: true,

    //focusColor: primaryYellow,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(0),
      borderSide: const BorderSide(width: 0.5, color: Colors.transparent),
    ),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0),
        borderSide: const BorderSide(width: 0.5, color: Colors.transparent)),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0),
        borderSide: const BorderSide(width: 0.5, color: primaryColor)),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(0),
      borderSide: const BorderSide(width: 0.5, color: mandatoryStarColor),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(0),
      borderSide: const BorderSide(width: 0.5, color: mandatoryStarColor),
    ),
    counterStyle: const TextStyle(fontSize: 12, height: 0.5),
    errorStyle:
        const TextStyle(fontSize: 12, height: 0.5, color: mandatoryStarColor),
    hintStyle: textFieldHint);

var disabledTextFieldDecoration = InputDecoration(
  fillColor: disTextFeildColor,
  filled: true,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(0),
    borderSide: const BorderSide(width: 0.5, color: Colors.transparent),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(0),
    borderSide: const BorderSide(width: 0.5, color: Colors.transparent),
  ),
);

var otpTextFieldDecoration = const InputDecoration(
  fillColor: chipsUnSelectedBgColor,
  filled: true,
  contentPadding: EdgeInsets.all(0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.zero,
    borderSide: BorderSide(width: 0.5, color: chipsUnSelectedBgColor),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.zero,
    borderSide: BorderSide(width: 0.5, color: chipsUnSelectedBgColor),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.zero,
    borderSide: BorderSide(width: 0.5, color: chipsUnSelectedBgColor),
  ),
  focusColor: Colors.transparent,
);
