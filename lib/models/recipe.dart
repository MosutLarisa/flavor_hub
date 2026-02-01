/// Model pentru o rețetă culinară.
///
/// Reprezintă structura de date pentru o rețetă completă.
/// Include toate informațiile necesare: titlu, imagine, ingrediente, pași, alergeni, etc.
///
/// **De ce folosim o clasă și nu un Map?**
/// - Siguranță la compilare (erorile se descoperă înainte de rulare)
/// - Autocomplete în IDE
/// - Cod mai clar și mai ușor de întreținut
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
///
/// **Ce este un Enum?**
/// O liste fixă de valori posibile. Avem doar 2 categorii:
/// - dulce: pentru deserturi
/// - sarat: pentru mâncăruri
///
/// **Avantaje:**
/// - Nu poți greși typing-ul (nu poți scrie "dulse" din greșeală)
/// - IDE-ul îți sugerează valorile posibile
enum RecipeCategory {
  /// Categoria pentru deserturi și dulciuri
  dulce,

  /// Categoria pentru mâncăruri sărate
  sarat,
}
