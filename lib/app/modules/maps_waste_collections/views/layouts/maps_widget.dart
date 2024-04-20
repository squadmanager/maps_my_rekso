import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_compass/flutter_map_compass.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:latlong2/latlong.dart';

import '../../../../widgets/color_widget.dart';
import '../../controllers/maps_waste_collections_controller.dart';

class MapsWidget extends GetView<MapsWasteCollectionsController> {
  final data;
  final List vehicleName;
  final List latLngNow;
  final List vehicleProfile;
  const MapsWidget(
      {required this.data,
      required this.vehicleName,
      required this.latLngNow,
      required this.vehicleProfile,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => FlutterMap(
        mapController: controller.mapController,
        options: MapOptions(
          center: controller.routePoints[0],
          zoom: 15,
          // onTap: (tapPosition, point) {
          //   controller.latClick.value = point.latitude;
          //   controller.longClick.value = point.longitude;
          // },
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.app',
          ),
          if (controller.tracking.isNotEmpty) ...[
            PolylineLayer(
              polylineCulling: false,
              polylines: [
                Polyline(
                  points: controller.routePoints,
                  color: HexColor(ColorWidget().primaryWasteCollections),
                  strokeWidth: 9,
                ),
              ],
            ),
          ],
          MarkerLayer(
            markers: [
              // current location user
              Marker(
                rotate: true,
                width: 40,
                height: 40,
                point: LatLng(
                  controller.latCurrentLocation.value,
                  controller.lngCurrentLocation.value,
                ),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/user-2.png',
                    ),
                  ],
                ),
              ),
              // end current location user
              if (controller.tracking.isNotEmpty) ...[
                // route tracking
                Marker(
                  rotate: true,
                  width: 40,
                  height: 40,
                  point: LatLng(
                    controller.latLngFilter.first['lat'],
                    controller.latLngFilter.first['lng'],
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: HexColor(ColorWidget().red),
                    ),
                    child: Center(
                      child: Text(
                        'A',
                        style: GoogleFonts.poppins(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500,
                          color: HexColor(ColorWidget().white),
                        ),
                      ),
                    ),
                  ),
                ),
                Marker(
                  rotate: true,
                  width: 40,
                  height: 40,
                  point: LatLng(
                    controller.latLngFilter.last['lat'],
                    controller.latLngFilter.last['lng'],
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: HexColor(ColorWidget().red),
                    ),
                    child: Center(
                      child: Text(
                        'B',
                        style: GoogleFonts.poppins(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500,
                          color: HexColor(ColorWidget().white),
                        ),
                      ),
                    ),
                  ),
                ),
              ] else ...[
                // collection point
                if (controller.justShowCar.isFalse) ...[
                  for (int i = 0; i < data.length; i++) ...[
                    Marker(
                      rotate: true,
                      width: 80,
                      height: 60,
                      point: LatLng(
                        double.parse(
                          data[i]['latitude'],
                        ),
                        double.parse(data[i]['longititude']),
                      ),
                      child: InkWell(
                        onTap: () {
                          controller.attachmentList.clear();
                          controller.getImage(data[i]['trans_dta_id']);
                          controller.listElement.clear();
                          controller.detailVehicle.clear();

                          controller.gotoLocation(
                            double.parse(
                              data[i]['latitude'],
                            ),
                            double.parse(data[i]['longititude']),
                            18,
                          );

                          controller.listElement.add({
                            'lat': double.parse(
                              data[i]['latitude'],
                            ),
                            'lng': double.parse(data[i]['longititude']),
                            'userAssigment': data[i]['user_assigment'],
                            'locationTask': data[i]['location_task'],
                            'status': data[i]['status'],
                          });
                        },
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: HexColor(
                                  data[i]['status'] == '1'
                                      ? ColorWidget().green
                                      : data[i]['colour_user'],
                                ),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                child: Text(
                                  data[i]['location_task'].length > 25
                                      ? '${data[i]['location_task'].substring(0, 25)}...'
                                      : data[i]['location_task'],
                                  style: GoogleFonts.poppins(
                                    fontSize: 8.0,
                                    fontWeight: FontWeight.bold,
                                    color: HexColor(ColorWidget().white),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 2.0,
                            ),
                            Center(
                              child: Image.asset(
                                controller.typeForm.value == 'dragonfly'
                                    ? 'assets/images/cp_dragonfly.png'
                                    : controller.typeForm.value == 'compactor'
                                        ? 'assets/images/cp_compactor.png'
                                        : 'assets/images/cp_pruning.png',
                                width: 30.0,
                                height: 30.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ],
              ],

              // vehicle
              for (int i = 0; i < vehicleName.length; i++) ...[
                Marker(
                  rotate: true,
                  width: 50,
                  height: 90,
                  point: LatLng(
                    latLngNow[i]['lat'],
                    latLngNow[i]['lng'],
                  ),
                  child: InkWell(
                    onTap: () {
                      controller.listElement.clear();
                      controller.detailVehicle.clear();

                      controller.gotoLocation(
                        latLngNow[i]['lat'],
                        latLngNow[i]['lng'],
                        18,
                      );

                      controller.detailVehicle.add({
                        'images': vehicleProfile[i]['images'],
                        'name': vehicleProfile[i]['name'],
                        'nopol': vehicleProfile[i]['nopol'],
                      });
                    },
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color:
                                HexColor(ColorWidget().primaryWasteCollections),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 5.0),
                            child: Text(
                              vehicleName[i].length > 10
                                  ? '${vehicleName[i].substring(0, 10)}...'
                                  : vehicleName[i],
                              style: GoogleFonts.poppins(
                                fontSize: 8.0,
                                fontWeight: FontWeight.bold,
                                color: HexColor(ColorWidget().white),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 2.0),
                          child: Image.network(
                            '${vehicleProfile[i]['images']}',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ],
          ),
          const MapCompass.cupertino(
            hideIfRotatedNorth: false,
            padding: EdgeInsets.only(top: 40.0, right: 18.0),
            animationCurve: Curves.easeInOut,
          ),
        ],
      ),
    );
  }
}
