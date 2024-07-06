import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  final String baseUrl =
      'https://api.softpark.xyz/api'; // Replace with your API base URL

  Future<String> login(String name, String email, String mobile,
      String password, String confirmPassword, String tutorType) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      body: jsonEncode({
        'name': name,
        'email': email,
        'mobile': mobile,
        'password': password,
        'confirmPassword': confirmPassword,
        'tutorType': tutorType
      }),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 201) {
      final responseBody = jsonDecode(response.body);
      print("Success message......: " + jsonDecode(response.body));
      return jsonDecode(responseBody);
    } else {
      throw Exception('Failed to authenticate');
    }
  }
}
