import 'package:flutter/material.dart';
import 'package:preptalk_app/models/track_card_data.dart';
import 'package:preptalk_app/services/ai_service.dart';
import 'package:preptalk_app/screens/feedback_screen.dart';

class InterviewSessionScreen extends StatefulWidget {
  final TrackCardData? track;

  const InterviewSessionScreen({this.track, super.key});

  @override
  State<InterviewSessionScreen> createState() => _InterviewSessionScreenState();
}

class _InterviewSessionScreenState extends State<InterviewSessionScreen> {
  TrackCardData? get track => widget.track;

  @override
  Widget build(BuildContext context) {
    final title = track?.title.split('\n').first ?? 'AI Interviewer';
    return Scaffold(
      backgroundColor: const Color(0xFF09090B),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Column(
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Color(0xFFDAFF33),
                fontWeight: FontWeight.w800,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.circle, color: Color(0xFFB9FF4A), size: 10),
                SizedBox(width: 8),
                Text('Online', style: TextStyle(color: Colors.white70)),
              ],
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                const Text('11:32 AM', style: TextStyle(color: Colors.white54)),
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 520),
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.08),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Text(
                      'Tell me something about yourself.',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text('11:32 AM', style: TextStyle(color: Colors.white54)),
                ),
                const SizedBox(height: 28),
                Row(
                  children: [
                    const CircleAvatar(radius: 20, backgroundColor: Color(0xFF8A8D99), child: Icon(Icons.person, color: Color(0xFF262934))),
                    const SizedBox(width: 12),
                    Container(
                      width: 88,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.04),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Center(child: Text('...', style: TextStyle(color: Colors.white70, fontSize: 20))),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Large mic button at bottom center
          Positioned(
            bottom: 110,
            left: 0,
            right: 0,
            child: Center(
              child: GestureDetector(
                onTap: () async {
                  // Capture navigator/state before async gap to avoid context misuse
                  final navigator = Navigator.of(context);
                  // show loading while generating feedback
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (_) => const Center(child: CircularProgressIndicator()),
                  );
                  final result = await AiService.getFeedbackForTrack(track);
                  // Use captured navigator after async
                  navigator.pop(); // remove loading
                  navigator.push(MaterialPageRoute(
                    builder: (_) => FeedbackScreen(result: result),
                  ));
                },
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFDBFF2B),
                  ),
                  child: const Center(child: Icon(Icons.mic, size: 36, color: Colors.black87)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
