import 'package:flutter/material.dart';

/// Funcții helper pentru navigare între ecrane.
///
/// Centralizează logica de navigare pentru:
/// - Cod mai curat
/// - Reutilizabilitate
/// - Consistență în tranziții
class NavigationHelper {
  /// Navighează către un ecran nou.
  ///
  /// Parametri:
  /// - context: Context-ul Flutter
  /// - screen: Widget-ul ecranului nou
  static void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  /// Revine la ecranul anterior.
  static void goBack(BuildContext context) {
    Navigator.pop(context);
  }
}
