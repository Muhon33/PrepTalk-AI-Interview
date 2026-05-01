import 'package:flutter/material.dart';
import 'package:preptalk_app/models/feedback_result.dart';

class FlutterDevFeedbackScreen extends StatelessWidget {
  final FeedbackResult result;

  const FlutterDevFeedbackScreen({required this.result, super.key});

  @override
  Widget build(BuildContext context) {
    Widget card(String label, double score, IconData icon, Color color) {
      final fraction = (score / result.scaleMax).clamp(0.0, 1.0);
      return Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.04), borderRadius: BorderRadius.circular(14)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [Container(width: 36, height: 36, decoration: BoxDecoration(color: color.withValues(alpha: 0.95), borderRadius: BorderRadius.circular(10))), const SizedBox(width: 12), Expanded(child: Text(label, style: const TextStyle(fontWeight: FontWeight.w700))), Text('${score.toInt()}/${result.scaleMax}', style: const TextStyle(fontWeight: FontWeight.w700))]),
            const SizedBox(height: 8),
            ClipRRect(borderRadius: BorderRadius.circular(8), child: LinearProgressIndicator(value: fraction, color: color, backgroundColor: Colors.white12, minHeight: 8)),
          ],
        ),
      );
    }

    Widget bulletCard(Color iconColor, IconData icon, List<String> items) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.04), borderRadius: BorderRadius.circular(14)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: items.map((item) => Padding(padding: const EdgeInsets.symmetric(vertical: 4), child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [Icon(icon, color: iconColor, size: 20), const SizedBox(width: 10), Expanded(child: Text(item, style: TextStyle(color: Colors.white.withValues(alpha: 0.8))))]))).toList()),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFF09090B),
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0, leading: IconButton(icon: const Icon(Icons.arrow_back_rounded), onPressed: () => Navigator.of(context).pop()), title: const Text('Interview Result', style: TextStyle(fontWeight: FontWeight.w700)), centerTitle: true),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Center(child: Column(children: [const Text('Flutter Developer Interview', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700)), const SizedBox(height: 6), const Text('Technical Round', style: TextStyle(fontSize: 15, color: Colors.white70)), const SizedBox(height: 8), Text('📅 ${result.metaLineItems?.join(' • ') ?? ''}', style: TextStyle(fontSize: 13, color: Colors.white.withValues(alpha: 0.55)))])),
            const SizedBox(height: 14),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.04), borderRadius: BorderRadius.circular(18)),
              child: Column(children: [
                const Text('Overall Score', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                const SizedBox(height: 14),
                SizedBox(width: 160, height: 160, child: Stack(alignment: Alignment.center, children: [SizedBox(width: 160, height: 160, child: CircularProgressIndicator(value: result.overall / 100.0, backgroundColor: Colors.white12, color: const Color(0xFF24B5F0), strokeWidth: 12)), Column(mainAxisSize: MainAxisSize.min, children: [Text(result.overall.toInt().toString(), style: const TextStyle(fontSize: 42, fontWeight: FontWeight.w800, color: Color(0xFF24B5F0))), const SizedBox(height: 4), Text('/${result.scaleMax}', style: TextStyle(color: Colors.white.withValues(alpha: 0.75), fontSize: 20))])])),
                const SizedBox(height: 12),
                if (result.ratingLabel != null) ...[Container(padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6), decoration: BoxDecoration(color: const Color(0xFF243350), borderRadius: BorderRadius.circular(999)), child: Text(result.ratingLabel!, style: const TextStyle(color: Color(0xFF24B5F0), fontWeight: FontWeight.w700))), const SizedBox(height: 12)],
                Text(result.overallSummary, textAlign: TextAlign.center, style: TextStyle(fontSize: 16, color: Colors.white.withValues(alpha: 0.75), height: 1.4)),
              ]),
            ),
            const SizedBox(height: 18),
            const Text('Category Scores', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
            const SizedBox(height: 12),
            GridView(shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 2.15, crossAxisSpacing: 12, mainAxisSpacing: 12), children: [card('Dart & Programming', result.scores['Dart & Programming'] ?? 0.0, Icons.code_rounded, const Color(0xFF8F67FF)), card('Flutter Concepts', result.scores['Flutter Concepts'] ?? 0.0, Icons.flutter_dash_rounded, const Color(0xFFA7E45B)), card('UI & Widgets', result.scores['UI & Widgets'] ?? 0.0, Icons.widgets_rounded, const Color(0xFFF5A34A)), card('State Management', result.scores['State Management'] ?? 0.0, Icons.settings_suggest_rounded, const Color(0xFF74A7FF))]),
            const SizedBox(height: 16),
            const Text('Strengths', style: TextStyle(fontWeight: FontWeight.w700)),
            const SizedBox(height: 8),
            bulletCard(Colors.lightGreenAccent, Icons.check_circle, result.strengths),
            const SizedBox(height: 12),
            const Text('Weaknesses', style: TextStyle(fontWeight: FontWeight.w700)),
            const SizedBox(height: 8),
            bulletCard(const Color(0xFFF5A34A), Icons.error_outline, result.weaknesses),
            const SizedBox(height: 12),
            const Text('Areas of Improvement', style: TextStyle(fontWeight: FontWeight.w700)),
            const SizedBox(height: 8),
            bulletCard(const Color(0xFF9A90FF), Icons.trending_up, result.improvements),
            const SizedBox(height: 18),
            Center(child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF24B5F0), padding: const EdgeInsets.symmetric(horizontal: 42, vertical: 14), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))), onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst), child: const Text('Back to Home', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700))))
          ]),
        ),
      ),
    );
  }
}
