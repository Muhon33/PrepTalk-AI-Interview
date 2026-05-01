import 'package:flutter/material.dart';
import 'package:preptalk_app/screens/interview_home_screen.dart';

class PrepTalkApp extends StatelessWidget {
  const PrepTalkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PrepTalk',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0A0B15),
      ),
      home: const InterviewHomeScreen(),
    );
  }
}
