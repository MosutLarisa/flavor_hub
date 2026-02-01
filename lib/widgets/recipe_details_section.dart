import 'package:flutter/material.dart';
import '../models/recipe.dart';
import '../providers/favorites_provider.dart';
import '../common/strings.dart';
import '../utils/share_helper.dart';
import '../utils/difficulty_helper.dart';
import 'allergens_widget.dart';

/// Secțiunea cu toate detaliile rețetei.
class RecipeDetailsSection extends StatefulWidget {
  final Recipe recipe;

  const RecipeDetailsSection({
    super.key,
    required this.recipe,
  });

  @override
  State<RecipeDetailsSection> createState() => _RecipeDetailsSectionState();
}

class _RecipeDetailsSectionState extends State<RecipeDetailsSection> {
  var showIngredients = true;
  final favorites = FavoritesProvider();

  @override
  Widget build(BuildContext context) {
    final isFavorite = favorites.isFavorite(widget.recipe);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// TITLU
            Text(
              widget.recipe.title,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                letterSpacing: 0.5,
              ),
            ),

            const SizedBox(height: 16),

            /// BUTOANE (Favorite + Share)
            _ActionButtons(
              isFavorite: isFavorite,
              recipe: widget.recipe,
              onFavoritePressed: _toggleFavorite,
            ),

            const SizedBox(height: 20),

            /// DESCRIERE
            Text(
              widget.recipe.description,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade700,
                height: 1.6,
              ),
            ),

            const SizedBox(height: 24),

            /// INFO (Timp + Dificultate)
            _InfoRow(
              time: widget.recipe.time,
              difficulty: widget.recipe.difficulty,
            ),

            const SizedBox(height: 24),

            /// ALERGENI — chemat din widget separat
            AllergensWidget(allergens: widget.recipe.allergens),

            const SizedBox(height: 28),

            /// INGREDIENTE
            _IngredientsSection(
              ingredients: widget.recipe.ingredients,
              showIngredients: showIngredients,
              onToggle: () => setState(() => showIngredients = !showIngredients),
            ),

            const SizedBox(height: 28),

            /// PAȘI DE PREPARARE
            _StepsSection(steps: widget.recipe.steps),
          ],
        ),
      ),
    );
  }

  /// Toggle favorite și refresh UI.
  Future<void> _toggleFavorite() async {
    await favorites.toggleFavorite(widget.recipe);
    setState(() {});
  }
}

/// Butoane Favorite și Share.
class _ActionButtons extends StatelessWidget {
  final bool isFavorite;
  final Recipe recipe;
  final VoidCallback onFavoritePressed;

  const _ActionButtons({
    required this.isFavorite,
    required this.recipe,
    required this.onFavoritePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            onPressed: onFavoritePressed,
            icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
            label: Text(
              isFavorite ? AppStrings.savedToFavorites : AppStrings.saveToFavorites,
            ),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              backgroundColor: isFavorite ? Colors.red : Colors.grey.shade200,
              foregroundColor: isFavorite ? Colors.white : Colors.black87,
            ),
          ),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () => _showShareOptions(context, recipe),
            icon: const Icon(Icons.share),
            label: const Text(AppStrings.shareButton),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              backgroundColor: Colors.orange,
              foregroundColor: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  /// Bottom sheet cu opțiunile de partajare.
  void _showShareOptions(BuildContext context, Recipe recipe) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              AppStrings.shareDialogTitle,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.description, color: Colors.orange),
              title: const Text(AppStrings.shareFullRecipe),
              onTap: () {
                Navigator.pop(context);
                ShareHelper.shareFullRecipe(recipe);
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart, color: Colors.green),
              title: const Text(AppStrings.shareIngredientsOnly),
              onTap: () {
                Navigator.pop(context);
                ShareHelper.shareIngredients(recipe);
              },
            ),
            ListTile(
              leading: const Icon(Icons.format_list_numbered, color: Colors.blue),
              title: const Text(AppStrings.shareStepsOnly),
              onTap: () {
                Navigator.pop(context);
                ShareHelper.shareSteps(recipe);
              },
            ),
          ],
        ),
      ),
    );
  }
}

/// Rândul cu Timp și Dificultate.
class _InfoRow extends StatelessWidget {
  final int time;
  final String difficulty;

  const _InfoRow({
    required this.time,
    required this.difficulty,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _InfoChip(
          icon: Icons.timer,
          text: '$time ${AppStrings.timeUnit}',
          color: Colors.blue,
        ),
        const SizedBox(width: 12),
        _InfoChip(
          icon: DifficultyHelper.getIcon(difficulty),
          text: difficulty,
          color: DifficultyHelper.getColor(difficulty),
        ),
      ],
    );
  }
}

/// Chip mic cu iconiță și text.
class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;

  const _InfoChip({
    required this.icon,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        // ignore: deprecated_member_use
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Icon(icon, size: 18, color: color),
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

/// Secțiunea ingrediente cu toggle show/hide.
class _IngredientsSection extends StatelessWidget {
  final List<String> ingredients;
  final bool showIngredients;
  final VoidCallback onToggle;

  const _IngredientsSection({
    required this.ingredients,
    required this.showIngredients,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.orange.shade50,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                AppStrings.ingredientsTitle,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: onToggle,
                child: Text(
                  showIngredients ? AppStrings.hideIngredients : AppStrings.showIngredients,
                ),
              ),
            ],
          ),
          if (showIngredients) ...[
            const SizedBox(height: 10),
            ...ingredients.map(
              (ing) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Row(
                  children: [
                    const Icon(Icons.check_circle, color: Colors.orange, size: 20),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(ing, style: const TextStyle(fontSize: 15)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

/// Secțiunea pași de preparare numerotați.
class _StepsSection extends StatelessWidget {
  final List<String> steps;

  const _StepsSection({required this.steps});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          AppStrings.stepsTitle,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        ...steps.asMap().entries.map((entry) {
          return Container(
            margin: const EdgeInsets.only(bottom: 14),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  // ignore: deprecated_member_use
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Text(
              '${entry.key + 1}. ${entry.value}',
              style: const TextStyle(fontSize: 15, height: 1.6),
            ),
          );
        }),
      ],
    );
  }
}
