import 'package:auth_register/dropdownListData/form_select_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'form_select_event.dart';
import 'form_select_state.dart';


class FormSelectBloc extends Bloc<FormSelectEvent, FormSelectState> {
  FormSelectBloc() : super(FormSelectInitial()) {
    final FormSelectRepository _apiRepository = FormSelectRepository();

    on<GetFormSelectResponseList>((event, emit) async {
      try {
        emit(FormSelectLoading());
        final mList = await _apiRepository.fetchFormSelectResponseList();
        emit(FormSelectLoaded(mList));
        // if (mList.error != null) {
        //   emit(DashboardError(mList.error));
        // }
      } on NetworkError {
        emit(FormSelectError("Failed to fetch data. is your device online?"));
      }
    });


  }
}
