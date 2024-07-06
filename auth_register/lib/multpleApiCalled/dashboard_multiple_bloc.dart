import 'package:auth_register/fetchData/dashboard_event.dart';
import 'package:auth_register/fetchData/dashboard_state.dart';
import 'package:auth_register/multpleApiCalled/dashboard_count_event.dart';
import 'package:auth_register/multpleApiCalled/dashboard_count_state.dart';
import 'package:auth_register/multpleApiCalled/multiple_api_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class DashboardMultipleBloc extends Bloc<DashboardCountEvent, DashboardCountState> {
  DashboardMultipleBloc() : super(DashboardCountInitial()) {
    final MultipleApiRepository _multipleApiRepository = MultipleApiRepository();

    on<GetDashboardMultipleApiData>((event, emit) async {
      try {
        emit(DashboardCountLoading());
        final dataCount = await _multipleApiRepository.fetchMultipleDashboardCountData();
        emit(DashboardCountMultipleDataLoaded(dataCount));
        // if (mList.error != null) {
        //   emit(DashboardError(mList.error));
        // }
      } on NetworkError {
        emit(DashboardCountError("Failed to fetch data. is your device online?"));
      }
    });


  }
}
