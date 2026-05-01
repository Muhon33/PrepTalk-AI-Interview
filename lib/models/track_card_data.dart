import 'package:flutter/material.dart';

class TrackCardData {
  final String title;
  final String subtitle;
  final String badge;
  final Color badgeColor;
  final IconData icon;

  const TrackCardData({
    required this.title,
    required this.subtitle,
    required this.badge,
    required this.badgeColor,
    required this.icon,
  });
}
