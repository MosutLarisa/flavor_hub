import 'package:flutter/material.dart';

/// Funcții helper pentru navigare între ecrane.
class NavigationHelper {
  // Navighează către un ecran nou.
  static void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  // Revine la ecranul anterior.
  static void goBack(BuildContext context) {
    Navigator.pop(context);
  }
}
