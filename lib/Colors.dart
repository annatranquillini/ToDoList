import 'package:flutter/material.dart';

class CustomColors {
  static const bianco = Color(0xFFFFFFFF);
  static const biancoCard = Color(0xFFEEEEEE);
  static const azzurro = Color(0xFF6CD6D3);
  static const revee = Color(0xFFE20074);
  static const reveePallido = Color(0xFFE962AA);
  static const rosa = Color(0xFFDB3D8C);
  static const rosso = Color(0xffFF1744);
  static const giallo = Color(0xFFDDDD3C);
  static const viola = Color(0xFF9C1AB2);
  static const violaScuro = Color(0xFF241D2D);
  static const rosaSemitrasparente = Color(0xAAE962AA);
  static const neroRevee = Color(0xFF161329);
  static const grigioChiaro = Color(0xFF888888);
  static const grigio = Color(0xFF333333);
  static const grigioScuro = Color(0xFF2A2A2A);
  static const blueTiffany = Color(0xFF0ABAB5);
  static const blueTiffanyPallido = Color(0x8F0ABAB5);
}

final colorTheme = ThemeData(
//  primarySwatch: MaterialColor(0xffdf1275, {}),
  brightness: Brightness.light,
  primaryColor: CustomColors.blueTiffany,
  primaryColorBrightness:
  ThemeData.estimateBrightnessForColor(CustomColors.blueTiffany),
  accentColor: CustomColors.blueTiffany,
  accentColorBrightness:
  ThemeData.estimateBrightnessForColor(CustomColors.blueTiffany),
  backgroundColor: CustomColors.biancoCard,

  //checkbox
  toggleableActiveColor: CustomColors.blueTiffany,

  //colore testo del RaisedButton (?)
  buttonColor: CustomColors.bianco,

  //colori textbox
  cursorColor: CustomColors.blueTiffanyPallido,
  textSelectionColor: CustomColors.blueTiffanyPallido,
  textSelectionHandleColor: CustomColors.blueTiffanyPallido,
  indicatorColor: CustomColors.blueTiffanyPallido,

  //separatori trasparenti
  dividerColor: Colors.transparent,

  //colore degli InkWell
  splashColor: CustomColors.blueTiffany.withAlpha(150),

  colorScheme: ColorScheme(
    primary: CustomColors.blueTiffany,
    primaryVariant: CustomColors.blueTiffany,
    secondary: CustomColors.viola,
    secondaryVariant: CustomColors.viola,
    surface: CustomColors.biancoCard,
    background: CustomColors.bianco,
    error: CustomColors.rosso,
    onPrimary: CustomColors.bianco,
    onSecondary: CustomColors.bianco,
    onSurface: CustomColors.bianco,
    onBackground: CustomColors.bianco,
    onError: CustomColors.neroRevee,
    brightness: Brightness.light,
  ),

  buttonTheme: ButtonThemeData(
    textTheme: ButtonTextTheme.primary,
    buttonColor: CustomColors.blueTiffany,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  ),

  primaryTextTheme: TextTheme(
    display1: TextStyle(color: CustomColors.blueTiffany),
    title: TextStyle(color: CustomColors.blueTiffany),
    body1: TextStyle(color: const Color(0xff333333)),
    body2: TextStyle(color: const Color(0xff202020)),
    //quello del drawer
    subhead: TextStyle(color: CustomColors.grigioScuro),
    button: TextStyle(color: CustomColors.biancoCard),
  ),

  inputDecorationTheme: InputDecorationTheme(
    prefixStyle: TextStyle(color: CustomColors.blueTiffany),
    suffixStyle: TextStyle(color: CustomColors.blueTiffany),
  ),
);
