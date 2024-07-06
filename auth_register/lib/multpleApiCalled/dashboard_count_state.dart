import 'package:auth_register/fetchData/dashboard_data_response_model.dart';
import 'package:equatable/equatable.dart';

abstract class DashboardCountState extends Equatable {
  const DashboardCountState();

  @override
  List<Object?> get props => [];
}

class DashboardCountInitial extends DashboardCountState {}

class DashboardCountLoading extends DashboardCountState {}

class DashboardCountMultipleDataLoaded extends DashboardCountState {
  final DashboardDataResponse dashboardDataResponse;

  const DashboardCountMultipleDataLoaded(this.dashboardDataResponse);
}

class DashboardCountError extends DashboardCountState {
  final String? message;

  const DashboardCountError(this.message);
}
