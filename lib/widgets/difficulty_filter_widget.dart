import 'package:flutter/material.dart';
import '../common/strings.dart';
import '../utils/difficulty_helper.dart';

/// Widget pentru filtrarea după dificultate.
///
/// Afișează 4 chip-uri:
/// - Toate (resetează filtrul)
/// - Ușor (verde)
/// - Mediu (portocaliu)
/// - Dificil (roșu)
class DifficultyFilterWidget extends StatelessWidget {
  final String? selectedDifficulty;
  final ValueChanged<String?> onSelected;

  const DifficultyFilterWidget({
    super.key,
    required this.selectedDifficulty,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            AppStrings.difficultyFilterLabel,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: [
              _buildChip(null, AppStrings.allDifficulties, Colors.grey),
              _buildChip('Ușor', AppStrings.difficultyEasy, DifficultyHelper.getColor('Ușor')),
              _buildChip('Mediu', AppStrings.difficultyMedium, DifficultyHelper.getColor('Mediu')),
              _buildChip(
                'Dificil',
                AppStrings.difficultyHard,
                DifficultyHelper.getColor('Dificil'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildChip(String? value, String label, Color color) {
    final isSelected = selectedDifficulty == value;

    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (_) => onSelected(value),
      selectedColor: color.withOpacity(0.2),
      backgroundColor: Colors.grey.shade100,
      checkmarkColor: color,
      labelStyle: TextStyle(
        color: isSelected ? color : Colors.black87,
        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: isSelected ? color : Colors.grey.shade300,
          width: isSelected ? 2 : 1,
        ),
      ),
    );
  }
}
