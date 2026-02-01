import 'package:flutter/material.dart';
import '../models/recipe.dart';
import '../widgets/recipe_image_header.dart';
import '../widgets/recipe_details_section.dart';

/// Ecranul cu detaliile complete ale unei rețete.
class RecipeDetailScreen extends StatelessWidget {
  final Recipe recipe;

  const RecipeDetailScreen({
    super.key,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            RecipeImageHeader(image: recipe.image),
            RecipeDetailsSection(recipe: recipe),
          ],
        ),
      ),
    );
  }
}
