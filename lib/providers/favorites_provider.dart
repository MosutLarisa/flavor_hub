import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/recipe.dart';

/// Manager pentru lista de rețete favorite.
///
/// **Pattern:** Singleton (o singură instanță în toată aplicația)
///
/// **Funcționalități:**
/// - Adaugă/șterge rețete din favorite
/// - Salvează favoritele local pe dispozitiv (persistență)
/// - Încarcă favoritele la pornirea aplicației
///
/// **De ce Singleton?**
/// Vrem aceeași listă de favorite în toată aplicația,
/// nu câte o copie diferită în fiecare ecran.
class FavoritesProvider {
  // ========== SINGLETON PATTERN ==========

  /// Instanța unică (privată)
  static final _instance = FavoritesProvider._internal();

  /// Constructor factory: returnează mereu aceeași instanță
  factory FavoritesProvider() => _instance;

  /// Constructor privat: se apelează o singură dată
  FavoritesProvider._internal() {
    loadFavorites(); // Încarcă favoritele salvate
  }

  // ========== DATE INTERNE ==========

  /// Lista internă cu rețetele favorite
  final List<Recipe> _favorites = [];

  /// Getter public: permite accesul la listă (doar citire)
  List<Recipe> get favorites => _favorites;

  // ========== METODE PUBLICE ==========

  /// Verifică dacă o rețetă este în favorite.
  ///
  /// Comparăm după titlu (presupunem că fiecare rețetă are titlu unic).
  bool isFavorite(Recipe recipe) {
    return _favorites.any((r) => r.title == recipe.title);
  }

  /// Adaugă sau șterge o rețetă din favorite (toggle).
  ///
  /// Dacă rețeta există → o șterge
  /// Dacă nu există → o adaugă
  Future<void> toggleFavorite(Recipe recipe) async {
    if (isFavorite(recipe)) {
      _favorites.removeWhere((r) => r.title == recipe.title);
    } else {
      _favorites.add(recipe);
    }
    await saveFavorites();
  }

  // ========== PERSISTENȚĂ (SALVARE LOCALĂ) ==========

  /// Salvează lista de favorite pe dispozitiv.
  ///
  /// Transformă fiecare Recipe în JSON și salvează în SharedPreferences.
  Future<void> saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();

    final data = _favorites
        .map(
          (r) => jsonEncode({
            'title': r.title,
            'image': r.image,
            'description': r.description,
            'time': r.time,
            'difficulty': r.difficulty,
            'ingredients': r.ingredients,
            'steps': r.steps,
            'category': r.category.index, // Enum → număr (0 sau 1)
          }),
        )
        .toList();

    await prefs.setStringList('favorites', data);
  }

  /// Încarcă lista de favorite de pe dispozitiv.
  ///
  /// Se apelează automat la pornirea aplicației.
  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getStringList('favorites');

    if (data == null) return;

    _favorites.clear();

    for (final item in data) {
      final map = jsonDecode(item);

      _favorites.add(
        Recipe(
          title: map['title'],
          image: map['image'],
          description: map['description'],
          time: map['time'],
          difficulty: map['difficulty'],
          ingredients: List<String>.from(map['ingredients']),
          steps: List<String>.from(map['steps']),
          category: RecipeCategory.values[map['category'] ?? 0],
        ),
      );
    }
  }
}
