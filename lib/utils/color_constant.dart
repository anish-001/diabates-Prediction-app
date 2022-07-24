import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color gray600 = fromHex('#877d7d');

  static Color gray700 = fromHex('#635c5c');

  static Color pink50 = fromHex('#f5e0e8');

  static Color blueA400 = fromHex('#0a6eff');

  static Color blue800 = fromHex('#1c6ba3');

  static Color gray900 = fromHex('#0d1214');

  static Color gray200 = fromHex('#ede8eb');

  static Color blue50 = fromHex('#edf5fc');

  static Color blue51 = fromHex('#dbedfa');

  static Color bluegray700 = fromHex('#545252');

  static Color orange50 = fromHex('#faf0db');

  static Color black900 = fromHex('#000000');

  static Color bluegray401 = fromHex('#888888');

  static Color bluegray400 = fromHex('#7a8c9e');

  static Color bluegray300 = fromHex('#8aa1bd');

  static Color black901 = fromHex('#0d0f12');

  static Color gray40000 = fromHex('#00c4c4c4');

  static Color purpleA100 = fromHex('#f799ed');

  static Color whiteA700 = fromHex('#ffffff');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
