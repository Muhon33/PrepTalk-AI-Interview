import 'package:flutter/material.dart';
import 'package:preptalk_app/models/track_card_data.dart';

class TrackCard extends StatelessWidget {
  final TrackCardData data;
  final VoidCallback? onTap;

  const TrackCard({required this.data, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(28),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 16, 14, 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          color: Colors.white.withValues(alpha: 0.06),
          border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 58,
              height: 58,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                gradient: LinearGradient(
                  colors: [
                    data.badgeColor.withValues(alpha: 0.95),
                    data.badgeColor.withValues(alpha: 0.75),
                  ],
                ),
              ),
              child: data.badge.isNotEmpty
                  ? Center(
                      child: Text(
                        data.badge,
                        style: const TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 18,
                          color: Color(0xFF222429),
                        ),
                      ),
                    )
                  : Icon(data.icon, color: const Color(0xFFEEF2FF), size: 36),
            ),
            const SizedBox(height: 18),
            Text(
              data.title,
              style: const TextStyle(
                fontSize: 18,
                height: 1.2,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              data.subtitle,
              style: TextStyle(
                fontSize: 15,
                height: 1.25,
                color: Colors.white.withValues(alpha: 0.56),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
