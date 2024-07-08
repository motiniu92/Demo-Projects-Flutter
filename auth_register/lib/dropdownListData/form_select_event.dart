import 'package:equatable/equatable.dart';

abstract class FormSelectEvent extends Equatable {
  const FormSelectEvent();

  @override
  List<Object> get props => [];
}

class GetFormSelectResponseList extends FormSelectEvent {}