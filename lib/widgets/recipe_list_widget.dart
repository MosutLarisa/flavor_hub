import 'package:flutter/material.dart';
import '../common/strings.dart';
import '../data/recipe_data.dart';
import '../models/recipe.dart';
import 'recipe_card.dart';
import 'search_bar_widget.dart';
import 'difficulty_filter_widget.dart';

/// Widget reutilizabil care afișează lista filtrabílă de rețete.
class RecipeListWidget extends StatefulWidget {
  final RecipeCategory category;
  final Color shadowColor;
  final String emptyEmoji;

  const RecipeListWidget({
    super.key,
    required this.category,
    required this.shadowColor,
    required this.emptyEmoji,
  });

  @override
  State<RecipeListWidget> createState() => _RecipeListWidgetState();
}

class _RecipeListWidgetState extends State<RecipeListWidget> {
  // Textul de căutare
  var searchQuery = '';

  // Dificultatea selectată (null = toate)
  String? selectedDifficulty;

  /// Filtrează rețetele după categoria primită,
  /// textul de căutare și dificultatea selectată.
  List<Recipe> get filteredRecipes {
    return recipes.where((recipe) {
      if (recipe.category != widget.category) return false;

      final matchesSearch = recipe.title.toLowerCase().contains(searchQuery.toLowerCase());
      final matchesDifficulty =
          selectedDifficulty == null || recipe.difficulty == selectedDifficulty;

      return matchesSearch && matchesDifficulty;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),

        /// SEARCH + FILTER
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                // ignore: deprecated_member_use
                color: widget.shadowColor.withOpacity(0.25),
                blurRadius: 16,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            children: [
              SearchBarWidget(
                onChanged: (value) => setState(() => searchQuery = value),
              ),
              const SizedBox(height: 12),
              DifficultyFilterWidget(
                selectedDifficulty: selectedDifficulty,
                onSelected: (value) => setState(() => selectedDifficulty = value),
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        /// LISTA REȚETE
        Expanded(
          child: _RecipesList(
            recipes: filteredRecipes,
            emptyEmoji: widget.emptyEmoji,
          ),
        ),
      ],
    );
  }
}

/// Lista de rețete sau mesajul de "goală".
class _RecipesList extends StatelessWidget {
  final List<Recipe> recipes;
  final String emptyEmoji;

  const _RecipesList({
    required this.recipes,
    required this.emptyEmoji,
  });

  @override
  Widget build(BuildContext context) {
    if (recipes.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(emptyEmoji, style: const TextStyle(fontSize: 60)),
            const SizedBox(height: 12),
            const Text(
              AppStrings.noResults,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: recipes.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 14),
          child: RecipeCard(recipe: recipes[index]),
        );
      },
    );
  }
}
