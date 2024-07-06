import 'package:auth_register/fetchData/dashboard_event.dart';
import 'package:auth_register/fetchData/dashboard_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'api_repository.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardInitial()) {
    final ApiRepository _apiRepository = ApiRepository();

    on<GetDashboardDataList>((event, emit) async {
      try {
        emit(DashboardLoading());
        final mList = await _apiRepository.fetchDashboardList();
        emit(DashboardLoaded(mList));
        // if (mList.error != null) {
        //   emit(DashboardError(mList.error));
        // }
      } on NetworkError {
        emit(DashboardError("Failed to fetch data. is your device online?"));
      }
    });
  }
}
