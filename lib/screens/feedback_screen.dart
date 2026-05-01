import 'package:flutter/material.dart';
import 'package:preptalk_app/models/feedback_result.dart';
import 'package:preptalk_app/screens/feedback_flutterdev_screen.dart';
import 'package:preptalk_app/screens/feedback_ielts_screen.dart';
import 'package:preptalk_app/screens/feedback_pte_screen.dart';
import 'package:preptalk_app/screens/feedback_webdev_screen.dart';

class FeedbackScreen extends StatelessWidget {
  final FeedbackResult result;
  final String title;

  const FeedbackScreen({
    required this.result,
    this.title = 'IELTS Speaking Test',
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (result.scaleMax == 90) {
      return PTEFeedbackScreen(result: result);
    }

    if (result.scaleMax == 100 && result.testTitle == 'Flutter Developer Interview') {
      return FlutterDevFeedbackScreen(result: result);
    }

    if (result.scaleMax == 100 && result.testTitle == 'Web Developer Interview') {
      return WebDevFeedbackScreen(result: result);
    }

    return IELTSFeedbackScreen(result: result);
  }
}
