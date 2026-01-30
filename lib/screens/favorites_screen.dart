import 'package:flavor_hub/models/recipe.dart';
import 'package:flutter/material.dart';
import '../common/strings.dart';
import '../providers/favorites_provider.dart';
import '../widgets/recipe_card.dart';

/// Ecranul cu rețetele favorite.
///
/// Afișează lista de favorite din FavoritesProvider.
/// Se actualizează automat când adaugi/ștergi favorite.
class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final favorites = FavoritesProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.favoritesTitle),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: favorites.favorites.isEmpty
          ? const _EmptyFavoritesMessage()
          : _FavoritesList(
              recipes: favorites.favorites,
              favorites: favorites.favorites,
            ),
    );
  }
}

// ========== WIDGET-URI PRIVATE ==========

/// Mesaj când nu există favorite.
class _EmptyFavoritesMessage extends StatelessWidget {
  const _EmptyFavoritesMessage();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.favorite_border,
            size: 80,
            color: Colors.grey.shade300,
          ),
          const SizedBox(height: 16),
          Text(
            AppStrings.noFavorites,
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}

/// Lista de rețete favorite.
class _FavoritesList extends StatelessWidget {
  final List favorites;

  const _FavoritesList({required this.favorites, required List<Recipe> recipes});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: favorites.length,
      itemBuilder: (context, index) {
        return RecipeCard(recipe: favorites[index]);
      },
    );
  }
}
