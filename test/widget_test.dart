// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:preptalk_app/app.dart';

void main() {
  testWidgets('Interview home renders core sections', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const PrepTalkApp());

    expect(find.text('Explore'), findsOneWidget);
    expect(find.text('Tap to start\nInterview'), findsOneWidget);
    expect(find.text('Interview'), findsNWidgets(2));
    expect(find.byIcon(Icons.mic_none_rounded), findsOneWidget);
  });
}
