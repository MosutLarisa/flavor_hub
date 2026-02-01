import 'package:flutter/material.dart';
import '../common/strings.dart';

/// Widget compact care afișează alergenii unei rețete.
///
/// - Lista goală → badge verde mic "Fără alergeni comuni"
/// - Lista cu elemente → chip-uri mici într-un singur rând (sau wrapat pe 2 linii)

class AllergensWidget extends StatelessWidget {
  final List<String> allergens;

  const AllergensWidget({
    super.key,
    required this.allergens,
  });

  @override
  Widget build(BuildContext context) {
    if (allergens.isEmpty) {
      return const _NoAllergensBadge();
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          '${AppStrings.allergensTitle}:',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.deepOrange,
          ),
        ),
        const SizedBox(width: 10),

        Expanded(
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: allergens.map((allergen) => _AllergenChip(name: allergen)).toList(),
          ),
        ),
      ],
    );
  }
}

// ========== WIDGET-URI PRIVATE ==========

/// Badge verde mic pentru rețetele fără alergeni.
class _NoAllergensBadge extends StatelessWidget {
  const _NoAllergensBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.green.shade50,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: Colors.green.shade200),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check_circle, color: Colors.green, size: 18),
          SizedBox(width: 8),
          Text(
            AppStrings.noAllergens,
            style: TextStyle(
              fontSize: 15, // 🔥 mai mare
              fontWeight: FontWeight.w600,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}

/// Chip mic individual pentru un alegren.
class _AllergenChip extends StatelessWidget {
  final String name;

  const _AllergenChip({required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.deepOrange.shade100,
            Colors.orange.shade200,
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.orange.withOpacity(0.25),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.warning_amber_rounded,
            size: 16,
            color: Colors.deepOrange,
          ),
          const SizedBox(width: 6),
          Text(
            name,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Colors.deepOrange,
            ),
          ),
        ],
      ),
    );
  }
}
