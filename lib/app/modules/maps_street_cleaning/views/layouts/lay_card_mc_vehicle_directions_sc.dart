import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:maps_my_rekso/app/modules/maps_street_cleaning/controllers/maps_street_cleaning_controller.dart';

import '../../../../widgets/color_widget.dart';
import '../../../../widgets/detail_widget.dart';

class LayCardMcVehicleDirectionsSc
    extends GetView<MapsStreetCleaningController> {
  final element;
  LayCardMcVehicleDirectionsSc({required this.element, super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        decoration: BoxDecoration(
          color: HexColor(ColorWidget().white),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: DetailWidget(
                        title: 'Vehicle',
                        isStatus: false,
                        textContent: '${element[0]['licensePlate']}',
                      ),
                    ),
                    Expanded(
                      child: DetailWidget(
                        title: 'Hull Number',
                        isStatus: false,
                        textContent: '${element[0]['hullNo']}',
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                DetailWidget(
                  title: 'IMEI',
                  isStatus: false,
                  textContent: '${element[0]['imei']}',
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Divider(
                  thickness: 1,
                  color: HexColor(ColorWidget().black),
                  height: 10,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: DetailWidget(
                        title: 'Total Moving Trip Duration',
                        isStatus: false,
                        textContent: '${element[0]['totalMovingTripDuration']}',
                      ),
                    ),
                    Expanded(
                      child: DetailWidget(
                        title: 'Total Moving Trip Distance',
                        isStatus: false,
                        textContent: '${element[0]['totalMovingTripDistance']}',
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: DetailWidget(
                        title: 'Total Hour Start',
                        isStatus: false,
                        textContent: element[0]['totalHourStart'],
                      ),
                    ),
                    Expanded(
                      child: DetailWidget(
                        title: 'Total Hour Stop',
                        isStatus: false,
                        textContent: element[0]['totalHourStop'],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        // height: double.infinity,
      ),
    );
  }
}
