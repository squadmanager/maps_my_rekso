import 'package:get/get.dart';

import '../modules/bottom_navigation/bindings/bottom_navigation_binding.dart';
import '../modules/bottom_navigation/views/bottom_navigation_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/maps_street_cleaning/bindings/maps_street_cleaning_binding.dart';
import '../modules/maps_street_cleaning/views/maps_street_cleaning_view.dart';
import '../modules/maps_waste_collections/bindings/maps_waste_collections_binding.dart';
import '../modules/maps_waste_collections/views/maps_waste_collections_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;
  static const MAPSWC = Routes.MAPS_WASTE_COLLECTIONS;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.MAPS_WASTE_COLLECTIONS,
      page: () => const MapsWasteCollectionsView(),
      binding: MapsWasteCollectionsBinding(),
    ),
    GetPage(
      name: _Paths.MAPS_STREET_CLEANING,
      page: () => const MapsStreetCleaningView(),
      binding: MapsStreetCleaningBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOM_NAVIGATION,
      page: () => BottomNavigationView(),
      binding: BottomNavigationBinding(),
    ),
  ];
}
