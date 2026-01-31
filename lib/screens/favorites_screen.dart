import 'package:flutter/material.dart';
import 'package:flavor_hub/models/recipe.dart';
import '../common/strings.dart';
import '../providers/favorites_provider.dart';
import '../widgets/recipe_card.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final favoritesProvider = FavoritesProvider();

  @override
  Widget build(BuildContext context) {
    final favorites = favoritesProvider.favorites;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.white,
        title: const Text(
          AppStrings.favoritesTitle,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
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
      body: Container(
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
        child: favorites.isEmpty
            ? const _EmptyFavoritesMessage()
            : _FavoritesList(favorites: favorites),
      ),
    );
  }
}

class _EmptyFavoritesMessage extends StatelessWidget {
  const _EmptyFavoritesMessage();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
            child: const Icon(
              Icons.favorite_border,
              size: 56,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
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

class _FavoritesList extends StatelessWidget {
  final List<Recipe> favorites;

  const _FavoritesList({required this.favorites});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: favorites.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 14),
          child: RecipeCard(recipe: favorites[index]),
        );
      },
    );
  }
}
