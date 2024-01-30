import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:maps_my_rekso/app/modules/home/controllers/home_controller.dart';
import 'package:maps_my_rekso/app/widgets/color_widget.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: HexColor(ColorWidget().white), // status bar color
  ));

  await GetStorage.init();
  final authC = Get.put(HomeController());
  await initializeDateFormatting('id_ID', null).then(
    (_) => runApp(
      FutureBuilder(
        future: authC.autoLogin(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Obx(
              () => GetMaterialApp(
                debugShowCheckedModeBanner: false,
                title: "My Rekso",
                initialRoute: Routes.HOME,
                getPages: AppPages.routes,
                theme: ThemeData.light(),                
              ),
            );
          }
          return const MaterialApp(
            home: Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        },
      ),
    ),
  );
}
