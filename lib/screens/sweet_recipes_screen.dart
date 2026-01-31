import 'package:flutter/material.dart';
import '../common/strings.dart';
import '../data/recipe_data.dart';
import '../models/recipe.dart';
import '../widgets/recipe_card.dart';
import '../widgets/search_bar_widget.dart';
import '../widgets/difficulty_filter_widget.dart';

class SweetRecipesScreen extends StatefulWidget {
  const SweetRecipesScreen({super.key});

  @override
  State<SweetRecipesScreen> createState() => _SweetRecipesScreenState();
}

class _SweetRecipesScreenState extends State<SweetRecipesScreen> {
  var searchQuery = '';
  String? selectedDifficulty;

  List<Recipe> get filteredRecipes {
    return recipes.where((recipe) {
      if (recipe.category != RecipeCategory.dulce) return false;

      final matchesSearch = recipe.title.toLowerCase().contains(searchQuery.toLowerCase());

      final matchesDifficulty =
          selectedDifficulty == null || recipe.difficulty == selectedDifficulty;

      return matchesSearch && matchesDifficulty;
    }).toList();
  }

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
              colors: [
                Color(0xFFFFA726),
                Color(0xFFFF7043),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFFF3E0),
              Color(0xFFFFEBEE),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 16),

            /// SEARCH + FILTER CONTAINER
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              //padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    // ignore: deprecated_member_use
                    color: Colors.orange.withOpacity(0.2),
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

            /// LISTA DE REȚETE
            Expanded(
              child: _RecipesList(recipes: filteredRecipes),
            ),
          ],
        ),
      ),
    );
  }
}

class _RecipesList extends StatelessWidget {
  final List<Recipe> recipes;

  const _RecipesList({required this.recipes});

  @override
  Widget build(BuildContext context) {
    if (recipes.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '🍰',
              style: TextStyle(fontSize: 60),
            ),
            SizedBox(height: 12),
            Text(
              AppStrings.noResults,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
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
