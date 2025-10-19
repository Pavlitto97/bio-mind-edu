import 'package:flutter/material.dart';
import '../../../shared/models/assessment.dart';

/// Question card widget that displays a question and answer options
class QuestionCard extends StatelessWidget {
  final Question question;
  final List<String> selectedAnswerIds;
  final void Function(List<String>) onAnswerSelected;

  const QuestionCard({
    super.key,
    required this.question,
    required this.selectedAnswerIds,
    required this.onAnswerSelected,
  });

  IconData _getIconData(String? iconName) {
    if (iconName == null) return Icons.circle;

    switch (iconName) {
      case 'science':
        return Icons.science;
      case 'flash_on':
        return Icons.flash_on;
      case 'bubble_chart':
        return Icons.bubble_chart;
      case 'layers':
        return Icons.layers;
      case 'circle':
        return Icons.circle_outlined;
      case 'square':
        return Icons.square_outlined;
      case 'water':
        return Icons.water;
      case 'water_drop':
        return Icons.water_drop;
      case 'account_circle':
        return Icons.account_circle;
      case 'eco':
        return Icons.eco;
      case 'delete':
        return Icons.delete;
      default:
        return Icons.circle;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Question image (if available)
          if (question.imagePath != null) ...[
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Icon(Icons.image, size: 64, color: Colors.grey[400]),
              ),
            ),
            const SizedBox(height: 24),
          ],

          // Question text
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.help_outline,
                  size: 32,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    question.questionKey,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 32),

          // Answer options
          ...question.options.map((option) {
            final isSelected = selectedAnswerIds.contains(option.id);

            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: _AnswerOptionCard(
                option: option,
                isSelected: isSelected,
                icon: _getIconData(option.iconName),
                onTap: () {
                  // For multiple choice, only one answer at a time
                  if (question.type == QuestionType.multipleChoice) {
                    onAnswerSelected([option.id]);
                  } else {
                    // For other types, allow multiple selections
                    if (isSelected) {
                      final newSelection = List<String>.from(selectedAnswerIds);
                      newSelection.remove(option.id);
                      onAnswerSelected(newSelection);
                    } else {
                      onAnswerSelected([...selectedAnswerIds, option.id]);
                    }
                  }
                },
              ),
            );
          }).toList(),

          // Voice playback button (if available)
          if (question.voiceFile != null) ...[
            const SizedBox(height: 24),
            OutlinedButton.icon(
              onPressed: () {
                // TODO: Play voice question
              },
              icon: const Icon(Icons.volume_up),
              label: const Text('Listen to Question'),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

/// Individual answer option card
class _AnswerOptionCard extends StatelessWidget {
  final AnswerOption option;
  final bool isSelected;
  final IconData icon;
  final VoidCallback onTap;

  const _AnswerOptionCard({
    required this.option,
    required this.isSelected,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).colorScheme.primaryContainer
              : Colors.white,
          border: Border.all(
            color: isSelected
                ? Theme.of(context).colorScheme.primary
                : Colors.grey[300]!,
            width: isSelected ? 3 : 2,
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            if (isSelected)
              BoxShadow(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
          ],
        ),
        child: Row(
          children: [
            // Icon
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: isSelected
                    ? Theme.of(context).colorScheme.primary
                    : Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                size: 32,
                color: isSelected ? Colors.white : Colors.grey[600],
              ),
            ),

            const SizedBox(width: 16),

            // Text
            Expanded(
              child: Text(
                option.textKey,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: isSelected
                      ? Theme.of(context).colorScheme.onPrimaryContainer
                      : Colors.black87,
                ),
              ),
            ),

            // Checkmark
            if (isSelected)
              Icon(
                Icons.check_circle,
                size: 32,
                color: Theme.of(context).colorScheme.primary,
              ),
          ],
        ),
      ),
    );
  }
}
