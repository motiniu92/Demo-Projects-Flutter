import 'package:equatable/equatable.dart';

abstract class JobPostEvent extends Equatable {
  const JobPostEvent();

  @override
  List<Object> get props => [];
}

class CategoriesIdChanged extends JobPostEvent {
  const CategoriesIdChanged({required this.categoriesId});

  final String categoriesId;

  @override
  List<Object> get props => [categoriesId];
}


class JobPostApi extends JobPostEvent {}
//----------------------
class JobPostClassCourseApi extends JobPostEvent {}
//------------------------
