import 'dart:convert';

import 'package:flutter/semantics.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

class CourseMultiDropdownSelect extends StatefulWidget {
  final List<dynamic> selectedCourses; // Added parameter
  final Function(List<dynamic>) onSelectionChanged; // Added parameter

  CourseMultiDropdownSelect({
    required this.selectedCourses,
    required this.onSelectionChanged,
  });

  @override
  _CourseMultiDropdownSelectState createState() =>
      _CourseMultiDropdownSelectState();
}

class _CourseMultiDropdownSelectState
    extends State<CourseMultiDropdownSelect> {
  List<dynamic> _coursesList = [];

  @override
  void initState() {
    super.initState();
    //_fetchInstitutes();
  }

  Future<void> _fetchInstitutes() async {

    //------------------------
    //final url = 'https://api.softpark.xyz/api/institute';
    //---------------------------
    final url = 'https://api.besttutor.xyz/api/get-form-select-data';

    try {
      final response = await http.get(Uri.parse(url), headers: {
        'Accept': 'application/json',
      });

      final parsedJson = jsonDecode(response.body);
      final List categoryJson = (parsedJson['categories']) as List;
      print("List....:" + categoryJson.toString());

      if (response.statusCode == 200) {

        setState(() {
          //--------------------
          // _institutes = json.decode(response.body);
          //--------------------------
          _coursesList = categoryJson;
        });
      } else {
        throw Exception('Failed to load institutes');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MultiSelectDialogField(
          items: _coursesList
              .map((institute) =>
              MultiSelectItem<dynamic>(institute, institute['name']))
              .toList(),
          initialValue: widget.selectedCourses, // Use widget.selectedInstitutes
          onConfirm: (List<dynamic> results) {
            print('Selected...:'+ results.toString());
            setState(() {
              widget.onSelectionChanged(results); // Call callback function
            });
          },
          onSelectionChanged: (results) {
            print('Change..:'+results.toString());
          },

          title: Text('Select Institutes'),
          buttonText: Text('Select Institutes'),

          chipDisplay: MultiSelectChipDisplay(
            onTap: (value) {
              print('Selected...:'+ value.toString());
              setState(() {
                widget.selectedCourses.remove(value);
                widget.onSelectionChanged(widget.selectedCourses); // Call callback function
              });
            },
          ),
        ),
        SizedBox(height: 20),
        Text(
          'Selected Institutes: ${widget.selectedCourses.map((item) => item['name']).join(', ')}',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}


