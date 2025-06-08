// File: lib/core/services/ai_service.dart
import 'dart:convert';
import 'dart:developer';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class AIService {
  static const String _geminiUrl =
      "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent";
  static final String _apiKey =
      dotenv.env['GEMINI_API_KEY'] ??
      ''; // Replace with your valid Gemini API key

  Future<List<String>> getSubtasks(String task) async {
    try {
      final response = await http.post(
        Uri.parse("$_geminiUrl?key=$_apiKey"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "contents": [
            {
              "parts": [
                {"text": "Break down this task into smaller subtasks: $task"},
              ],
            },
          ],
          "generationConfig": {"temperature": 0.7, "maxOutputTokens": 150},
        }),
      );

      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);
        // Explicitly cast content as String, with a fallback if the structure is invalid
        final content =
            (decoded['candidates']?[0]?['content']?['parts']?[0]?['text']
                as String?) ??
            'Error: Invalid response structure';

        if (content.startsWith('Error')) {
          return [content];
        }

        // Now content.split('\n') is Iterable<String>, and where works correctly
        return content
            .split('\n')
            .where(
              (String line) => line.trim().isNotEmpty,
            ) // Explicitly define line as String
            .map(
              (String line) =>
                  line.replaceFirst(RegExp(r'^\d+\.\s*'), '').trim(),
            )
            .toList();
      } else {
        throw Exception(
          'Failed to fetch subtasks: ${response.statusCode} - ${response.body}',
        );
      }
    } catch (e) {
      log('Error fetching subtasks: $e');
      return ['Error: Could not fetch subtasks'];
    }
  }
}
