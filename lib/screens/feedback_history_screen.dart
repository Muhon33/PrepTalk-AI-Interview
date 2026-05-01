import 'package:flutter/material.dart';

class FeedbackHistoryScreen extends StatelessWidget {
  const FeedbackHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final historyItems = [
      _HistoryItem(
        title: 'IELTS Speaking Interview',
        subtitle: 'General Practice',
        date: 'May 20, 2024',
        time: '11:32 AM',
        scoreText: '7.5',
        scoreLabel: 'Overall Band',
        badge: 'Good',
        accent: const Color(0xFFB08CFF),
        iconLabel: 'IELTS',
      ),
      _HistoryItem(
        title: 'PTE Speaking',
        subtitle: 'Read Aloud Practice',
        date: 'May 18, 2024',
        time: '10:15 AM',
        scoreText: '68',
        scoreLabel: 'Overall Score',
        badge: 'Good',
        accent: const Color(0xFFA6D98B),
        iconLabel: 'PTE',
      ),
      _HistoryItem(
        title: 'Web Developer Interview',
        subtitle: 'Technical Round',
        date: 'May 16, 2024',
        time: '03:45 PM',
        scoreText: '85',
        scoreLabel: 'Overall Score',
        badge: 'Excellent',
        accent: const Color(0xFFF2B45D),
        iconLabel: '</>',
      ),
      _HistoryItem(
        title: 'Flutter Developer Interview',
        subtitle: 'Technical Round',
        date: 'May 15, 2024',
        time: '09:30 AM',
        scoreText: '82',
        scoreLabel: 'Overall Score',
        badge: 'Good',
        accent: const Color(0xFF5BA7FF),
        iconLabel: 'F',
      ),
      _HistoryItem(
        title: 'IELTS Speaking Interview',
        subtitle: 'General Practice',
        date: 'May 12, 2024',
        time: '05:20 PM',
        scoreText: '6.5',
        scoreLabel: 'Overall Band',
        badge: 'Average',
        accent: const Color(0xFF9C84FF),
        iconLabel: 'IELTS',
      ),
      _HistoryItem(
        title: 'PTE Speaking',
        subtitle: 'Describe Image Practice',
        date: 'May 10, 2024',
        time: '11:00 AM',
        scoreText: '62',
        scoreLabel: 'Overall Score',
        badge: 'Average',
        accent: const Color(0xFFA6D98B),
        iconLabel: 'PTE',
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF09090B),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Feedbacks', style: TextStyle(fontWeight: FontWeight.w700)),
        centerTitle: false,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(18, 14, 18, 18),
          children: [
            const Text(
              'Your interview history and results',
              style: TextStyle(fontSize: 18, color: Colors.white70),
            ),
            const SizedBox(height: 18),
            ...historyItems.map(
              (item) => Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: _HistoryCard(item: item),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HistoryItem {
  final String title;
  final String subtitle;
  final String date;
  final String time;
  final String scoreText;
  final String scoreLabel;
  final String badge;
  final Color accent;
  final String iconLabel;

  const _HistoryItem({
    required this.title,
    required this.subtitle,
    required this.date,
    required this.time,
    required this.scoreText,
    required this.scoreLabel,
    required this.badge,
    required this.accent,
    required this.iconLabel,
  });
}

class _HistoryCard extends StatelessWidget {
  final _HistoryItem item;

  const _HistoryCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Colors.white.withValues(alpha: 0.06),
        border: Border.all(color: Colors.white.withValues(alpha: 0.03)),
      ),
      child: Row(
        children: [
          Container(
            width: 74,
            height: 74,
            decoration: BoxDecoration(
              color: item.accent.withValues(alpha: 0.18),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: item.accent.withValues(alpha: 0.9),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Text(
                    item.iconLabel,
                    style: TextStyle(
                      color: Colors.black.withValues(alpha: 0.8),
                      fontWeight: FontWeight.w800,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 6),
                Text(
                  item.subtitle,
                  style: TextStyle(fontSize: 15, color: Colors.white.withValues(alpha: 0.55)),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.calendar_month_outlined, size: 18, color: Colors.white.withValues(alpha: 0.45)),
                    const SizedBox(width: 6),
                    Text(
                      item.date,
                      style: TextStyle(color: Colors.white.withValues(alpha: 0.55)),
                    ),
                    const SizedBox(width: 8),
                    Text('•', style: TextStyle(color: Colors.white.withValues(alpha: 0.4))),
                    const SizedBox(width: 8),
                    Text(
                      item.time,
                      style: TextStyle(color: Colors.white.withValues(alpha: 0.55)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                item.scoreText,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: item.accent,
                ),
              ),
              Text(
                item.scoreLabel,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white.withValues(alpha: 0.5),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: item.accent.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  item.badge,
                  style: TextStyle(
                    color: item.accent,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
