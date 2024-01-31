import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maps_my_rekso/app/modules/maps_street_cleaning/views/maps_street_cleaning_view.dart';
import 'package:maps_my_rekso/app/modules/maps_waste_collections/views/maps_waste_collections_view.dart';

class BottomNavigationController extends GetxController {
  var tabIndex = 0.obs;

  final pages = <Widget>[
    const MapsWasteCollectionsView(),
    const MapsStreetCleaningView(),
  ];

  Widget get currentPage => pages[tabIndex()];

  changePage(int index) {
    tabIndex.value = index;
  }
}
