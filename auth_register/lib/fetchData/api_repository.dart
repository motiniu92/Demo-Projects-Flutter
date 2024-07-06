import 'package:auth_register/fetchData/dashboard_data_response_model.dart';

import 'api_provider.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<DashboardDataResponse> fetchDashboardList() {
    return _provider.fetchDashboardList();
  }
}

class NetworkError extends Error {}