import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/recipe.dart';

/// Manager pentru lista de rețete favorite.
//
// **Notă:** Folosește SharedPreferences pentru stocare locală.
// Rețetele sunt salvate ca JSON pentru a păstra structura complexă.

class FavoritesProvider {
  // Instanța unică (privată)
  static final _instance = FavoritesProvider._internal();

  // Constructor factory: returnează mereu aceeași instanță
  factory FavoritesProvider() => _instance;

  // Constructor privat: se apelează o singură dată
  FavoritesProvider._internal() {
    loadFavorites(); // Încarcă favoritele salvate
  }

  // Lista internă cu rețetele favorite
  final List<Recipe> _favorites = [];

  // Getter public: permite accesul la liste (doar citire)
  List<Recipe> get favorites => _favorites;

  // Verifică dacă o rețetă este în favorite.

  // Comparăm după titlu (presupunem că fiecare rețetă are titlu unic).
  bool isFavorite(Recipe recipe) {
    return _favorites.any((r) => r.title == recipe.title);
  }

  /// Adaugă sau șterge o rețetă din favorite (toggle).
  // Dacă rețeta există → o șterge
  // Dacă nu există → o adaugă
  Future<void> toggleFavorite(Recipe recipe) async {
    if (isFavorite(recipe)) {
      _favorites.removeWhere((r) => r.title == recipe.title);
    } else {
      _favorites.add(recipe);
    }
    await saveFavorites();
  }

  /// Salvează lista de favorite pe dispozitiv.
  // Transformă fiecare Recipe în JSON și salvează în SharedPreferences.
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
            'category': r.category.index,
            'allergens': r.allergens,
          }),
        )
        .toList();

    await prefs.setStringList('favorites', data);
  }

  /// Încarcă lista de favorite de pe dispozitiv.
  // Se apelează automat la pornirea aplicației.
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

          allergens: map.containsKey('allergens') ? List<String>.from(map['allergens']) : [],
        ),
      );
    }
  }
}
