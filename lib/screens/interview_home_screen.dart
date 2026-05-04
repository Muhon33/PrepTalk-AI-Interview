import 'package:flutter/material.dart';
import 'package:preptalk_app/models/track_card_data.dart';
import 'package:preptalk_app/widgets/background_glow.dart';
import 'package:preptalk_app/widgets/bottom_nav.dart';
import 'package:preptalk_app/widgets/interview_orb.dart';
import 'package:preptalk_app/widgets/top_bar.dart';
import 'package:preptalk_app/widgets/track_card.dart';
import 'package:preptalk_app/screens/interview_session_screen.dart';
import 'package:preptalk_app/screens/feedback_history_screen.dart';
import 'package:preptalk_app/services/gemini_service.dart';

class InterviewHomeScreen extends StatefulWidget {
  const InterviewHomeScreen({super.key});

  @override
  State<InterviewHomeScreen> createState() => _InterviewHomeScreenState();
}

class _InterviewHomeScreenState extends State<InterviewHomeScreen> {
  int currentIndex = 1;

  final List<TrackCardData> cards = const [
    TrackCardData(
      title: 'IELTS Speaking\nInterview',
      subtitle: 'Practice IELTS speaking\nwith AI interviewer.',
      badge: 'IELTS',
      badgeColor: Color(0xFFA590FF),
      icon: Icons.chat_bubble_rounded,
    ),
    TrackCardData(
      title: 'PTE Speaking',
      subtitle: 'Practice PTE speaking\nwith AI interviewer.',
      badge: 'PTE',
      badgeColor: Color(0xFFA6D98B),
      icon: Icons.record_voice_over_rounded,
    ),
    TrackCardData(
      title: 'Web Developer\nInterview',
      subtitle: 'Practice web developer\ninterview with AI.',
      badge: '</>',
      badgeColor: Color(0xFF7868D8),
      icon: Icons.code_rounded,
    ),
    TrackCardData(
      title: 'Flutter Developer\nInterview',
      subtitle: 'Practice Flutter developer\ninterview with AI.',
      badge: '',
      badgeColor: Color(0xFF5A86FF),
      icon: Icons.flutter_dash_rounded,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final orbSize = (screenWidth - 40).clamp(200.0, 300.0);
    final titleSize = screenWidth < 390 ? 38.0 : 30.0;

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF121526), Color(0xFF090B12)],
            ),
          ),
          child: Stack(
            children: [
              const BackgroundGlow(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    /// 🔥 SCROLLABLE AREA
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(height: 10),
                            const TopBar(),
                            const SizedBox(height: 18),

                            InterviewOrb(size: orbSize),

                            const SizedBox(height: 18),

                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red, // 👈 force visible
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 12,
                                ),
                              ),
                              onPressed: () async {
                                final result = await GeminiService.sendPrompt(
                                  "Ask me one simple interview question for a beginner Flutter developer",
                                );

                                ScaffoldMessenger.of(
                                  context,
                                ).showSnackBar(SnackBar(content: Text(result)));
                              },
                              child: const Text("Test AI"),
                            ),

                            const SizedBox(height: 18),

                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Explore Interviews :',
                                style: TextStyle(
                                  fontSize: titleSize,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: -0.6,
                                ),
                              ),
                            ),

                            const SizedBox(height: 14),

                            /// 🔥 GRID (NOW PART OF MAIN SCROLL)
                            GridView.builder(
                              itemCount: cards.length,
                              shrinkWrap: true,

                              physics: const NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.zero,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 14,
                                    mainAxisSpacing: 14,
                                    childAspectRatio: 0.86,
                                  ),
                              itemBuilder: (context, index) => TrackCard(
                                data: cards[index],
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) => InterviewSessionScreen(
                                        track: cards[index],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),

                            const SizedBox(height: 80),
                          ],
                        ),
                      ),
                    ),

                    /// 🔥 FIXED BOTTOM NAV (BETTER UX)
                    BottomNav(
                      currentIndex: currentIndex,
                      onChanged: (index) {
                        if (index == 1) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => const InterviewSessionScreen(),
                            ),
                          );
                        } else if (index == 2) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => const FeedbackHistoryScreen(),
                            ),
                          );
                        } else {
                          setState(() => currentIndex = index);
                        }
                      },
                    ),

                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
