import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../widgets/color_widget.dart';
import '../../../widgets/modal_bottom_sheet_widget.dart';
import '../controllers/maps_waste_collections_controller.dart';
import 'layouts/detail_pin_widget.dart';
import 'layouts/detail_vehicle_widget.dart';
import 'layouts/list_directions_widget.dart';
import 'layouts/list_location_widget.dart';

class MapsWasteCollectionsView extends GetView<MapsWasteCollectionsController> {
  const MapsWasteCollectionsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: WillPopScope(
        onWillPop: () async {
          Get.back(result: controller.isBackValue.value);
          return true;
        },
        child: Obx(
          () => Scaffold(
            body: controller.isLoading.isTrue
                ? const Center(
                    child: CupertinoActivityIndicator(),
                  )
                : Stack(
                    children: [
                      const ListLocationWidget(),
                      // Container(
                      //   alignment: Alignment.topLeft,
                      //   child: Container(
                      //     margin: const EdgeInsets.only(left: 20.0, top: 20.0),
                      //     width: 40,
                      //     height: 40,
                      //     child: ElevatedButton(
                      //       onPressed: () => Get.back(),
                      //       style: ElevatedButton.styleFrom(
                      //         shape: const CircleBorder(),
                      //         padding: const EdgeInsets.all(5),
                      //         backgroundColor: HexColor(
                      //             ColorWidget().primaryWasteCollections),
                      //       ),
                      //       child: SvgPicture.asset(
                      //         'assets/icons/arrow-left.svg',
                      //         color: HexColor(ColorWidget().white),
                      //         fit: BoxFit.scaleDown,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      Container(
                        alignment: Alignment.topRight,
                        child: Column(
                          children: [
                            Container(
                              margin:
                                  const EdgeInsets.only(top: 20.0, right: 20.0),
                              width: 40,
                              height: 40,
                              child: ElevatedButton(
                                onPressed: () => controller.zoomInOut('in'),
                                style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder(),
                                  padding: const EdgeInsets.all(5),
                                  backgroundColor: HexColor(
                                      ColorWidget().primaryWasteCollections),
                                ),
                                child: SvgPicture.asset(
                                  'assets/icons/plus-circle.svg',
                                  color: HexColor(ColorWidget().white),
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(top: 10.0, right: 20.0),
                              width: 40,
                              height: 40,
                              child: ElevatedButton(
                                onPressed: () => controller.zoomInOut('out'),
                                style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder(),
                                  padding: const EdgeInsets.all(5),
                                  backgroundColor: HexColor(
                                      ColorWidget().primaryWasteCollections),
                                ),
                                child: SvgPicture.asset(
                                  'assets/icons/minus-circle.svg',
                                  color: HexColor(ColorWidget().white),
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(top: 10.0, right: 20.0),
                              width: 40,
                              height: 40,
                              child: ElevatedButton(
                                onPressed: () {
                                  controller.refreshData();
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder(),
                                  padding: const EdgeInsets.all(5),
                                  backgroundColor: HexColor(
                                      ColorWidget().primaryWasteCollections),
                                ),
                                child: SvgPicture.asset(
                                  'assets/icons/refresh.svg',
                                  color: HexColor(ColorWidget().white),
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(top: 10.0, right: 20.0),
                              width: 40,
                              height: 40,
                              child: ElevatedButton(
                                onPressed: () {
                                  ModalBottomSheetWidget().showModal(
                                    context,
                                    0.6,
                                    0.0,
                                    0.6,
                                    const ListDirectionsWidget(),
                                    Container(),
                                    Container(),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder(),
                                  padding: const EdgeInsets.all(5),
                                  backgroundColor: HexColor(
                                      ColorWidget().primaryWasteCollections),
                                ),
                                child: SvgPicture.asset(
                                  'assets/icons/directions.svg',
                                  color: HexColor(ColorWidget().white),
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(top: 10.0, right: 20.0),
                              width: 40,
                              height: 40,
                              child: ElevatedButton(
                                onPressed: () {
                                  controller.justShowCar.value = true;
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder(),
                                  padding: const EdgeInsets.all(5),
                                  backgroundColor: HexColor(
                                      ColorWidget().primaryWasteCollections),
                                ),
                                child: SvgPicture.asset(
                                  'assets/icons/car.svg',
                                  color: HexColor(ColorWidget().white),
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(top: 10.0, right: 20.0),
                              width: 40,
                              height: 40,
                              child: ElevatedButton(
                                onPressed: () {
                                  controller.changeFilterTypeForm('dragonfly');
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder(),
                                  padding: const EdgeInsets.all(5),
                                  backgroundColor: HexColor(
                                      ColorWidget().primaryWasteCollections),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: SvgPicture.asset(
                                    'assets/icons/3-wheel-1.svg',
                                    color: HexColor(ColorWidget().white),
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(top: 10.0, right: 20.0),
                              width: 40,
                              height: 40,
                              child: ElevatedButton(
                                onPressed: () {
                                  controller.changeFilterTypeForm('compactor');
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder(),
                                  padding: const EdgeInsets.all(5),
                                  backgroundColor: HexColor(
                                      ColorWidget().primaryWasteCollections),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: SvgPicture.asset(
                                    'assets/icons/garbage-truck.svg',
                                    color: HexColor(ColorWidget().white),
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(top: 10.0, right: 20.0),
                              width: 40,
                              height: 40,
                              child: ElevatedButton(
                                onPressed: () {
                                  controller.changeFilterTypeForm('pruning');
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder(),
                                  padding: const EdgeInsets.all(5),
                                  backgroundColor: HexColor(
                                      ColorWidget().primaryWasteCollections),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: SvgPicture.asset(
                                    'assets/icons/task-pruning.svg',
                                    color: HexColor(ColorWidget().white),
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (controller.listElement.isNotEmpty) ...[
                        if (controller.isDevice.value == 'phone') ...[
                          Container(
                            alignment:
                                MediaQuery.of(context).size.height < 500.0
                                    ? Alignment.centerLeft
                                    : Alignment.bottomCenter,
                            child: Container(
                              height: MediaQuery.of(context).size.height < 500.0
                                  ? MediaQuery.of(context).size.height
                                  : MediaQuery.of(context).size.height / 2,
                              width: MediaQuery.of(context).size.height < 500.0
                                  ? MediaQuery.of(context).size.width / 3
                                  : MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.symmetric(
                                horizontal: 20.0,
                                vertical: 10.0,
                              ),
                              child: DetailPinWidget(
                                element: controller.listElement,
                              ),
                            ),
                          ),
                        ] else ...[
                          Container(
                            alignment:
                                MediaQuery.of(context).size.height < 1000.0
                                    ? Alignment.centerLeft
                                    : Alignment.bottomCenter,
                            child: Container(
                              height:
                                  MediaQuery.of(context).size.height < 1000.0
                                      ? MediaQuery.of(context).size.height
                                      : MediaQuery.of(context).size.height / 3,
                              width: MediaQuery.of(context).size.height < 1000.0
                                  ? MediaQuery.of(context).size.width / 3
                                  : MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.symmetric(
                                horizontal: 20.0,
                                vertical: 10.0,
                              ),
                              child: DetailPinWidget(
                                element: controller.listElement,
                              ),
                            ),
                          ),
                        ]
                      ],
                      // detail vehicle
                      if (controller.detailVehicle.isNotEmpty) ...[
                        if (controller.isDevice.value == 'phone') ...[
                          Container(
                            alignment:
                                MediaQuery.of(context).size.height < 500.0
                                    ? Alignment.centerLeft
                                    : Alignment.bottomCenter,
                            child: Container(
                              height: MediaQuery.of(context).size.height < 500.0
                                  ? MediaQuery.of(context).size.height
                                  : MediaQuery.of(context).size.height / 2,
                              width: MediaQuery.of(context).size.height < 500.0
                                  ? MediaQuery.of(context).size.width / 3
                                  : MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.symmetric(
                                horizontal: 20.0,
                                vertical: 10.0,
                              ),
                              child: DetailVehicleWidget(
                                element: controller.detailVehicle,
                              ),
                            ),
                          ),
                        ] else ...[
                          Container(
                            alignment:
                                MediaQuery.of(context).size.height < 1000.0
                                    ? Alignment.centerLeft
                                    : Alignment.bottomCenter,
                            child: Container(
                              height:
                                  MediaQuery.of(context).size.height < 1000.0
                                      ? MediaQuery.of(context).size.height
                                      : MediaQuery.of(context).size.height / 3,
                              width: MediaQuery.of(context).size.height < 1000.0
                                  ? MediaQuery.of(context).size.width / 3
                                  : MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.symmetric(
                                horizontal: 20.0,
                                vertical: 10.0,
                              ),
                              child: DetailVehicleWidget(
                                element: controller.detailVehicle,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ],
                  ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                controller.listElement.clear();
                controller.animateMapMove(controller.routePoints[0], 15);
              },
              backgroundColor: HexColor(ColorWidget().primaryWasteCollections),
              child: SvgPicture.asset(
                'assets/icons/map-pin-alt.svg',
                color: HexColor(ColorWidget().white),
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
