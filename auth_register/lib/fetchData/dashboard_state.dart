import 'package:auth_register/fetchData/dashboard_data_response_model.dart';
import 'package:equatable/equatable.dart';

abstract class DashboardState extends Equatable {
  const DashboardState();

  @override
  List<Object?> get props => [];
}

class DashboardInitial extends DashboardState {}

class DashboardLoading extends DashboardState {}

class DashboardLoaded extends DashboardState {
  final DashboardDataResponse dashboardDataResponse;

  const DashboardLoaded(this.dashboardDataResponse);
}

class DashboardError extends DashboardState {
  final String? message;

  const DashboardError(this.message);
}
