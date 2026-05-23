import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color primary = Color(0xFF004545);
  static const Color primaryContainer = Color(0xFF115E5E);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color onPrimaryContainer = Color(0xFF92D5D4);

  static const Color secondary = Color(0xFF515F7A);
  static const Color secondaryContainer = Color(0xFFCFDDFD);
  static const Color onSecondary = Color(0xFFFFFFFF);
  static const Color onSecondaryContainer = Color(0xFF53617D);

  static const Color tertiary = Color(0xFF55343C);
  static const Color tertiaryContainer = Color(0xFF6E4B53);
  static const Color onTertiary = Color(0xFFFFFFFF);
  static const Color onTertiaryContainer = Color(0xFFECBDC7);

  static const Color surface = Color(0xFFF8F9FF);
  static const Color surfaceDim = Color(0xFFCBDBF5);
  static const Color surfaceBright = Color(0xFFF8F9FF);
  static const Color surfaceContainerLowest = Color(0xFFFFFFFF);
  static const Color surfaceContainerLow = Color(0xFFEFF4FF);
  static const Color surfaceContainer = Color(0xFFE5EEFF);
  static const Color surfaceContainerHigh = Color(0xFFDCE9FF);
  static const Color surfaceContainerHighest = Color(0xFFD3E4FE);
  static const Color surfaceVariant = Color(0xFFD3E4FE);

  static const Color onSurface = Color(0xFF0B1C30);
  static const Color onSurfaceVariant = Color(0xFF3F4948);
  static const Color inverseSurface = Color(0xFF213145);
  static const Color inverseOnSurface = Color(0xFFEAF1FF);
  static const Color inversePrimary = Color(0xFF8FD2D2);

  static const Color outline = Color(0xFF6F7978);
  static const Color outlineVariant = Color(0xFFBEC8C8);

  static const Color error = Color(0xFFBA1A1A);
  static const Color onError = Color(0xFFFFFFFF);
  static const Color errorContainer = Color(0xFFFFDAD6);
  static const Color onErrorContainer = Color(0xFF93000A);

  static const Color background = Color(0xFFF8F9FF);
  static const Color onBackground = Color(0xFF0B1C30);

  static const Color primaryFixed = Color(0xFFABEFEE);
  static const Color primaryFixedDim = Color(0xFF8FD2D2);

  // Rose Gold accent
  static const Color roseGold = Color(0xFFE2B4BD);

 // Gradient
    static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    // angle: 135 * (3.14159 / 180),
     colors: [primary, Color(0xFF0A1931)],
  );
}
