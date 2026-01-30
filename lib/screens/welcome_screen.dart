import 'package:flutter/material.dart';
import '../common/strings.dart';
import '../utils/navigation_helper.dart';
import 'sweet_recipes_screen.dart';
import 'savory_recipes_screen.dart';
import 'favorites_screen.dart';

/// Ecranul de bun venit - primul ecran al aplicației.
///
/// **Design:**
/// - Fundal alb (consistent cu restul aplicației)
/// - Logo/titlu portocaliu (brand color)
/// - 3 carduri mari pentru navigare:
///   1. Rețete Dulci (fundal portocaliu deschis)
///   2. Rețete Sărate (fundal verde deschis)
///   3. Favorite (fundal roșu deschis)
///
/// **Navigare:**
/// Fiecare card deschide un ecran separat (nu mai există navigare între dulce/sărat).
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              SizedBox(height: 40),

              // HEADER
              _WelcomeHeader(),

              SizedBox(height: 60),

              // CARDURI DE NAVIGARE
              Expanded(
                child: _NavigationCards(),
              ),

              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

// ========== WIDGET-URI PRIVATE ==========

/// Header cu logo și mesaj de bun venit.
class _WelcomeHeader extends StatelessWidget {
  const _WelcomeHeader();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // LOGO/EMOJI
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.orange.shade50,
            shape: BoxShape.circle,
          ),
          child: const Center(
            child: Text(
              '🍳',
              style: TextStyle(fontSize: 50),
            ),
          ),
        ),

        const SizedBox(height: 20),

        // TITLU
        const Text(
          AppStrings.appTitle,
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Colors.orange,
          ),
        ),

        const SizedBox(height: 8),

        // SUBTITLU
        Text(
          AppStrings.welcomeSubtitle,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }
}

/// Container cu cele 3 carduri de navigare.
class _NavigationCards extends StatelessWidget {
  const _NavigationCards();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // CARD REȚETE DULCI
        _NavigationCard(
          title: AppStrings.sweetCategory,
          description: AppStrings.sweetDescription,
          icon: Icons.cake,
          backgroundColor: Colors.orange.shade50,
          iconColor: Colors.orange,
          onTap: () {
            NavigationHelper.navigateToScreen(
              context,
              const SweetRecipesScreen(),
            );
          },
        ),

        const SizedBox(height: 16),

        // CARD REȚETE SĂRATE
        _NavigationCard(
          title: AppStrings.savoryCategory,
          description: AppStrings.savoryDescription,
          icon: Icons.restaurant,
          backgroundColor: Colors.green.shade50,
          iconColor: Colors.green,
          onTap: () {
            NavigationHelper.navigateToScreen(
              context,
              const SavoryRecipesScreen(),
            );
          },
        ),

        const SizedBox(height: 16),

        // CARD FAVORITE
        _NavigationCard(
          title: AppStrings.favoritesTitle,
          description: AppStrings.favoritesDescription,
          icon: Icons.favorite,
          backgroundColor: Colors.red.shade50,
          iconColor: Colors.red,
          onTap: () {
            NavigationHelper.navigateToScreen(
              context,
              const FavoritesScreen(),
            );
          },
        ),
      ],
    );
  }
}

/// Card individual pentru fiecare opțiune.
class _NavigationCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final VoidCallback onTap;

  const _NavigationCard({
    required this.title,
    required this.description,
    required this.icon,
    required this.backgroundColor,
    required this.iconColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16),
          // ignore: deprecated_member_use
          border: Border.all(color: iconColor.withOpacity(0.3), width: 2),
        ),
        child: Row(
          children: [
            // ICONIȚA
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, size: 32, color: iconColor),
            ),

            const SizedBox(width: 16),

            // TEXT
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: iconColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
            ),

            // SĂGEATĂ
            Icon(
              Icons.arrow_forward_ios,
              // ignore: deprecated_member_use
              color: iconColor.withOpacity(0.5),
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
