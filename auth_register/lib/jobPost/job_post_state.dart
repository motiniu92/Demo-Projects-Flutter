import 'package:auth_register/jobPost/course_response.dart';
import 'package:equatable/equatable.dart';

enum JobPostStatus { initail, loading, success, error }

class JobPostState extends Equatable {
  const JobPostState(
      {this.categoriesId = '',
      this.courseCategoriesId = '',
      this.message = '',
      this.jobPostStatus = JobPostStatus.initail});

  final String categoriesId;
  final String courseCategoriesId;
  final String message;
  final JobPostStatus jobPostStatus;

  JobPostState copyWith({
    String? categoriesId,
    String? courseCategoriesId,
    String? message,
    JobPostStatus? jobPostStatus,
  }) {
    return JobPostState(
      categoriesId: categoriesId ?? this.categoriesId,
      courseCategoriesId: courseCategoriesId ?? this.courseCategoriesId,
      message: message ?? this.message,
      jobPostStatus: jobPostStatus ?? this.jobPostStatus,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props =>
      [categoriesId, courseCategoriesId, message, jobPostStatus];
}

class JobListDataLoaded extends JobPostState {
  final List<dynamic> coursesList;

  const JobListDataLoaded(this.coursesList);
}
