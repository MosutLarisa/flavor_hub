import 'package:flutter/material.dart';
import '../common/strings.dart';
import '../data/recipe_data.dart';
import '../models/recipe.dart';
import '../widgets/recipe_card.dart';
import '../widgets/search_bar_widget.dart';
import '../widgets/difficulty_filter_widget.dart';

/// Ecran cu rețetele DULCI.
///
/// **Funcționalități:**
/// - Afișează doar rețetele din categoria dulce
/// - Căutare după titlu
/// - Filtru după dificultate
///
/// **Navigare:**
/// - Are buton "Înapoi" în AppBar
/// - NU are navigare către rețete sărate
class SweetRecipesScreen extends StatefulWidget {
  const SweetRecipesScreen({super.key});

  @override
  State<SweetRecipesScreen> createState() => _SweetRecipesScreenState();
}

class _SweetRecipesScreenState extends State<SweetRecipesScreen> {
  var searchQuery = '';
  String? selectedDifficulty;

  /// Filtrează rețetele dulci după căutare și dificultate.
  List<Recipe> get filteredRecipes {
    return recipes.where((recipe) {
      // Doar rețete dulci
      if (recipe.category != RecipeCategory.dulce) return false;

      // Verifică căutarea
      final matchesSearch = recipe.title.toLowerCase().contains(searchQuery.toLowerCase());

      // Verifică dificultatea
      final matchesDifficulty =
          selectedDifficulty == null || recipe.difficulty == selectedDifficulty;

      return matchesSearch && matchesDifficulty;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.sweetRecipesTitle),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // BARA DE CĂUTARE
          SearchBarWidget(
            onChanged: (value) => setState(() => searchQuery = value),
          ),

          // FILTRU DIFICULTATE
          DifficultyFilterWidget(
            selectedDifficulty: selectedDifficulty,
            onSelected: (value) => setState(() => selectedDifficulty = value),
          ),

          // LISTA DE REȚETE
          Expanded(
            child: _RecipesList(recipes: filteredRecipes),
          ),
        ],
      ),
    );
  }
}

// ========== WIDGET PRIVAT ==========

/// Lista de rețete sau mesaj dacă e goală.
class _RecipesList extends StatelessWidget {
  final List<Recipe> recipes;

  const _RecipesList({required this.recipes});

  @override
  Widget build(BuildContext context) {
    if (recipes.isEmpty) {
      return const Center(
        child: Text(
          AppStrings.noResults,
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: recipes.length,
      itemBuilder: (context, index) {
        return RecipeCard(recipe: recipes[index]);
      },
    );
  }
}
