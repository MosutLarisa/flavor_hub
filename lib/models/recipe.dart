/// Model pentru o rețetă culinară.
/// Conține toate informațiile necesare pentru afișare și gestionare.
class Recipe {
  /// Titlul rețetei (ex: "Tort de ciocolată")
  final String title;

  /// Calea către imaginea rețetei (ex: "assets/images/cake.jpg")
  final String image;

  /// Descrierea scurtă a rețetei
  final String description;

  /// Timpul de preparare în minute
  final int time;

  /// Dificultatea: "Ușor", "Mediu" sau "Dificil"
  final String difficulty;

  /// Lista de ingrediente necesare
  final List<String> ingredients;

  /// Pașii de preparare (liste ordonată)
  final List<String> steps;

  /// Categoria rețetei (dulce sau sărat)
  final RecipeCategory category;

  /// Lista de alergeni conținuți în rețetă.
  /// Ex: ['Gluten', 'Lapte', 'Ouă']
  /// Dacă rețeta nu conține alergeni comuni, lista este goală.
  final List<String> allergens;

  /// Constructor: toate câmpurile sunt obligatorii (required)
  Recipe({
    required this.title,
    required this.image,
    required this.description,
    required this.time,
    required this.difficulty,
    required this.ingredients,
    required this.steps,
    required this.category,
    required this.allergens,
  });
}

/// Enum pentru categoriile de rețete.
enum RecipeCategory {
  /// Categoria pentru deserturi și dulciuri
  dulce,

  /// Categoria pentru mâncăruri sărate
  sarat,
}
