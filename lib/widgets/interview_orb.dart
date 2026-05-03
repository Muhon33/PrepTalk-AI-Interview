import 'package:flutter/material.dart';

class InterviewOrb extends StatelessWidget {
  final double size;

  const InterviewOrb({required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          center: const Alignment(-0.08, -0.1),
          radius: 0.95,
          colors: [
            const Color(0xFF24294C).withOpacity(0.6),
            const Color(0xFF0D1022).withOpacity(0.95),
          ],
        ),
        border: Border.all(
          color: const Color(0xFF9A90FF).withOpacity(0.35),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6E67FF).withOpacity(0.35),
            blurRadius: 40,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Hi, Candidate',
            style: TextStyle(
              fontSize: 18,
              color: Color.fromARGB(255, 179, 177, 202),
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Tap to start\n an Interview',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              height: 1.12,
              letterSpacing: -1,
              color: Color(0xFFB6A5FF),
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              5,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Container(
                  width: 6,
                  height: index.isEven ? 24 : 38,
                  decoration: BoxDecoration(
                    color: const Color(0xFFB7A7FF),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
