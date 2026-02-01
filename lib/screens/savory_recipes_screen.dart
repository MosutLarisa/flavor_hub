import 'package:flutter/material.dart';
import '../common/strings.dart';
import '../models/recipe.dart';
import '../widgets/recipe_list_widget.dart';

/// Ecranul de rețete sărate.
// Definește aspectul propriu (AppBar, culori)
// și folosește RecipeListWidget pentru lista de rețete.
class SavoryRecipesScreen extends StatelessWidget {
  const SavoryRecipesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.white,
        title: const Text(
          AppStrings.savoryRecipesTitle,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF66BB6A), Color(0xFF26A69A)],
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE8F5E9), Color(0xFFE0F2F1)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        // Widget reutilizabil — primește categoria și culoarea umbriei
        child: const RecipeListWidget(
          category: RecipeCategory.sarat,
          shadowColor: Colors.green,
          emptyEmoji: '🥗',
        ),
      ),
    );
  }
}
