import 'package:auth_register/dropdownListData/form_select_screen.dart';
import 'package:auth_register/fetchData/dashboard_data_screen.dart';
import 'package:auth_register/jobPost/course_multi_dropdown_select.dart';
import 'package:auth_register/jobPost/job_post_bloc.dart';
import 'package:auth_register/jobPost/job_post_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../authUser/dropdown.dart';
import '../dropdownListData/multi_select_dropdown_button.dart';
import 'job_post_state.dart';


class JobPostScreen extends StatefulWidget {
  @override
  State<JobPostScreen> createState() => _JobPostScreenState();
}

class _JobPostScreenState extends State<JobPostScreen> {
  late JobPostBloc _jobPostBloc;
  final nameFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final mobileFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final confirmPasswordFocusNode = FocusNode();
  final tutorTypeFocusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _jobPostBloc = JobPostBloc();
    //loadCounter();
  }

  void loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      // _counter = (prefs.getInt('counter') ?? 0);
      _courses = prefs.getString('course_list') as List;
      print("Otp Screen Get Data..."+ _courses.toString());
    });
  }

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _mobileController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _confirmPasswordController =
      TextEditingController();

  String? categoryId;

  List<dynamic> _selectedInstitutes = [];
  List<dynamic> _courses = [];

  @override
  Widget build(BuildContext context) {
    //final AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);

    return Scaffold(
        body: BlocProvider(
      create: (_) => _jobPostBloc,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 10,
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FormSelectScreen()));
              },
              child: Text('Form Select List'),
            ),

            SizedBox(
              height: 20,
            ),


            // ------------- CategoryId --------------
            BlocBuilder<JobPostBloc, JobPostState>(
              buildWhen: (current, previous) => current.categoriesId != previous.categoriesId,
              builder: (context, state) {
                return  MultiSelectDropdownExample(
                  selectedInstitutes: _selectedInstitutes,
                  onSelectionChanged: (newValue) {
                    //onPressed: () {
                    //context.read<JobPostBloc>().add(JobPostClassCourseApi());
                   // };
                   // context.read<JobPostBloc>().add(JobPostClassCourseApi());
                    setState(() async {
                      _selectedInstitutes = newValue;
                      categoryId = _selectedInstitutes.map((item) => item['id']).join(',');
                      print('Clicked....'+ _selectedInstitutes.map((item) => item['id']).join(','),);
                      print('Clicked-2....'+ categoryId.toString());
                      //submitJobPost();
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      prefs.setString('categories_id', categoryId.toString());
                      context.read<JobPostBloc>().add(CategoriesIdChanged(categoriesId: _selectedInstitutes.map((item) => item['id']).join(','),));

                      //====================
                      //onPressed: () {
                      context.read<JobPostBloc>().add(JobPostClassCourseApi());
                     // };
                      //====================
                    });
                  },
                );

              },
            ),


            const SizedBox(
              height: 10,
            ),

            // ------------- Courses --------------

            BlocBuilder<JobPostBloc, JobPostState>(
              buildWhen: (current, previous) => current.categoriesId != previous.categoriesId,
              builder: (context, state) {
                return  CourseMultiDropdownSelect(
                  selectedCourses: _courses,
                  onSelectionChanged: (newValue) {

                    setState(() async {
                      _courses = newValue;
                      //categoryId = _courses.map((item) => item['id']).join(',');
                      print('Course dropdown....'+ _courses.map((item) => item['id']).join(','),);
                      //print('Clicked-2....'+ categoryId.toString());
                      //submitJobPost();
                      //SharedPreferences prefs = await SharedPreferences.getInstance();
                     // prefs.setString('categories_id', categoryId.toString());

                      //context.read<JobPostBloc>().add(CategoriesIdChanged(categoriesId: _selectedInstitutes.map((item) => item['id']).join(','),));

                      //====================
                      //context.read<JobPostBloc>().add(JobPostClassCourseApi());
                      //====================
                    });
                  },
                );

              },
            ),




            const SizedBox(
              height: 20,
            ),

            // ------------- Button --------------
            BlocListener<JobPostBloc, JobPostState>(
              listener: (context, state) {
                if (state.jobPostStatus == JobPostStatus.error) {
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      SnackBar(content: Text(state.message.toString())),
                    );
                }

                if (state.jobPostStatus == JobPostStatus.loading) {
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      const SnackBar(content: Text('Submiting')),
                    );
                }

                if (state.jobPostStatus == JobPostStatus.success) {
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      SnackBar(content: Text(state.message.toString())),
                    );
                }
                print("Response Data Screen.......: " + state.message.toString());

                if(state is JobListDataLoaded){
                  print('Check course list...'+ state.coursesList.toString());
                  setState(() {
                    //loadCounter();
                    _courses = state.coursesList;
                    print('Check course list-2...'+ state.coursesList.toString());

                  });
                }
              },
              child: BlocBuilder<JobPostBloc, JobPostState>(
                buildWhen: (current, previous) => false,
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: () {
                      context.read<JobPostBloc>().add(JobPostApi());
                    },
                    child: Text('Job Post Submit'),
                  );
                },
              ),
            )
          ],
        ),
      ),
    ));
  }
}
