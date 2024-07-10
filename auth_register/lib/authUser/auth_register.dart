import 'package:auth_register/dropdownListData/form_select_screen.dart';
import 'package:auth_register/fetchData/dashboard_data_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../dropdownListData/multi_select_dropdown_button.dart';
import 'auth_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';
import 'dropdown.dart';

class AuthRegisterScreen extends StatefulWidget {
  @override
  State<AuthRegisterScreen> createState() => _AuthRegisterScreenState();
}

class _AuthRegisterScreenState extends State<AuthRegisterScreen> {
  late AuthBloc _authBloc;
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
    _authBloc = AuthBloc();
  }

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _mobileController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _confirmPasswordController =
      TextEditingController();

  String? selectedGuardianTutor;

  @override
  Widget build(BuildContext context) {
    //final AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);

    return Scaffold(
        body: BlocProvider(
      create: (_) => _authBloc,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

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
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DashboardDataScreen()));
              },
              child: Text('Called Get Api'),
            ),

            SizedBox(
              height: 20,
            ),

            // ------------- Name --------------
            BlocBuilder<AuthBloc, LoginState>(
              buildWhen: (current, previous) => current.name != previous.name,
              builder: (context, state) {
                return TextFormField(
                  //keyboardType: TextInputType.text,
                  //focusNode: nameFocusNode,
                  controller: _nameController,
                  decoration: const InputDecoration(
                    hintText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    print("name....: " + value);
                    context.read<AuthBloc>().add(NameChanged(name: value));
                  },
                  onFieldSubmitted: (value) {},
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),

            // ------------- Email --------------
            BlocBuilder<AuthBloc, LoginState>(
              buildWhen: (current, previous) => current.email != previous.email,
              builder: (context, state) {
                return TextFormField(
                  // keyboardType: TextInputType.text,
                  //focusNode: emailFocusNode,
                  controller: _emailController,
                  decoration: const InputDecoration(
                    hintText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    print("email....:" + value);
                    context.read<AuthBloc>().add(EmailChanged(email: value));
                  },
                  onFieldSubmitted: (value) {},
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),

            // ------------- Mobile --------------
            BlocBuilder<AuthBloc, LoginState>(
              buildWhen: (current, previous) =>
                  current.mobile != previous.mobile,
              builder: (context, state) {
                return TextFormField(
                  //keyboardType: TextInputType.text,
                  //focusNode: mobileFocusNode,
                  controller: _mobileController,
                  decoration: const InputDecoration(
                    hintText: 'Mobile',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    print("Mobile Number....: " + value);
                    context.read<AuthBloc>().add(MobileChanged(mobile: value));
                  },
                  onFieldSubmitted: (value) {},
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),

            // ------------- Password --------------
            BlocBuilder<AuthBloc, LoginState>(
              buildWhen: (current, previous) =>
                  current.password != previous.password,
              builder: (context, state) {
                return TextFormField(
                  // keyboardType: TextInputType.text,
                  //focusNode: passwordFocusNode,
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    print("Password....: " + value);
                    context
                        .read<AuthBloc>()
                        .add(PasswordChanged(password: value));
                  },
                  onFieldSubmitted: (value) {},
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),

            // ------------- Confirm Password --------------
            BlocBuilder<AuthBloc, LoginState>(
              buildWhen: (current, previous) =>
                  current.confirmPassword != previous.confirmPassword,
              builder: (context, state) {
                return TextFormField(
                  //keyboardType: TextInputType.text,
                  //focusNode: confirmPasswordFocusNode,
                  controller: _confirmPasswordController,
                  decoration: const InputDecoration(
                    hintText: 'Confirm Password',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    print("Confirm password....: " + value);
                    context
                        .read<AuthBloc>()
                        .add(ConfirmPasswordChanged(confirmPassword: value));
                  },
                  onFieldSubmitted: (value) {},
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),

            // ------------- guardianTutor Dropdown -----------
            BlocBuilder<AuthBloc, LoginState>(
              buildWhen: (current, previous) =>
                  current.tutorType != previous.tutorType,
              builder: (context, state) {
                return GuardianTutorDropdown(
                  //keyboardType: TextInputType.text,
                  //focusNode: nameFocuNode,
                  onChanged: (value) {
                    selectedGuardianTutor = value.toString();
                    print("Dropdown...: " + selectedGuardianTutor!);
                    context
                        .read<AuthBloc>()
                        .add(TutorTypeChanged(tutorType: value.toString()));
                  },
                  // onFieldSubmitted: (value) {},
                );
              },
            ),

            const SizedBox(
              height: 20,
            ),

            // ------------- Button --------------
            BlocListener<AuthBloc, LoginState>(
              listener: (context, state) {
                if (state.loginStatus == LoginStatus.error) {
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      SnackBar(content: Text(state.message.toString())),
                    );
                }

                if (state.loginStatus == LoginStatus.loading) {
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      const SnackBar(content: Text('Submiting')),
                    );
                }

                if (state.loginStatus == LoginStatus.success) {
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      SnackBar(content: Text(state.message.toString())),
                    );
                }
                print("Response Data.......: " + state.message.toString());
              },
              child: BlocBuilder<AuthBloc, LoginState>(
                buildWhen: (current, previous) => false,
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(LoginApi());
                    },
                    child: Text('Login'),
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
