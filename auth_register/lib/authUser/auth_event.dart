import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class NameChanged extends AuthEvent {
  const NameChanged({required this.name});

  final String name;

  @override
  List<Object> get props => [name];
}

class EmailChanged extends AuthEvent {
  const EmailChanged({required this.email});

  final String email;

  @override
  List<Object> get props => [email];
}

class MobileChanged extends AuthEvent {
  const MobileChanged({required this.mobile});

  final String mobile;

  @override
  List<Object> get props => [mobile];
}

class PasswordChanged extends AuthEvent {
  const PasswordChanged({required this.password});

  final String password;

  @override
  List<Object> get props => [password];
}

class ConfirmPasswordChanged extends AuthEvent {
  const ConfirmPasswordChanged({required this.confirmPassword});

  final String confirmPassword;

  @override
  List<Object> get props => [confirmPassword];
}

class TutorTypeChanged extends AuthEvent {
  const TutorTypeChanged({required this.tutorType});

  final String tutorType;

  @override
  List<Object> get props => [tutorType];
}

class LoginApi extends AuthEvent {}
