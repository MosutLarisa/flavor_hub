import 'package:flutter/material.dart';
import 'package:flavor_hub/models/recipe.dart';
import '../common/strings.dart';
import '../providers/favorites_provider.dart';
import '../widgets/recipe_card.dart';

/// Ecranul de Favorite.
/// Afișează lista de rețete marcate ca favorite de utilizator.
class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

/// State-ul asociat ecranului FavoritesScreen.
class _FavoritesScreenState extends State<FavoritesScreen> {
  // Provider responsabil de gestionarea rețetelor favorite
  // (ex: adăugare, ștergere, citire favorite).
  final favoritesProvider = FavoritesProvider();

  @override
  Widget build(BuildContext context) {
    // Lista de rețete favorite obținută din provider
    final favorites = favoritesProvider.favorites;

    return Scaffold(
      // Bara de sus a ecranului
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.white,
        title: const Text(
          AppStrings.favoritesTitle,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),

        // Fundal cu gradient pentru AppBar
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFEC407A),
                Color(0xFFD81B60),
              ],
            ),
          ),
        ),
      ),

      // Corpul ecranului
      body: Container(
        // Fundal cu gradient deschis
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFCE4EC),
              Color(0xFFFFEBEE),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),

        // Dacă nu există favorite → afișăm mesaj
        // Altfel → afișăm lista de rețete favorite
        child: favorites.isEmpty
            ? const _EmptyFavoritesMessage()
            : _FavoritesList(favorites: favorites),
      ),
    );
  }
}

/// Widget afișat atunci când lista de favorite este goală.
class _EmptyFavoritesMessage extends StatelessWidget {
  const _EmptyFavoritesMessage();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Container circular cu gradient și umbră
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  Colors.pink.shade200,
                  Colors.red.shade300,
                ],
              ),
              boxShadow: [
                BoxShadow(
                  // ignore: deprecated_member_use
                  color: Colors.pink.withOpacity(0.3),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),

            // Iconiță de inimă (favorite)
            child: const Icon(
              Icons.favorite_border,
              size: 56,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 20),

          // Mesaj text afișat când nu există favorite
          const Text(
            AppStrings.noFavorites,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

/// Widget care afișează lista de rețete favorite.

// Primește lista de rețete prin constructor.
class _FavoritesList extends StatelessWidget {
  /// Lista de rețete favorite
  final List<Recipe> favorites;

  const _FavoritesList({required this.favorites});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // Padding pentru spațiere
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),

      // Numărul de elemente din listă
      itemCount: favorites.length,

      // Construirea fiecărui element din listă
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 14),

          // Card personalizat pentru afișarea unei rețete
          child: RecipeCard(recipe: favorites[index]),
        );
      },
    );
  }
}
