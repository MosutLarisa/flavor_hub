import 'package:share_plus/share_plus.dart';
import '../models/recipe.dart';

/// Helper pentru funcționalitatea de share (partajare rețete).
///
/// Oferă metode pentru a partaja:
/// - Rețeta completă
/// - Doar ingredientele
/// - Doar pașii
///
/// **Cum funcționează:**
/// Folosește `share_plus` care deschide sheet-ul nativ de partajare.
/// Utilizatorul poate alege: WhatsApp, Email, Messenger, etc.
class ShareHelper {
  /// Partajează rețeta completă.
  ///
  /// Include: titlu, descriere, timp, dificultate, ingrediente, pași.
  static Future<void> shareFullRecipe(Recipe recipe) async {
    final text =
        '''
📖 ${recipe.title}

${recipe.description}

⏱️ Timp: ${recipe.time} min
📊 Dificultate: ${recipe.difficulty}

🛒 INGREDIENTE:
${_formatIngredients(recipe.ingredients)}

👨‍🍳 PAȘI DE PREPARARE:
${_formatSteps(recipe.steps)}

---
Partajat din FlavorHub 🍳
    '''
            .trim();

    await Share.share(text);
  }

  /// Partajează doar lista de ingrediente.
  static Future<void> shareIngredients(Recipe recipe) async {
    final text =
        '''
🛒 Ingrediente pentru: ${recipe.title}

${_formatIngredients(recipe.ingredients)}

---
Partajat din FlavorHub 🍳
    '''
            .trim();

    await Share.share(text);
  }

  /// Partajează doar pașii de preparare.
  static Future<void> shareSteps(Recipe recipe) async {
    final text =
        '''
👨‍🍳 Pași pentru: ${recipe.title}

${_formatSteps(recipe.steps)}

---
Partajat din FlavorHub 🍳
    '''
            .trim();

    await Share.share(text);
  }

  /// Formatează ingredientele cu bullet points.
  static String _formatIngredients(List<String> ingredients) {
    return ingredients.map((ing) => '• $ing').join('\n');
  }

  /// Formatează pașii numerotați.
  static String _formatSteps(List<String> steps) {
    return steps.asMap().entries.map((entry) => '${entry.key + 1}. ${entry.value}').join('\n\n');
  }
}
