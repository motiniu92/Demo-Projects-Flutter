import 'package:equatable/equatable.dart';

enum LoginStatus { initail, loading, success, error }

class LoginState extends Equatable {
  const LoginState(
      {
        this.name = '',
        this.email = '',
        this.mobile = '',
        this.password = '',
        this.confirmPassword = '',
        this.tutorType = '',
        this.message = '',
        this.loginStatus = LoginStatus.initail
      //   this.name = 'motin',
      // this.email = 'motiniu92@gmail.com',
      // this.mobile = '01540509298',
      // this.password = '12345678',
      // this.confirmPassword = '12345678',
      // this.tutorType = 'tutor',
      // this.message = '',
      // this.loginStatus = LoginStatus.initail

      });

  final String name;
  final String email;
  final String mobile;
  final String password;
  final String confirmPassword;
  final String tutorType;
  final String message;
  final LoginStatus loginStatus;

  LoginState copyWith({
    String? name,
    String? email,
    String? mobile,
    String? password,
    String? confirmPassword,
    String? tutorType,
    String? message,
    LoginStatus? loginStatus,
  }) {
    return LoginState(
      name: name ?? this.name,
      email: email ?? this.email,
      mobile: mobile ?? this.mobile,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      tutorType: tutorType ?? this.tutorType,
      message: message ?? this.message,
      loginStatus: loginStatus ?? this.loginStatus,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        name,
        email,
        mobile,
        password,
        confirmPassword,
        tutorType,
        message,
        loginStatus
      ];
}
