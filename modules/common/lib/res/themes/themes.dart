import 'dart:ui';

import 'package:common/configs/manifest.dart';
import 'package:flutter/material.dart';

part 'colors.dart';
part 'fonts.dart';


class MaterialTheme {
  final Brightness brightness;

  final ColorSwatch primarySwatch;

  final Color colorPrimary;
  final Color colorPrimaryVariant;
  final Color colorOnPrimary;
  final Color colorPrimaryRipple;
  final Color colorOnPrimaryRipple;

  final Color colorSecondary;
  final Color colorSecondaryVariant;
  final Color colorOnSecondary;

  final Color colorBackground;
  final Color colorOnBackground;

  final Color colorSurface;
  final Color colorOnSurface;

  final Color colorError;
  final Color colorOnError;

  final String fontFamily;

  const MaterialTheme({
      this.primarySwatch = pink_swatch,
      this.colorPrimary = pink_300,
      this.colorPrimaryVariant = pink_400,
      this.colorOnPrimary = white,
      this.colorPrimaryRipple = pink_300_ripple,
      this.colorOnPrimaryRipple = white_ripple,
      this.colorSecondary = pink_300,
      this.colorSecondaryVariant = pink_400,
      this.colorOnSecondary = white,
      this.colorBackground = white,
      this.colorOnBackground = black,
      this.colorSurface = white,
      this.colorOnSurface = black,
      this.colorError = red,
      this.colorOnError = white,
      this.fontFamily = fontFamily_nunito,
      this.brightness = Brightness.light,
  });

  ThemeData get materialData => ThemeData(
      brightness: brightness,
      primaryColor: colorPrimary,
      primaryColorLight: colorPrimary,
      primaryColorDark: colorPrimaryVariant,
      accentColor: colorPrimaryVariant,
      backgroundColor: colorBackground,
      cardColor: colorSurface,
      buttonColor: colorSecondary,
      errorColor: colorError,
      fontFamily: fontFamily,
  );
}

class SibThemes {
  static final lightTheme = MaterialTheme();
  static final darkTheme = MaterialTheme(
    colorBackground: black,
    colorOnBackground: white,
    brightness: Brightness.dark,
  );
}