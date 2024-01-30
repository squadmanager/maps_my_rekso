import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:maps_my_rekso/app/data/providers/auth_provider.dart';
import 'package:maps_my_rekso/app/routes/app_pages.dart';
import 'package:maps_my_rekso/app/widgets/snackbar_widget.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeController extends GetxController {
  var hiddenPassword = true.obs;
  var loading = false.obs;
  var isAuth = false.obs;

  var requireConsent = false;

  var isLightTheme = false.obs;

  Future<void> autoLogin() async {
    await [
      Permission.location,
      Permission.videos,
      Permission.storage,
      Permission.photos,
      Permission.notification,
    ].request();

    await GetStorage.init();
    final box = GetStorage();

    if (box.read('dataUser') != null) {
      isAuth.value = true;
    }
  }

  Future<void> submitLogin(
      String username, String password, form, context) async {
    // final isValid = form.currentState.validate();
    // if (!isValid) {
    //   return;
    // }

    username = 'sysadmin';
    username = '111111';

    loading.value = true;
    if (username != '' && password != '') {
      var dataLogin = await AuthProvider().loginStore(username, password);
      if (dataLogin['status']) {
        var profile = await AuthProvider().getProfile(dataLogin['token']);

        if (profile.status) {
          final box = GetStorage();
          box.write(
            'dataUser',
            {
              'userId': profile.data.userId,
              'userName': profile.data.userName,
              'fullName': profile.data.fullName,
              'email': profile.data.email,
              'role': profile.data.role,
              'status': profile.data.status,
              'colour': profile.data.colour,
              'type': profile.data.type,
              'deviceToken': profile.data.deviceToken,
              'token': dataLogin['token'],
            },
          );

          loading.value = false;
          isAuth.value = true;
          Get.offAllNamed(Routes.MAPS_WASTE_COLLECTIONS);
        } else {
          loading.value = false;
          SnackbarWidget()
              .getSnackbar('Something went wrong', profile.message, 'error');
        }
      } else {
        loading.value = false;
        SnackbarWidget()
            .getSnackbar('Something went wrong', dataLogin['message'], 'error');
      }
    } else {
      loading.value = false;
      SnackbarWidget().getSnackbar('Something went wrong',
          'Username & Password cannot be empty', 'error');
    }
  }

  void logout() async {
    await GetStorage.init();
    final box = GetStorage();
    if (box.read('dataUser') != null) {
      box.erase();
    }
    Get.offAllNamed(Routes.HOME);
    isAuth.value = false;
  }
}
