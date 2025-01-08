

import 'dart:convert';
import 'package:http/http.dart' as http;


class GoogleTranslator {


  Future<String> translateToBangla(String text) async {

    final url = Uri.parse(
        'https://translation.googleapis.com/language/translate/v2?key=AIzaSyDmf-zlsUHhh_9kgfAfXfsUdGqWmiiYSQU');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'q': text,
        'target': 'bn', // Bangla language code
        'source': 'en', // English language code
      }),
    );

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      return jsonResponse['data']['translations'][0]['translatedText'];
    } else {
      throw Exception(
          'Failed to translate text: ${response.statusCode} ${response.body}');
    }
  }
}

