import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:latlong2/latlong.dart';

import '../../../../widgets/color_widget.dart';
import '../../controllers/maps_street_cleaning_controller.dart';

class MapsSc extends GetView<MapsStreetCleaningController> {
  final data;
  final List vehicleName;
  final List latLngNow;
  const MapsSc(
      {required this.data,
      required this.vehicleName,
      required this.latLngNow,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => FlutterMap(
        mapController: controller.mapController,
        options: MapOptions(
          center: controller.routePoints[0],
          zoom: 15,
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
                  color: HexColor(ColorWidget().primarySC),
                  strokeWidth: 9,
                ),
              ],
            ),
          ] else ...[
            PolylineLayer(
              polylineCulling: false,
              polylines: [
                Polyline(
                  points: controller.routePoints,
                  color: HexColor(ColorWidget().green),
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
              ],
              // collection point
              for (var element in data) ...[
                if (data.last['detail_dailytask_id'] ==
                    element['detail_dailytask_id']) ...[
                  // start last index
                  Marker(
                    alignment: Alignment.topCenter,
                    rotate: true,
                    width: 200,
                    height: 45,
                    point: LatLng(
                      double.parse(
                            data.last['lat_start'],
                          ) -
                          0.00005,
                      double.parse(data.last['lng_start']),
                    ),
                    child: InkWell(
                      onTap: () {
                        controller.attachmentList.clear();
                        controller.getImage(data.last['trans_dtsc_id']);
                        controller.listElement.clear();

                        controller.gotoLocation(
                          double.parse(
                            data.last['lat_start'],
                          ),
                          double.parse(data.last['lng_start']),
                          17,
                        );

                        controller.listElement.add({
                          'lat': double.parse(
                            data.last['lat_start'],
                          ),
                          'lng': double.parse(data.last['lng_start']),
                          'userAssigment':
                              '${data.last['location_start']} - ${data.last['location_end']}',
                          'status': data.last['status'],
                        });
                      },
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: HexColor(
                                data.last['status'] == '1'
                                    ? ColorWidget().green
                                    : data.last['colour_user'],
                              ),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Text(
                                data.last['location_start'].length > 20
                                    ? '${data.last['location_start'].substring(0, 20)}...'
                                    : data.last['location_start'],
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
                            child: SvgPicture.asset(
                              'assets/icons/map-marker.svg',
                              width: 30.0,
                              height: 30.0,
                              color: HexColor(data.last['colour_user']),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // finish last index
                  Marker(
                    alignment: Alignment.topCenter,
                    rotate: true,
                    width: 200,
                    height: 45,
                    point: LatLng(
                      double.parse(
                            data.last['lat_finish'],
                          ) -
                          0.00005,
                      double.parse(data.last['lng_finish']),
                    ),
                    child: InkWell(
                      onTap: () {
                        controller.attachmentList.clear();
                        controller.getImage(data.last['trans_dtsc_id']);
                        controller.listElement.clear();

                        controller.gotoLocation(
                          double.parse(
                            data.last['lat_finish'],
                          ),
                          double.parse(data.last['lng_finish']),
                          17,
                        );

                        controller.listElement.add({
                          'lat': double.parse(
                            data.last['lat_finish'],
                          ),
                          'lng': double.parse(data.last['lng_finish']),
                          'userAssigment':
                              '${data.last['location_start']} - ${data.last['location_end']}',
                          'status': data.last['status'],
                        });
                      },
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: HexColor(
                                data.last['status'] == '1'
                                    ? ColorWidget().green
                                    : data.last['colour_user'],
                              ),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Text(
                                data.last['location_end'].length > 20
                                    ? '${data.last['location_end'].substring(0, 20)}...'
                                    : data.last['location_end'],
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
                            child: SvgPicture.asset(
                              'assets/icons/map-marker.svg',
                              width: 30.0,
                              height: 30.0,
                              color: HexColor(data.last['colour_user']),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ] else ...[
                  Marker(
                    alignment: Alignment.topCenter,
                    rotate: true,
                    width: 200,
                    height: 45,
                    point: LatLng(
                      double.parse(
                            element['lat_start'],
                          ) -
                          0.00005,
                      double.parse(element['lng_start']),
                    ),
                    child: InkWell(
                      onTap: () {
                        controller.attachmentList.clear();
                        controller.getImage(element['trans_dtsc_id']);
                        controller.listElement.clear();

                        controller.gotoLocation(
                          double.parse(
                            element['lat_start'],
                          ),
                          double.parse(element['lng_start']),
                          17,
                        );

                        controller.listElement.add({
                          'lat': double.parse(
                            element['lat_start'],
                          ),
                          'lng': double.parse(element['lng_start']),
                          'userAssigment':
                              '${element['location_start']} - ${element['location_end']}',
                          'status': element['status'],
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: HexColor(
                                element['status'] == '1'
                                    ? ColorWidget().green
                                    : element['colour_user'],
                              ),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Text(
                                element['location_start'].length > 20
                                    ? '${element['location_start'].substring(0, 20)}...'
                                    : element['location_start'],
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
                            child: SvgPicture.asset(
                              'assets/icons/map-marker.svg',
                              width: 30.0,
                              height: 30.0,
                              color: HexColor(element['colour_user']),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]
              ],

              // vehicle
              for (int i = 0; i < vehicleName.length; i++) ...[
                Marker(
                  rotate: true,
                  width: 50,
                  height: 70,
                  point: LatLng(
                    latLngNow[i]['lat'],
                    latLngNow[i]['lng'],
                  ),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: HexColor(ColorWidget().primarySC),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
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
                      Image.asset(
                        'assets/images/compactor.png',
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}