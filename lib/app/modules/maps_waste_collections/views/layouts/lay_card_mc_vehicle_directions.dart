import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:maps_my_rekso/app/modules/maps_waste_collections/controllers/maps_waste_collections_controller.dart';
import 'package:maps_my_rekso/app/widgets/color_widget.dart';

import '../../../../widgets/detail_widget.dart';

class LayCardMcVehicleDirections
    extends GetView<MapsWasteCollectionsController> {
  final element;
  LayCardMcVehicleDirections({required this.element, super.key});

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
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: () {
                    controller.mcMinimizeTripData(true);
                  },
                  child: SvgPicture.asset(
                    'assets/icons/minus.svg',
                    color: HexColor(ColorWidget().grey),
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                              textContent:
                                  '${element[0]['totalMovingTripDuration']}',
                            ),
                          ),
                          Expanded(
                            child: DetailWidget(
                              title: 'Total Moving Trip Distance',
                              isStatus: false,
                              textContent:
                                  '${element[0]['totalMovingTripDistance']}',
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
            ],
          ),
        ),
        // height: double.infinity,
      ),
    );
  }
}
