import 'dart:convert';

import 'package:auth_register/dropdownListData/form_select_response_list.dart';

import 'package:http/http.dart' as http;

class FormSelectProvider {
  final String _url = 'https://api.besttutor.xyz/api/institute';
  //final String token = '8970|jbP29Yd7xj9hSgG8IWt7QSG8hpqNLppsX5P3ros090c54d50';

  Future<Categories> fetchFormSelectResponseList() async {
    final response = await http.get(
      Uri.parse(_url),
      headers: {
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      //print("Form Select Response Data......: " + jsonData['categories'].toString());
      print("Form Select Response Data......: " + jsonDecode(response.body));
      return Categories.fromJson(jsonData);
    } else {
      throw Exception('Failed to load data');
    }
  }

}