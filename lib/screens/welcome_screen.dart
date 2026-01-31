import 'package:flutter/material.dart';
import '../common/strings.dart';
import '../utils/navigation_helper.dart';
import 'sweet_recipes_screen.dart';
import 'savory_recipes_screen.dart';
import 'favorites_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFFF3E0),
              Color(0xFFE8F5E9),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: const SafeArea(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              children: [
                SizedBox(height: 30),
                _WelcomeHeader(),
                SizedBox(height: 50),
                Expanded(child: _NavigationCards()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _WelcomeHeader extends StatelessWidget {
  const _WelcomeHeader();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                Colors.orange.shade300,
                Colors.deepOrange.shade400,
              ],
            ),
            boxShadow: [
              BoxShadow(
                // ignore: deprecated_member_use
                color: Colors.orange.withOpacity(0.4),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: const Center(
            child: Text(
              '🔥',
              style: TextStyle(fontSize: 56),
            ),
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          AppStrings.appTitle,
          style: TextStyle(
            fontSize: 38,
            fontWeight: FontWeight.w900,
            color: Colors.deepOrange,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          AppStrings.welcomeSubtitle,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey.shade700,
          ),
        ),
      ],
    );
  }
}

class _NavigationCards extends StatelessWidget {
  const _NavigationCards();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _NavigationCard(
          title: AppStrings.sweetCategory,
          description: AppStrings.sweetDescription,
          icon: Icons.cake_rounded,
          gradientColors: [
            Colors.orange.shade300,
            Colors.deepOrange.shade400,
          ],
          onTap: () {
            NavigationHelper.navigateToScreen(
              context,
              const SweetRecipesScreen(),
            );
          },
        ),
        const SizedBox(height: 18),
        _NavigationCard(
          title: AppStrings.savoryCategory,
          description: AppStrings.savoryDescription,
          icon: Icons.restaurant_menu_rounded,
          gradientColors: [
            Colors.green.shade300,
            Colors.teal.shade400,
          ],
          onTap: () {
            NavigationHelper.navigateToScreen(
              context,
              const SavoryRecipesScreen(),
            );
          },
        ),
        const SizedBox(height: 18),
        _NavigationCard(
          title: AppStrings.favoritesTitle,
          description: AppStrings.favoritesDescription,
          icon: Icons.favorite_rounded,
          gradientColors: [
            Colors.pink.shade300,
            Colors.red.shade400,
          ],
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

class _NavigationCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final List<Color> gradientColors;
  final VoidCallback onTap;

  const _NavigationCard({
    required this.title,
    required this.description,
    required this.icon,
    required this.gradientColors,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: gradientColors.last.withOpacity(0.4),
              blurRadius: 18,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                // ignore: deprecated_member_use
                color: Colors.white.withOpacity(0.25),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(icon, size: 34, color: Colors.white),
            ),
            const SizedBox(width: 18),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      // ignore: deprecated_member_use
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
