import 'package:auth_register/dropdownListData/form_select_Provider.dart';
import 'package:auth_register/dropdownListData/form_select_response_list.dart';
import 'package:auth_register/fetchData/dashboard_data_response_model.dart';



class FormSelectRepository {
  final _provider = FormSelectProvider();

  Future<Categories> fetchFormSelectResponseList() {
    return _provider.fetchFormSelectResponseList();
  }

}

class NetworkError extends Error {}
