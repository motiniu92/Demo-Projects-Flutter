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

import 'multi_select_dropdown_button.dart';

class FormSelectScreen extends StatefulWidget {
  @override
  State<FormSelectScreen> createState() => _FormSelectScreenState();
}

class _FormSelectScreenState extends State<FormSelectScreen> {
 // late FormSelectBloc _formSelectBloc = FormSelectBloc();

  String? selectedTuitionType;
  String? selectedCountry;
  String? selectedDivision;
  String? selectedDistrict;
  String? selectedArea;
  String? selectedDaysPerWeek;
  String? selectedstudentgender;
  String? selectedTeachergender;
  String? selectedhairaboutus;
  String? categoryId;

  List<dynamic> _selectedInstitutes = [];
  List<dynamic> _selectedBackgrounds = [];
  List<dynamic> _selectedCategories = [];
  List<dynamic> _selectedClassandCourse = [];
  List<dynamic> _selectedPrefarableSubject = [];


  Future<void> submitJobPost() async {
    try {




      // Construct the request body
      final Map<String, dynamic> requestBody = {


        // 'tuition_type_id': selectedTuitionType.toString(),
        // 'country_id': selectedCountry.toString(),
        // 'division_id': selectedDivision.toString(),
        // 'district_id': selectedDistrict.toString(),
        // 'area_id': selectedArea.toString(),
        // 'category_id': _selectedCategories.map((item) => item['id']).join(','),
        // 'class_or_course_id':
        // _selectedClassandCourse.map((item) => item['id']).join(','),
        // "hire_date": formattedTuitionTime.toString(),
        // 'subject_ids':
        // _selectedPrefarableSubject.map((item) => item['id']).join(','),
        // 'salary': salary.toString(),
        // "number_of_student": numberOfStudents.toString(),
        // "student_gender": selectedstudentgender.toString(),
        // 'hear_about_us_id': selectedhairaboutus.toString(),
        // "tutor_gender": selectedTeachergender.toString(),
        //
        //
        //
        // 'address_details': address.toString(),
        // 'more_requirement': requirement.toString(),
        // "days_of_week": daysweek.toString(),
        // "tuition_time": formattedHireDate.toString(),
        // 'education_background_id':
        // _selectedBackgrounds.map((item) => item['id']).join(','),
       categoryId= 'categories_id':
        _selectedInstitutes.map((item) => item['id']).join(','),

        // Add other fields as needed
      };

      print("checking- $requestBody");
      print("checking-2- $categoryId");


    } catch (error) {
      print('Error creating job post: $error');
      // Handle the error as per your application's requirements
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     //_formSelectBloc = FormSelectBloc();
  }

  //-------------------------------
//   Future<List<PostsModel>> getPostApi() async {
// // https://jsonplaceholder.typicode.com/posts
//     try {
//       final response = await http.get(
//         Uri.parse(
//             'https://api.besttutor.xyz/api/multiClassesSubjects?classes_id=18'),
//         headers: {
//           'Accept': 'application/json',
//         },
//       );
//       final body = json.decode(response.body) as List;
//       if (response.statusCode == 200) {
//         print("Form response data....:" + response.body.toString());
//         return body.map((dynamic json) {
//           final map = json as Map<String, dynamic>;
//           print('Seconed....: '+ map['name']);
//           return PostsModel(
//             id: map['id'] as int,
//             name: map['name'] as String,
//             courseName: map['course_name'] as String,
//           );
//         }).toList();
//       }
//     } on SocketException {
//       await Future.delayed(const Duration(milliseconds: 1800));
//       throw Exception('No Internet Connection');
//     } on TimeoutException {
//       throw Exception('');
//     }
//     throw Exception('error fetching data');
//   }
//
//   var newData;
//--------------------------
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

            SizedBox(height: 10),
            MultiSelectDropdownExample(
              selectedInstitutes: _selectedInstitutes,
              onSelectionChanged: (newValue) {
                setState(() {
                  _selectedInstitutes = newValue;
                  categoryId = _selectedInstitutes.map((item) => item['id']).join(',');
                  print('Clicked....'+ _selectedInstitutes.map((item) => item['id']).join(','),);
                  print('Clicked-2....'+ categoryId.toString());
                  submitJobPost();
                });
              },
            ),
            SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {
               // if (_formKey.currentState!.validate()) {
                  // Form is valid, proceed with submission
                  submitJobPost(); // Call the function to submit job post
              //  }
              },
              child: Text('Submit'),
            ),

            //---------------------
            // FutureBuilder<List<PostsModel>>(
            //   future: getPostApi(),
            //   builder: (context, snapshot) {
            //     if (snapshot.hasData) {
            //       return DropdownButton(
            //         // Initial Value
            //         value: newData,
            //         hint: Text('Select value'),
            //         isExpanded: true,
            //         // Down Arrow Icon
            //         icon: const Icon(Icons.keyboard_arrow_down),
            //
            //         // Array list of items
            //         items: snapshot.data!.map((item) {
            //           return DropdownMenuItem(
            //             value: item.id,
            //             child: Text(item.name.toString()),
            //           );
            //         }).toList(),
            //         onChanged: (value) {
            //           print('Selected....:' + value.toString());
            //           newData = value;
            //           setState(() {});
            //         },
            //       );
            //     } else {
            //       return Center(child: const CircularProgressIndicator());
            //     }
            //   },
            // )
            //-----------------------------
            SizedBox(height: 10),



          ],
        ),
      ),
    );
  }
}
