import 'package:flutter/material.dart';
import '../models/recipe.dart';
import '../providers/favorites_provider.dart';
import '../common/strings.dart';
import '../utils/share_helper.dart';
import '../utils/difficulty_helper.dart';

/// Secțiune cu toate detaliile rețetei.
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
  bool showIngredients = true;
  final favorites = FavoritesProvider();

  @override
  Widget build(BuildContext context) {
    final isFavorite = favorites.isFavorite(widget.recipe);

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TITLU
          Text(
            widget.recipe.title,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          // BUTOANE
          _ActionButtons(
            isFavorite: isFavorite,
            recipe: widget.recipe,
            onFavoritePressed: _toggleFavorite,
          ),

          const SizedBox(height: 12),

          // DESCRIERE
          Text(
            widget.recipe.description,
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey.shade700,
              height: 1.5,
            ),
          ),

          const SizedBox(height: 20),

          // INFO
          _InfoRow(
            time: widget.recipe.time,
            difficulty: widget.recipe.difficulty,
          ),

          const SizedBox(height: 24),

          // INGREDIENTE
          _IngredientsSection(
            ingredients: widget.recipe.ingredients,
            showIngredients: showIngredients,
            onToggle: () => setState(() => showIngredients = !showIngredients),
          ),

          const SizedBox(height: 24),

          // PAȘI
          _StepsSection(steps: widget.recipe.steps),
        ],
      ),
    );
  }

  Future<void> _toggleFavorite() async {
    await favorites.toggleFavorite(widget.recipe);
    setState(() {});
  }
}

// ========== WIDGET-URI PRIVATE ==========

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
        // FAVORITE
        Expanded(
          child: ElevatedButton.icon(
            onPressed: onFavoritePressed,
            icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
            label: Text(
              isFavorite ? AppStrings.savedToFavorites : AppStrings.saveToFavorites,
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: isFavorite ? Colors.red : Colors.grey.shade200,
              foregroundColor: isFavorite ? Colors.white : Colors.black87,
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),

        const SizedBox(width: 12),

        // SHARE
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () => _showShareOptions(context, recipe),
            icon: const Icon(Icons.share),
            label: const Text(AppStrings.shareButton),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
      ],
    );
  }

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
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color, width: 1.5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: color),
          const SizedBox(width: 6),
          Text(
            text,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              AppStrings.ingredientsTitle,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: onToggle,
              child: Text(
                showIngredients ? AppStrings.hideIngredients : AppStrings.showIngredients,
                style: const TextStyle(color: Colors.orange),
              ),
            ),
          ],
        ),
        if (showIngredients) ...[
          const SizedBox(height: 8),
          ...ingredients.map(
            (ing) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(
                children: [
                  const Icon(Icons.check_circle, color: Colors.orange, size: 20),
                  const SizedBox(width: 10),
                  Expanded(child: Text(ing, style: const TextStyle(fontSize: 15))),
                ],
              ),
            ),
          ),
        ],
      ],
    );
  }
}

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
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        ...steps.asMap().entries.map((entry) {
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFFF8F8F8),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              '${entry.key + 1}. ${entry.value}',
              style: const TextStyle(fontSize: 14, height: 1.5),
            ),
          );
        }),
      ],
    );
  }
}
