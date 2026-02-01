/// Fișier central pentru TOATE textele din interfață.
///
/// Conține toate string-urile aplicației organizate pe secțiuni logice:
/// - Titluri și mesaje generale
/// - Ecran de pornire (intro)
/// - Navigare și categorii
/// - Căutare și filtre
/// - Detalii rețete (inclusiv alergeni)
/// - Share și favorite
///
/// **Scop:** Evitarea hardcodării textelor direct în widget-uri.
/// Dacă vrei să modifici un text, îl schimbi doar aici, nu în 10 locuri diferite.
class AppStrings {
  // ========== GENERALE ==========

  /// Titlul principal al aplicației
  static const appTitle = 'FlavorHub';

  /// Mesaj când nu există rezultate după căutare/filtrare
  static const noResults = 'Nu există rezultate';

  /// Mesaj când o liste este goală
  static const emptyList = 'Lista este goală';

  // ========== ECRAN INTRO ==========
  static const introWelcomeTitle = 'Bun venit în FlavorHub!';
  static const introWelcomeMessage = 'Descoperă rețete delicioase pentru orice ocazie.';
  static const introAllergenTitle = '⚠️ Atenție la alergeni';
  static const introAllergenMessage =
      'Fiecare rețetă afișează alergenii pe care îi conține. '
      'Verificați întotdeauna ingredientele înainte de a pregăti o rețetă.';
  static const introStartButton = 'Continuă...';

  /// Label-ul câmpului de nama pe intro
  static const introNameHint = 'Numele tău';

  // ========== ECRAN WELCOME ==========
  static const welcomeSubtitle = 'Descoperă rețete delicioase';

  /// Mesaj personalizat dacă utilizatorul a intrat nama
  /// Folosim un format string — '{name}' se înlocuiește în cod
  static const welcomePersonalGreeting = 'Salut, {name}! 👋';

  /// Mesaj default dacă utilizatorul NU a intrat nama
  static const welcomeDefaultGreeting = 'Salut! 👋';

  /// Descrierea pentru categoria dulce
  static const sweetDescription = 'Deserturi și prăjituri';

  /// Descrierea pentru categoria sărat
  static const savoryDescription = 'Mâncăruri principale';

  /// Descrierea pentru secțiunea favorite
  static const favoritesDescription = 'Colecția ta personală';

  // ========== NAVIGARE ȘI CATEGORII ==========

  /// Titlu pentru ecranul de rețete dulci
  static const sweetRecipesTitle = 'Rețete Dulci';

  /// Titlu pentru ecranul de rețete sărate
  static const savoryRecipesTitle = 'Rețete Sărate';

  /// Label scurt pentru categoria dulce (cu emoji)
  static const sweetCategory = '🍰 Dulce';

  /// Label scurt pentru categoria sărat (cu emoji)
  static const savoryCategory = '🥗 Sărat';

  // ========== FAVORITE ==========

  /// Titlu pentru ecranul de favorite
  static const favoritesTitle = 'Favorite ❤️';

  /// Mesaj când nu există rețete favorite
  static const noFavorites = 'Nu ai rețete favorite';

  /// Text pentru butonul "Salvează în favorite"
  static const saveToFavorites = 'Salvează';

  /// Text pentru butonul când rețeta este deja salvată
  static const savedToFavorites = 'Salvat';

  // ========== CĂUTARE ȘI FILTRE ==========

  /// Placeholder pentru bara de căutare
  static const searchHint = 'Caută rețetă...';

  /// Label pentru filtrul de dificultate
  static const difficultyFilterLabel = 'Dificultate:';

  /// Opțiunea "Toate" pentru filtrul de dificultate
  static const allDifficulties = 'Toate';

  // ========== DETALII REȚETĂ ==========

  /// Titlu secțiune ingrediente
  static const ingredientsTitle = 'Ingrediente';

  /// Titlu secțiune pași de preparare
  static const stepsTitle = 'Pași de preparare';

  /// Text buton pentru a ascunde ingredientele
  static const hideIngredients = 'Ascunde';

  /// Text buton pentru a arăta ingredientele
  static const showIngredients = 'Arată';

  /// Unitate de măsură pentru timp (minute)
  static const timeUnit = 'min';

  // ========== ALERGENI ==========

  /// Titlul secțiunii de alergeni în detalii rețetă
  static const allergensTitle = 'Alergeni';

  /// Mesaj când rețeta nu conține alergeni comuni
  static const noAllergens = 'Fără alergeni comuni';

  // ========== SHARE (PARTAJARE) ==========

  /// Text buton pentru partajare
  static const shareButton = 'Partajează';

  /// Titlu dialog/sheet de partajare
  static const shareDialogTitle = 'Partajează rețeta';

  /// Opțiune: partajează rețeta completă
  static const shareFullRecipe = 'Rețeta completă';

  /// Opțiune: partajează doar ingredientele
  static const shareIngredientsOnly = 'Doar ingrediente';

  /// Opțiune: partajează doar pașii
  static const shareStepsOnly = 'Doar pași';

  // ========== DIFICULTĂȚI ==========

  /// Nivel de dificultate: ușor
  static const difficultyEasy = 'Ușor';

  /// Nivel de dificultate: mediu
  static const difficultyMedium = 'Mediu';

  /// Nivel de dificultate: dificil
  static const difficultyHard = 'Dificil';
}
