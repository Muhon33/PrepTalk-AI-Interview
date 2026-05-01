class FeedbackResult {
  final double overall; // e.g., 7.5 or 68
  final Map<String, double> scores; // "Fluency" : 7.5 or section scores
  final String overallSummary;
  final List<String> strengths;
  final List<String> weaknesses;
  final List<String> improvements;
  final int scaleMax; // e.g. 9 for IELTS (band), 90 for PTE
  final String? ratingLabel; // e.g. "Good" or null
  final String? testTitle;
  final String? testSubtitle;
  final List<String>? metaLineItems;

  const FeedbackResult({
    required this.overall,
    required this.scores,
    required this.overallSummary,
    required this.strengths,
    required this.weaknesses,
    required this.improvements,
    this.scaleMax = 9,
    this.ratingLabel,
    this.testTitle,
    this.testSubtitle,
    this.metaLineItems,
  });
}
