import 'dart:convert';

import 'package:auth_register/fetchData/dashboard_data_response_model.dart';
import 'package:http/http.dart' as http;

class MultipleApiProvider {

  final String token = '8970|jbP29Yd7xj9hSgG8IWt7QSG8hpqNLppsX5P3ros090c54d50';

  final String _urlCounts = 'https://api.besttutor.xyz/api/tutor/count-job';

  Future<DashboardDataResponse> fetchDashboardMultipleDataCount() async {
    final response = await http.get(
      Uri.parse(_urlCounts),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      print("Auth Response Data Count......: " + jsonData.toString());
      return DashboardDataResponse.fromJson(jsonData);
    } else {
      throw Exception('Failed to load data');
    }
  }



}
