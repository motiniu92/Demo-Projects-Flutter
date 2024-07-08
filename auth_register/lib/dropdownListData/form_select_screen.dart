import 'package:auth_register/dropdownListData/form_select_bloc.dart';
import 'package:auth_register/dropdownListData/form_select_state.dart';
import 'package:auth_register/dropdownListData/posts_model.dart';
import 'package:auth_register/fetchData/dashboard_data_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FormSelectScreen extends StatefulWidget {
  @override
  State<FormSelectScreen> createState() => _FormSelectScreenState();
}

class _FormSelectScreenState extends State<FormSelectScreen> {
  late FormSelectBloc _formSelectBloc = FormSelectBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _formSelectBloc = FormSelectBloc();
  }

  Future<List<PostsModel>> getPostApi() async {
// https://jsonplaceholder.typicode.com/posts
    try {
      final response = await http.get(
        Uri.parse(
            'https://api.besttutor.xyz/api/multiClassesSubjects?classes_id=18'),
        headers: {
          'Accept': 'application/json',
        },
      );
      final body = json.decode(response.body) as List;
      if (response.statusCode == 200) {
        print("Form response data....:" + response.body.toString());
        return body.map((dynamic json) {
          final map = json as Map<String, dynamic>;
          print('Seconed....: '+ map['name']);
          return PostsModel(
            id: map['id'] as int,
            name: map['name'] as String,
            courseName: map['course_name'] as String,
          );
        }).toList();
      }
    } on SocketException {
      await Future.delayed(const Duration(milliseconds: 1800));
      throw Exception('No Internet Connection');
    } on TimeoutException {
      throw Exception('');
    }
    throw Exception('error fetching data');
  }

  var newData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dropdown Api'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder<List<PostsModel>>(
              future: getPostApi(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return DropdownButton(
                    // Initial Value
                    value: newData,
                    hint: Text('Select value'),
                    isExpanded: true,
                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),

                    // Array list of items
                    items: snapshot.data!.map((item) {
                      return DropdownMenuItem(
                        value: item.id,
                        child: Text(item.name.toString()),
                      );
                    }).toList(),
                    onChanged: (value) {
                      print('Selected....:' + value.toString());
                      newData = value;
                      setState(() {});
                    },
                  );
                } else {
                  return Center(child: const CircularProgressIndicator());
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
