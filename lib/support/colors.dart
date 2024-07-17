import 'package:flutter/material.dart';

Map<int, Color> color = {
  50: const Color.fromRGBO(136, 14, 79, .1),
  100: const Color.fromRGBO(136, 14, 79, .2),
  200: const Color.fromRGBO(136, 14, 79, .3),
  300: const Color.fromRGBO(136, 14, 79, .4),
  400: const Color.fromRGBO(136, 14, 79, .5),
  500: const Color.fromRGBO(136, 14, 79, .6),
  600: const Color.fromRGBO(136, 14, 79, .7),
  700: const Color.fromRGBO(136, 14, 79, .8),
  800: const Color.fromRGBO(136, 14, 79, .9),
  900: const Color.fromRGBO(136, 14, 79, 1),
};

class AppColors extends ThemeExtension<AppColors> {
  final Color? primary;
  final Color? text;
  final Color? background;
  final Color? description;
  final Color? shadowColor;
  final Color? pendingColor;

  final Color? cardgrey;
  final Color? disable;
  final Color? secondary;
  final Color? white;
  final Color? black;
  final Color? primaryStroke;
  final Color? divider;
  final Color? grey;

  const AppColors({
    required this.background,
    required this.primary,
    required this.description,
    required this.text,
    required this.shadowColor,
    required this.cardgrey,
    required this.disable,
    required this.secondary,
    required this.pendingColor,
    required this.white,
    required this.black,
    required this.primaryStroke,
    required this.divider,
    required this.grey,
  });

  @override
  AppColors copyWith({
    Color? background,
    Color? primary,
    Color? description,
    Color? text,
    Color? shadowColor,
    Color? pendingColor,
    Color? cardgrey,
    Color? disable,
    Color? secondary,
    Color? white,
    Color? tertiary,
    Color? black,
    Color? primaryStroke,
    Color? divider,
    Color? grey,
  }) {
    return AppColors(
      background: background ?? this.background,
      primary: primary ?? this.primary,
      description: description ?? this.description,
      text: text ?? this.text,
      shadowColor: shadowColor ?? this.shadowColor,
      pendingColor: pendingColor ?? this.pendingColor,
      cardgrey: cardgrey ?? this.cardgrey,
      disable: disable ?? this.disable,
      secondary: secondary ?? this.secondary,
      white: white ?? this.white,
      black: black ?? this.black,
      primaryStroke: primaryStroke ?? this.primaryStroke,
      divider: divider ?? this.divider,
      grey: grey ?? this.grey,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }
    return AppColors(
      background: Color.lerp(background, other.background, t),
      primary: Color.lerp(primary, other.primary, t),
      text: Color.lerp(text, other.text, t),
      description: Color.lerp(text, other.text, t),
      cardgrey: Color.lerp(cardgrey, other.cardgrey, t),
      disable: Color.lerp(disable, other.disable, t),
      secondary: Color.lerp(secondary, other.secondary, t),
      white: Color.lerp(white, other.white, t),
      black: Color.lerp(black, other.black, t),
      primaryStroke: Color.lerp(primaryStroke, other.primaryStroke, t),
      pendingColor: Color.lerp(pendingColor, other.pendingColor, t),
      shadowColor: Color.lerp(shadowColor, other.shadowColor, t),
      divider: Color.lerp(divider, other.divider, t),
      grey: Color.lerp(grey, other.grey, t),
    );
  }
}
