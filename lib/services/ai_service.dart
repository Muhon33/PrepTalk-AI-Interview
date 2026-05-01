import 'dart:async';

import 'package:preptalk_app/models/feedback_result.dart';
import 'package:preptalk_app/models/track_card_data.dart';

/// Stubbed AI service - replace implementation with real API calls later.
class AiService {
  /// Simulate sending audio/text to an AI and receiving a feedback result.
  static Future<FeedbackResult> getFeedbackForTrack(TrackCardData? track) async {
    // simulate network / processing delay
    await Future.delayed(const Duration(seconds: 2));

    final title = (track?.title ?? '').toLowerCase();
    final badge = (track?.badge ?? '').toUpperCase();
    final isFlutterDev = title.contains('flutter developer') || badge == 'FLUTTER' || title.contains('flutter');
    final isWebDev = !isFlutterDev && (title.contains('web developer') || badge == '</>');
    // If the track looks like PTE, return a PTE-style result (scale 90)
    final isPte = badge == 'PTE' || title.contains('pte');
    if (isFlutterDev) {
      return const FeedbackResult(
        overall: 82.0,
        scores: {
          'Dart & Programming': 85,
          'Flutter Concepts': 88,
          'UI & Widgets': 80,
          'State Management': 78,
        },
        overallSummary: 'You performed really well in this interview.\nKeep practicing to reach excellence!',
        strengths: [
          'Strong understanding of Flutter core concepts.',
          'Good knowledge of widgets and their lifecycle.',
          'Well-structured and efficient code.',
          'Applied state management effectively.',
        ],
        weaknesses: [
          'Could optimize performance in large widget trees.',
          'Some answers on advanced topics were incomplete.',
        ],
        improvements: [
          'Practice more on advanced state management (Bloc/Riverpod).',
          'Focus on performance optimization and best practices.',
        ],
        scaleMax: 100,
        ratingLabel: 'Great!',
        testTitle: 'Flutter Developer Interview',
        testSubtitle: 'Technical Round',
        metaLineItems: ['May 15, 2024', '09:30 AM', '35 min'],
      );
    }
    if (isWebDev) {
      return const FeedbackResult(
        overall: 82.0,
        scores: {
          'Technical Knowledge': 85,
          'Problem Solving': 80,
          'Communication': 78,
          'Code Quality': 85,
        },
        overallSummary: 'You performed really well in this interview.\nKeep practicing to reach excellence!',
        strengths: [
          'Strong understanding of core concepts.',
          'Able to solve problems efficiently.',
          'Code is clean and well-structured.',
        ],
        weaknesses: [
          'Could explain solutions more clearly.',
          'Edge cases handling can be improved.',
        ],
        improvements: [
          'Work on time complexity and optimization.',
          'Practice system design and architecture.',
        ],
        scaleMax: 100,
        ratingLabel: 'Great!',
        testTitle: 'Web Developer Interview',
        testSubtitle: 'Technical Round',
        metaLineItems: ['May 20, 2024', '11:32 AM', '25 min'],
      );
    }
    if (isPte) {
      return const FeedbackResult(
        overall: 68.0,
        scores: {
          'Read Aloud': 70,
          'Repeat Sentence': 65,
          'Describe Image': 68,
          'Respond to Questions': 67,
        },
        overallSummary: 'You performed well in most tasks.\nKeep practicing to reach 79+!',
        strengths: [
          'Clear pronunciation and good fluency.',
          'Good use of vocabulary in responses.',
          'Maintained good pace and rhythm.',
        ],
        weaknesses: [
          'Some responses were a bit short.',
          'Inconsistent sentence structure in longer answers.',
        ],
        improvements: [
          'Elaborate more in responses.',
          'Use more complex sentence structures.',
        ],
        scaleMax: 90,
        ratingLabel: 'Good',
        testTitle: 'PTE Speaking Test',
        testSubtitle: null,
        metaLineItems: ['May 18, 2024', '10:15 AM', '20 min'],
      );
    }

    // Default: IELTS-style example (scale 9)
    return const FeedbackResult(
      overall: 7.5,
      scores: {
        'Fluency': 7.5,
        'Coherence': 7.0,
        'Vocabulary': 7.0,
        'Grammar': 7.5,
      },
      overallSummary: 'Great job! Your speaking skills are strong.\nKeep practicing to achieve Band 8 or higher.',
      strengths: [
        'You spoke fluently and confidently.',
        'You used a wide range of vocabulary.',
      ],
      weaknesses: [
        'There were some grammar mistakes.',
        'Some answers were a bit unclear or incomplete.',
      ],
      improvements: [
        'Work on sentence structure and grammar accuracy.',
        'Try to give more detailed and organized answers.',
      ],
    );
  }
}
