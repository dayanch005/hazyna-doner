import 'package:flutter/material.dart';

@immutable
class AppColors {
  const AppColors._();
  static const Color primary = Color(0xff166FF6);
  static const Color primarySecondary = Color(0xffF7F7FC);
  static const Color primaryTertiary = Color(0xffADB5BD);
  static const Color primaryQuaternary = Color(0xff2A46A9);
  static const Color backgroundColor= Colors.white;
  static const Color textColor = Colors.black;
  static const Color textSecondaryColor = Color(0xff64748B);
  static const Color statusWaiting = Color(0xffF79009);
  static const Color statusStop = Color(0xffDE2622);
}


@immutable
class AppDarkColors {
  const AppDarkColors._();
  static const Color primary = Colors.white;
  static const Color backgroundColor = Color(0xff0E1F4C); 
}