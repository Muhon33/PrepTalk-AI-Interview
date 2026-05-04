import 'dart:convert';
import 'package:http/http.dart' as http;

class GeminiService {
  static const String apiKey = "AIzaSyBQNRkANEQ2ywsyV0y8SeRJRywRr-mhNXY";

  static Future<String> sendPrompt(String prompt) async {
    final url = Uri.parse(
      "https://generativelanguage.googleapis.com/v1/models/gemini-1.5-flash-latest:generateContent?key=$apiKey",
    );

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "contents": [
          {
            "parts": [
              {"text": prompt},
            ],
          },
        ],
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['candidates'][0]['content']['parts'][0]['text'];
    } else {
      throw Exception("API failed: ${response.body}");
    }
  }
}
