import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final lightTheme = FlexThemeData.light(
    useMaterial3: true,
    fontFamily: GoogleFonts.roboto().fontFamily,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scheme: FlexScheme.bigStone,
    surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
    blendLevel: 20,
    appBarOpacity: 0.95,
    swapColors: true,
    tabBarStyle: FlexTabBarStyle.forBackground,
  );
  static final darkTheme = FlexThemeData.dark(
    useMaterial3: true,
    fontFamily: GoogleFonts.roboto().fontFamily,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scheme: FlexScheme.bigStone,
    surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
    blendLevel: 15,
    appBarStyle: FlexAppBarStyle.background,
    appBarOpacity: 0.90,
    tabBarStyle: FlexTabBarStyle.forBackground,
  );
}
