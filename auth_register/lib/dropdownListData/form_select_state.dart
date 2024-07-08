import 'package:auth_register/dropdownListData/form_select_response_list.dart';
import 'package:auth_register/fetchData/dashboard_data_response_model.dart';
import 'package:equatable/equatable.dart';

abstract class FormSelectState extends Equatable {
  const FormSelectState();

  @override
  List<Object?> get props => [];
}

class FormSelectInitial extends FormSelectState {}

class FormSelectLoading extends FormSelectState {}

class FormSelectLoaded extends FormSelectState {
  final Categories formSelectResponseList;

  const FormSelectLoaded(this.formSelectResponseList);
}

class FormSelectError extends FormSelectState {
  final String? message;

  const FormSelectError(this.message);
}
