import 'package:auth_register/fetchData/dashboard_bloc.dart';
import 'package:auth_register/fetchData/dashboard_data_response_model.dart';
import 'package:auth_register/fetchData/dashboard_event.dart';
import 'package:auth_register/fetchData/dashboard_state.dart';
import 'package:auth_register/multpleApiCalled/dashboard_count_event.dart';
import 'package:auth_register/multpleApiCalled/dashboard_count_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../multpleApiCalled/dashboard_multiple_bloc.dart';

class DashboardDataScreen extends StatefulWidget {
  @override
  State<DashboardDataScreen> createState() => _DashboardDataScreenState();
}

class _DashboardDataScreenState extends State<DashboardDataScreen> {
  final DashboardBloc _dashboardBloc = DashboardBloc();
  final DashboardMultipleBloc _dashboardMultipleBloc = DashboardMultipleBloc();

  @override
  void initState() {
    super.initState();
    _dashboardBloc.add(GetDashboardDataList());
    _dashboardMultipleBloc.add(GetDashboardMultipleApiData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: BlocProvider(
                create: (_) => _dashboardMultipleBloc,
                child: BlocListener<DashboardMultipleBloc, DashboardCountState>(
                  listener: (context, state) {
                    if (state is DashboardCountError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.message!),
                        ),
                      );
                    }
                  },
                  child: BlocBuilder<DashboardMultipleBloc, DashboardCountState>(
                    builder: (context, state) {
                      if (state is DashboardCountInitial) {
                        return _buildLoading();
                      } else if (state is DashboardCountLoading) {
                        return _buildLoading();
                      } else if (state is DashboardCountMultipleDataLoaded) {
                        return Container(
                          width: 350,
                            child: Card(
                              child: Column(
                                children: [
                                  Text(
                                      state.dashboardDataResponse.jobCount.toString(), style: TextStyle(fontSize: 30),),
                                  Text(
                                      state.dashboardDataResponse.nearByJobs.toString(), style: TextStyle(fontSize: 30),),
                                  Text(
                                      state.dashboardDataResponse.myJobs.toString(), style: TextStyle(fontSize: 30),),
                                ],
                              ),
                            ));
                      } else if (state is DashboardCountError) {
                        return Container();
                      } else {
                        return Container();
                      }
                    },
                  ),
                ),
              ),
            ),
            _buildListCovid(),
          ],
        ),
      ),
    );
  }

  Widget _buildListCovid() {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (_) => _dashboardBloc,
        child: BlocListener<DashboardBloc, DashboardState>(
          listener: (context, state) {
            if (state is DashboardError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          },
          child: BlocBuilder<DashboardBloc, DashboardState>(
            builder: (context, state) {
              if (state is DashboardInitial) {
                return _buildLoading();
              } else if (state is DashboardLoading) {
                return _buildLoading();
              } else if (state is DashboardLoaded) {
                return _buildCard(context, state.dashboardDataResponse);
              } else if (state is DashboardError) {
                return Container();
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, DashboardDataResponse model) {
    return Container(
      height: 450,
      child: ListView.builder(
        itemCount: model.name.toString().length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(8.0),
            child: Card(
              child: Container(
                margin: EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Text("Country: ${model.name.toString()}"),
                    Text("Total Confirmed: ${model.email}"),
                    Text("Total Deaths: ${model.mobile}"),
                    Text("Total Recovered: ${model.gender}"),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildLoading() => Center(child: CircularProgressIndicator());
}
