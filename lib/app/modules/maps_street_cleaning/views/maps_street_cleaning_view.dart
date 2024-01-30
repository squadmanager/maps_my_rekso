import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/maps_street_cleaning_controller.dart';

class MapsStreetCleaningView extends GetView<MapsStreetCleaningController> {
  const MapsStreetCleaningView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MapsStreetCleaningView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MapsStreetCleaningView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
