import 'package:equatable/equatable.dart';

abstract class DashboardCountEvent extends Equatable {
  const DashboardCountEvent();

  @override
  List<Object> get props => [];
}


class GetDashboardMultipleApiData extends DashboardCountEvent {}

