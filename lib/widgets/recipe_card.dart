import 'package:flutter/material.dart';
import '../models/recipe.dart';
import '../screens/recipe_detail_screen.dart';
import '../utils/navigation_helper.dart';

/// Card vizual pentru o rețetă în listă.
class RecipeCard extends StatelessWidget {
  final Recipe recipe;

  const RecipeCard({
    super.key,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        NavigationHelper.navigateToScreen(
          context,
          RecipeDetailScreen(recipe: recipe),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: Colors.black.withOpacity(0.12),
              blurRadius: 16,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              _ImageBackground(image: recipe.image),
              const _DarkGradient(),
              _RecipeTitle(title: recipe.title),
            ],
          ),
        ),
      ),
    );
  }
}

/// Fundalul imaginii rețetei.
class _ImageBackground extends StatelessWidget {
  final String image;

  const _ImageBackground({required this.image});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      height: 180,
      width: double.infinity,
      fit: BoxFit.cover,
    );
  }
}

/// Gradient întunecat peste imagine pentru a îmbunătăți lizibilitatea textului.
class _DarkGradient extends StatelessWidget {
  const _DarkGradient();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            // ignore: deprecated_member_use
            Colors.black.withOpacity(0.7),
            Colors.transparent,
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
    );
  }
}

/// Titlul rețetei afișat peste imagine.
class _RecipeTitle extends StatelessWidget {
  final String title;

  const _RecipeTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 16,
      left: 16,
      right: 16,
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
