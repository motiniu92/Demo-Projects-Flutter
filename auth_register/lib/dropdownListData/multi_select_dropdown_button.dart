import 'dart:convert';

import 'package:flutter/semantics.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

class MultiSelectDropdownExample extends StatefulWidget {
  final List<dynamic> selectedInstitutes; // Added parameter
  final Function(List<dynamic>) onSelectionChanged; // Added parameter

  MultiSelectDropdownExample({
    required this.selectedInstitutes,
    required this.onSelectionChanged,
  });

  @override
  _MultiSelectDropdownExampleState createState() =>
      _MultiSelectDropdownExampleState();
}

class _MultiSelectDropdownExampleState
    extends State<MultiSelectDropdownExample> {
  List<dynamic> _institutes = [];

  @override
  void initState() {
    super.initState();
    _fetchInstitutes();
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
          _institutes = categoryJson;
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
          items: _institutes
              .map((institute) =>
              MultiSelectItem<dynamic>(institute, institute['name']))
              .toList(),
          initialValue: widget.selectedInstitutes, // Use widget.selectedInstitutes
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
                widget.selectedInstitutes.remove(value);
                widget.onSelectionChanged(widget.selectedInstitutes); // Call callback function
              });
            },
          ),
        ),
        SizedBox(height: 20),
        Text(
          'Selected Institutes: ${widget.selectedInstitutes.map((item) => item['name']).join(', ')}',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}



//----------------------------------------------------------
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// class MultiSelectDropdownButton extends StatefulWidget{
//   @override
//   _MultiSelectDropdownButtonState createState() => _MultiSelectDropdownButtonState();
// }
//
// class _MultiSelectDropdownButtonState extends State<MultiSelectDropdownButton> {
//
//   Future<List<String>> fetchData() async {
//     final response = await http.get(Uri.parse('https://api.besttutor.xyz/api/multiClassesSubjects?classes_id=18'));
//
//     if (response.statusCode == 200) {
//       List<dynamic> data = json.decode(response.body);
//       print('Response Data....:'+ data.toString());
//       return data.map((item) => item.toString()).toList();
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }
//
//
//   List<String> _selectedItems = [];
//   List<String> _dropdownItems = [];
//
//   @override
//   void initState() {
//     super.initState();
//     fetchData().then((data) {
//       setState(() {
//         _dropdownItems = data;
//       });
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:
//       Center(
//         child: DropdownButtonFormField(
//           isExpanded: true,
//           decoration: InputDecoration(
//             labelText: 'Select Items',
//             border: OutlineInputBorder(),
//           ),
//           value: _selectedItems.isNotEmpty ? _selectedItems : null,
//           items: _dropdownItems.map((item) {
//             return DropdownMenuItem(
//               value: item,
//               child: Text(item),
//             );
//           }).toList(),
//           onChanged: (value) {
//             setState(() {
//               _selectedItems.contains(value)
//                   ? _selectedItems.remove(value)
//                   : _selectedItems.add(value.toString()+value.toString());
//             });
//           },
//         ),
//       ),
//     );
//   }
// }