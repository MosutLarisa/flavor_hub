import 'package:flutter/material.dart';
import '../common/strings.dart';
import '../widgets/app_logo.dart';
import 'welcome_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFF3E0), Color(0xFFE8F5E9)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: screenHeight - MediaQuery.of(context).padding.vertical,
              ),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.all(28),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const AppLogo(),
                      const SizedBox(height: 32),

                      const _WelcomeMessage(),
                      const SizedBox(height: 28),

                      _NameField(controller: _nameController),
                      const SizedBox(height: 24),

                      const _AllergenInfoCard(),
                      const SizedBox(height: 36),

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

// ========== WIDGET-URI PRIVATE ==========

/// Titlu + subtitlu de bun venit.
class _WelcomeMessage extends StatelessWidget {
  const _WelcomeMessage();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
        Text(
          AppStrings.introWelcomeMessage,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, color: Colors.grey.shade600, height: 1.5),
        ),
      ],
    );
  }
}

/// Câmpul de nama utilizator.
class _NameField extends StatelessWidget {
  final TextEditingController controller;

  const _NameField({required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
      decoration: InputDecoration(
        hintText: AppStrings.introNameHint,
        hintStyle: TextStyle(color: Colors.grey.shade400),
        prefixIcon: const Icon(Icons.person_outline, color: Colors.deepOrange),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.deepOrange, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
      ),
    );
  }
}

/// Card info alergeni.
class _AllergenInfoCard extends StatelessWidget {
  const _AllergenInfoCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            AppStrings.introAllergenTitle,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.deepOrange),
          ),
          const SizedBox(height: 10),
          Text(
            AppStrings.introAllergenMessage,
            style: TextStyle(fontSize: 15, color: Colors.grey.shade700, height: 1.5),
          ),
        ],
      ),
    );
  }
}

/// Buton "Pornesc!"
class _StartButton extends StatelessWidget {
  final TextEditingController nameController;

  const _StartButton({required this.nameController});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          final name = nameController.text.trim();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => WelcomeScreen(userName: name),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepOrange,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          //borderRadius: BorderRadius.circular(16),
          textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          elevation: 4,
          shadowColor: Colors.deepOrange.shade400,
        ),
        child: const Text(AppStrings.introStartButton),
      ),
    );
  }
}
