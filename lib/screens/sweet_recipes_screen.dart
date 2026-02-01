import 'package:flutter/material.dart';
import '../common/strings.dart';
import '../models/recipe.dart';
import '../widgets/recipe_list_widget.dart';

/// Ecranul de rețete dulci.
// Definește aspectul propriu (AppBar, culori)
// și folosește RecipeListWidget pentru lista de rețete.
class SweetRecipesScreen extends StatelessWidget {
  const SweetRecipesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.white,
        title: const Text(
          AppStrings.sweetRecipesTitle,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFFFA726), Color(0xFFFF7043)],
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFF3E0), Color(0xFFFFEBEE)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        // Widget reutilizabil — primește categoria și culoarea umbriei
        child: const RecipeListWidget(
          category: RecipeCategory.dulce,
          shadowColor: Colors.orange,
          emptyEmoji: '🍰',
        ),
      ),
    );
  }
}
