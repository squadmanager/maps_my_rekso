import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../widgets/color_widget.dart';
import '../../controllers/maps_waste_collections_controller.dart';

class LayMcVehicleDirectionsMinimize
    extends GetView<MapsWasteCollectionsController> {
  const LayMcVehicleDirectionsMinimize({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(8.0),
      color: HexColor(ColorWidget().primary),
      child: InkWell(
        onTap: () => controller.mcMinimizeTripData(false),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/expand-arrows-alt.svg',
                color: HexColor(ColorWidget().white),
                height: 15,
                width: 15,
              ),
              const SizedBox(width: 5.0),
              Text(
                'Show Detail Trip',
                style: GoogleFonts.poppins(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                  color: HexColor(ColorWidget().white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
