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

//-------------------------------------------
// //final String baseUrl = 'https://your-api-url.com'; // Replace with your API base URL
// final String baseUrl = 'https://api.softpark.xyz/api'; //https://api.softpark.xyz/api/register
//
// Future<Map<String, dynamic>> authRegistration(String name, String email, String mobile, String password, String confirmPassword) async {
//
//   final response = await http.post(
//     Uri.parse('$baseUrl/register'),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(<String, String>{
//       // 'email': email,
//       // 'password': password,
//       'name': name,
//       'email': email,
//       'mobile': mobile,
//       'password': password,
//       'confirmPassword': confirmPassword
//       //'tutorType': selectedTutorTypes,
//
//     }),
//   );
//
//   if (response.statusCode == 201) {
//     // Successful sign-in
//     print("Success message......: "+ jsonDecode(response.body));
//     return jsonDecode(response.body);
//
//
//   } else {
//     // Handle errors
//     throw Exception('Failed to sign in');
//   }
//
//
// }
}
