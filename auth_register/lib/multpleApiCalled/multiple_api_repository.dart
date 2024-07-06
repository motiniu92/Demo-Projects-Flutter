import 'package:auth_register/fetchData/dashboard_data_response_model.dart';
import 'package:auth_register/multpleApiCalled/multiple_api_provider.dart';



class MultipleApiRepository {
  final _multipleProvider = MultipleApiProvider();

  Future<DashboardDataResponse> fetchMultipleDashboardCountData() {
    return _multipleProvider.fetchDashboardMultipleDataCount();
  }

}

class NetworkError extends Error {}
