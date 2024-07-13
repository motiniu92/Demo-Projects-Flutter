import 'package:auth_register/jobPost/course_response.dart';
import 'package:equatable/equatable.dart';

enum JobPostStatus { initail, loading, success, error }

class JobPostState extends Equatable {
  const JobPostState(
      {this.categoriesId = '',
        this.message = '',
        this.jobPostStatus = JobPostStatus.initail

      });

  final String categoriesId;
  final String message;
  final JobPostStatus jobPostStatus;

  JobPostState copyWith({
    String? categoriesId,
    String? message,
    JobPostStatus? jobPostStatus,
  }) {
    return JobPostState(
      categoriesId: categoriesId ?? this.categoriesId,
      message: message ?? this.message,
      jobPostStatus: jobPostStatus ?? this.jobPostStatus,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    categoriesId,
    message,
    jobPostStatus
  ];
}

class JobListDataLoaded extends JobPostState {
  //final Categories formSelectResponseList;
  final List<dynamic> coursesList;
  //final CourseResponse courseResponse;

  //const JobListDataLoaded(this.courseResponse);
  const JobListDataLoaded(this.coursesList);
}

