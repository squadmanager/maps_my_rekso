import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:maps_my_rekso/app/widgets/color_widget.dart';
import 'package:photo_view/photo_view.dart';

class PhotoViewWidget extends StatelessWidget {
  final String image;
  const PhotoViewWidget({required this.image, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor(ColorWidget().white),
        leading: IconButton(
          splashRadius: 20.0,
          onPressed: () => Get.back(),
          icon: SvgPicture.asset(
            'assets/icons/arrow-left.svg',
            color: HexColor(ColorWidget().black),
            height: 24,
            width: 24,
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            PhotoView(
              imageProvider: NetworkImage('$image'),
              enableRotation: true,
            ),
          ],
        ),
      ),
    );
  }
}
