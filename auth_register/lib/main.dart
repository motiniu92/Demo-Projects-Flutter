import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'authUser/auth_bloc.dart';
import 'authUser/auth_register.dart';

void main() {
  runApp(const MyApp());
  //runApp(MyApp(authService: authService));
}

class MyApp extends StatelessWidget {
  //const MyApp({Key? key, required this.authService}) : super(key: key);
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Sign In',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<AuthBloc>(
        create: (context) => AuthBloc(),
        child: AuthRegisterScreen(),
      ),
    );
  }
}
