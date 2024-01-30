import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/maps_waste_collections_controller.dart';

class MapsWasteCollectionsView extends GetView<MapsWasteCollectionsController> {
  const MapsWasteCollectionsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MapsWasteCollectionsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MapsWasteCollectionsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
