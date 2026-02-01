import 'package:flutter/material.dart';

/// Helper pentru gestionarea dificultăților.
class DifficultyHelper {
  // Returnează culoarea pentru o dificultate.
  static Color getColor(String difficulty) {
    switch (difficulty) {
      case 'Ușor':
        return const Color(0xFF4CAF50); // Verde
      case 'Mediu':
        return const Color(0xFFFF9800); // Portocaliu
      case 'Dificil':
        return const Color(0xFFF44336); // Roșu
      default:
        return Colors.grey;
    }
  }

  /// Returnează iconița pentru o dificultate.
  static IconData getIcon(String difficulty) {
    switch (difficulty) {
      case 'Ușor':
        return Icons.star;
      case 'Mediu':
        return Icons.stars;
      case 'Dificil':
        return Icons.auto_awesome;
      default:
        return Icons.help_outline;
    }
  }

  /// Lista cu toate dificultățile.
  static const allDifficulties = <String>[
    'Ușor',
    'Mediu',
    'Dificil',
  ];
}
