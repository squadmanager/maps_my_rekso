import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:maps_my_rekso/app/data/models/attachment_daily_task_model.dart';
import 'package:maps_my_rekso/app/data/providers/url_api.dart';
import 'package:maps_my_rekso/app/modules/home/controllers/home_controller.dart';
import 'package:maps_my_rekso/app/widgets/snackbar_widget.dart';

class AttachmentProvider {
  final HomeController loginC = Get.find<HomeController>();

  // waste collection
  // task dragonfly
  Future<List<DataAttachmentDailyTaskModel>> getImageWc(token, id) async {
    final response = await http.get(
      Uri.parse('${UrlApi().getImageWhereDailyTask}/$id'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (jsonDecode(response.body)['message'] == 'Unauthenticated.') {
      loginC.logout();
      SnackbarWidget()
              .getSnackbar('Something went wrong', 'Please Reload this page ', 'error');
    }

    var responseBody = attachmentDailyTaskModelFromJson(response.body).data;

    return responseBody;
  }  

  // task compactor
  Future<List<DataAttachmentDailyTaskModel>> getImageCompactor(
      token, id) async {
    final response = await http.get(
      Uri.parse('${UrlApi().getImageWhereDailyTaskCompactor}/$id'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (jsonDecode(response.body)['message'] == 'Unauthenticated.') {
      loginC.logout();
      SnackbarWidget()
              .getSnackbar('Something went wrong', 'Please Reload this page ', 'error');
    }

    var responseBody = attachmentDailyTaskModelFromJson(response.body).data;

    return responseBody;
  }

  // task pruning
  Future<List<DataAttachmentDailyTaskModel>> getImagePruning(token, id) async {
    final response = await http.get(
      Uri.parse('${UrlApi().getImageWhereDailyTaskPr}/$id'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (jsonDecode(response.body)['message'] == 'Unauthenticated.') {
      loginC.logout();
      SnackbarWidget()
              .getSnackbar('Something went wrong', 'Please Reload this page ', 'error');
    }

    var responseBody = attachmentDailyTaskModelFromJson(response.body).data;

    return responseBody;
  }

  // end waste collection
}
