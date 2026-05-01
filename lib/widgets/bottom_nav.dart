import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onChanged;

  const BottomNav({
    required this.currentIndex,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final items = [
      (icon: Icons.home_outlined, label: 'Home'),
      (icon: Icons.mic_none_rounded, label: 'Interview'),
      (icon: Icons.feedback_outlined, label: 'Feedbacks'),
    ];

    return Row(
      children: List.generate(items.length, (index) {
        final isSelected = index == currentIndex;
        final item = items[index];

        return Expanded(
          child: InkWell(
            borderRadius: BorderRadius.circular(26),
            onTap: () => onChanged(index),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 240),
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: isSelected
                          ? const RadialGradient(
                              colors: [Color(0xFF6D62FF), Color(0xFF2A2C4D)],
                            )
                          : null,
                    ),
                    child: Icon(
                      item.icon,
                      size: 34,
                      color: isSelected
                          ? Colors.white
                          : Colors.white.withValues(alpha: 0.62),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    item.label,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight:
                          isSelected ? FontWeight.w700 : FontWeight.w500,
                      color: isSelected
                          ? Colors.white
                          : Colors.white.withValues(alpha: 0.62),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
