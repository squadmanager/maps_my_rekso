import 'dart:io';

import 'package:http/http.dart' as http;

import '../../models/mceasy/mc_trips_detail_model.dart';
import '../../models/mceasy/mc_trips_model.dart';
import '../../models/mceasy/mc_vehicle_detail_model.dart';
import '../../models/mceasy/mc_vehicle_model.dart';
import '../../models/mceasy/mc_vehicle_statuses_model.dart';
import '../mc_url_api.dart';

class McProvider {
  Future<List<DataMcVehicleModel>> getVehicles(token) async {
    final response = await http.get(
      Uri.parse(McUrlApi().vehicle),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    // if (response.statusCode == 500) {
    //   await EasyLoading.dismiss();
    //   SnackbarWidget().getSnackbar(
    //       'Alert!', 'Server error, please contact the administrator', 'error');
    // } else if (response.statusCode != 200) {
    //   await EasyLoading.dismiss();
    //   SnackbarWidget()
    //       .getSnackbar('alert'.tr, 'alertErrorRetrieving'.tr, 'error');
    // }

    var responseBody = mcVehicleModelFromJson(response.body).data;

    return responseBody;
  }

  Future<DataMcVehicleDetail> getVehicleDetail(token, vehicleId) async {
    final response = await http.get(
      Uri.parse('${McUrlApi().vehicle}/$vehicleId'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    var responseBody = mcVehicleDetailModelFromJson(response.body).data;

    return responseBody;
  }

  Future<DataMcTripsModel> getTrips(
      token, vehicleId, startDate, endDate) async {
    final response = await http.get(
      Uri.parse(
          '${McUrlApi().trips}?vehicleId=$vehicleId&startDate=$startDate&endDate=$endDate'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    // if (response.statusCode == 500) {
    //   await EasyLoading.dismiss();
    //   SnackbarWidget().getSnackbar(
    //       'Alert!', 'Server error, please contact the administrator', 'error');
    // } else if (response.statusCode != 200) {
    //   await EasyLoading.dismiss();
    //   SnackbarWidget()
    //       .getSnackbar('alert'.tr, 'alertErrorRetrieving'.tr, 'error');
    // }

    var responseBody = mcTripsModelFromJson(response.body).data;

    return responseBody;
  }

  Future<List<DataMcTripsDetailModel>> getTripsDetail(
      token, vehicleId, startDate, endDate) async {
    final response = await http.get(
      Uri.parse(
          '${McUrlApi().trips}/$vehicleId/detail?startDate=$startDate&endDate=$endDate'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    // if (response.statusCode == 500) {
    //   await EasyLoading.dismiss();
    //   SnackbarWidget().getSnackbar(
    //       'Alert!', 'Server error, please contact the administrator', 'error');
    // } else if (response.statusCode != 200) {
    //   await EasyLoading.dismiss();
    //   SnackbarWidget()
    //       .getSnackbar('alert'.tr, 'alertErrorRetrieving'.tr, 'error');
    // }

    var responseBody = mcTripsDetailModelFromJson(response.body).data;

    return responseBody;
  }

  Future<List<DataMcVehicleStatusesModel>> getVehicleStatuses(token) async {
    final response = await http.get(
      Uri.parse('${McUrlApi().vehicleStatuses}?withAddress=true'),
      headers: {
        // 'Access-Control-Allow-Methods': 'GET',
        // 'Access-Control-Allow-Headers': 'X-Requested-With',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        // HttpHeaders.authorizationHeader: 'Bearer $token',
        'Access-Control-Allow-Origin': '*',
      },
    );

    // if (response.statusCode == 500) {
    //   await EasyLoading.dismiss();
    //   SnackbarWidget().getSnackbar(
    //       'Alert!', 'Server error, please contact the administrator', 'error');
    // } else if (response.statusCode != 200) {
    //   await EasyLoading.dismiss();
    //   SnackbarWidget()
    //       .getSnackbar('alert'.tr, 'alertErrorRetrieving'.tr, 'error');
    // }

    var responseBody = mcVehicleStatusesModelFromJson(response.body).data;

    return responseBody;
  }
}
