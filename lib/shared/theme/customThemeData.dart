import 'dart:ui';

import 'package:flutter/material.dart';

class CustomThemeData extends ThemeExtension<CustomThemeData> {
  final Color primaryColor;
  final Color secondaryColor;
  final Color backgroundColor;
  final Color cardBackgroundColor;
  final Color topBarTextColor;
  final Color topBarIconColor;
  final Color textColor;
  final Color subTextColor;
  final Color productTileBackgroundColor;
  final double horizontalPadding;

  const CustomThemeData({
    required this.primaryColor,
    required this.secondaryColor,
    required this.backgroundColor,
    required this.cardBackgroundColor,
    required this.topBarTextColor,
    required this.topBarIconColor,
    required this.textColor,
    required this.subTextColor,
    required this.productTileBackgroundColor,
    required this.horizontalPadding,
  });

  @override
  CustomThemeData copyWith({
    Color? primaryColor,
    Color? secondaryColor,
    Color? backgroundColor,
    Color? cardBackgroundColor,
    Color? topBarTextColor,
    Color? topBarIconColor,
    Color? textColor,
    Color? subTextColor,
    Color? productTileBackgroundColor,
    double? horizontalPadding,
  }) {
    return CustomThemeData(
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      cardBackgroundColor: cardBackgroundColor ?? this.cardBackgroundColor,
      topBarTextColor: topBarTextColor ?? this.topBarTextColor,
      topBarIconColor: topBarIconColor ?? this.topBarIconColor,
      textColor: textColor ?? this.textColor,
      subTextColor: subTextColor ?? this.subTextColor,
      productTileBackgroundColor:
          productTileBackgroundColor ?? this.productTileBackgroundColor,
      horizontalPadding: horizontalPadding ?? this.horizontalPadding,
    );
  }

  @override
  CustomThemeData lerp(ThemeExtension<CustomThemeData>? other, double t) {
    if (other is! CustomThemeData) return this;
    return CustomThemeData(
      primaryColor:
          Color.lerp(primaryColor, other.primaryColor, t) ?? primaryColor,
      secondaryColor:
          Color.lerp(secondaryColor, other.secondaryColor, t) ?? secondaryColor,
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t) ??
          backgroundColor,
      cardBackgroundColor:
          Color.lerp(cardBackgroundColor, other.cardBackgroundColor, t) ??
              cardBackgroundColor,
      topBarTextColor: Color.lerp(topBarTextColor, other.topBarTextColor, t) ??
          topBarTextColor,
      topBarIconColor: Color.lerp(topBarIconColor, other.topBarIconColor, t) ??
          topBarIconColor,
      textColor: Color.lerp(textColor, other.textColor, t) ?? textColor,
      subTextColor:
          Color.lerp(subTextColor, other.subTextColor, t) ?? subTextColor,
      productTileBackgroundColor: Color.lerp(productTileBackgroundColor,
              other.productTileBackgroundColor, t) ??
          productTileBackgroundColor,
      horizontalPadding:
          lerpDouble(horizontalPadding, other.horizontalPadding, t) ??
              horizontalPadding,
    );
  }
}
