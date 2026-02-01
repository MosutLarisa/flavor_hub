import 'package:flutter/material.dart';
import '../common/strings.dart';
import '../widgets/app_logo.dart';
import 'welcome_screen.dart';

/// Ecranul de introducere (Intro Screen).
class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

/// State-ul asociat ecranului IntroScreen.
class _IntroScreenState extends State<IntroScreen> {
  // Controller pentru câmpul de text unde utilizatorul introduce numele
  final _nameController = TextEditingController();

  // Eliberarea resurselor folosite de controller
  // pentru a preveni memory leaks.
  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Înălțimea ecranului dispozitivului
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        height: double.infinity,

        // Fundal cu gradient vertical
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFF3E0), Color(0xFFE8F5E9)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),

        // SafeArea evită notch-ul și zonele neutilizabile
        child: SafeArea(
          child: SingleChildScrollView(
            child: ConstrainedBox(
              // Asigură ocuparea minimă a înălțimii ecranului
              constraints: BoxConstraints(
                minHeight: screenHeight - MediaQuery.of(context).padding.vertical,
              ),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.all(28),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Logo-ul aplicației
                      const AppLogo(),
                      const SizedBox(height: 32),

                      // Mesaj de bun venit
                      const _WelcomeMessage(),
                      const SizedBox(height: 28),

                      // Câmpul de introducere a numelui
                      _NameField(controller: _nameController),
                      const SizedBox(height: 24),

                      // Card informativ despre alergeni
                      const _AllergenInfoCard(),
                      const SizedBox(height: 36),

                      // Butonul de pornire a aplicației
                      _StartButton(nameController: _nameController),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Widget ce afișează titlul și mesajul de bun venit.
class _WelcomeMessage extends StatelessWidget {
  const _WelcomeMessage();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Titlu principal
        const Text(
          AppStrings.introWelcomeTitle,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w900,
            color: Colors.deepOrange,
          ),
        ),
        const SizedBox(height: 10),

        // Subtitlu / descriere
        Text(
          AppStrings.introWelcomeMessage,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey.shade600,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}

/// Câmpul de introducere a numelui utilizatorului.
///
// Primește un TextEditingController din widget-ul părinte.
class _NameField extends StatelessWidget {
  final TextEditingController controller;

  const _NameField({required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),

      // Stilizarea câmpului de input
      decoration: InputDecoration(
        hintText: AppStrings.introNameHint,
        hintStyle: TextStyle(color: Colors.grey.shade400),
        prefixIcon: const Icon(
          Icons.person_outline,
          color: Colors.deepOrange,
        ),
        filled: true,
        fillColor: Colors.white,

        // Bordură implicită
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),

        // Bordură activă (focus)
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.deepOrange, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
      ),
    );
  }
}

/// Card informativ care explică rolul alergenilor în aplicație.
class _AllergenInfoCard extends StatelessWidget {
  const _AllergenInfoCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),

      // Stilizare card
      decoration: BoxDecoration(
        color: const Color(0xFFFFF3E0),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.orange.shade300, width: 1.5),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.orange.withOpacity(0.15),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),

      //
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Titlu card
          const Text(
            AppStrings.introAllergenTitle,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.deepOrange,
            ),
          ),
          const SizedBox(height: 10),

          /// Conținut card
          Text(
            AppStrings.introAllergenMessage,
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey.shade700,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

/// Butonul care pornește aplicația.
class _StartButton extends StatelessWidget {
  final TextEditingController nameController;

  const _StartButton({required this.nameController});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // Preluarea numelui introdus
          final name = nameController.text.trim();

          // Navigare către ecranul de bun venit
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => WelcomeScreen(userName: name),
            ),
          );
        },

        // Stilizare buton
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepOrange,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          elevation: 4,
          shadowColor: Colors.deepOrange.shade400,
        ),

        child: const Text(AppStrings.introStartButton),
      ),
    );
  }
}
