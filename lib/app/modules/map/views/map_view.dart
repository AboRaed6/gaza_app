import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../constant/colors.dart';
import '../controllers/map_controller.dart';

class MapView extends GetView<MapController> {
  @override
  Widget build(BuildContext context) {
    Get.put(MapController());
    return GetBuilder<MapController>(
      builder: (_) => Scaffold(
        appBar: AppBar(
          backgroundColor: ColorClass.appBarColor,
          elevation: 0,
          title: Text(Get.arguments['title']),
          centerTitle: true,
          leading: Container(),
          actions: [
            IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_forward_ios,
                color: ColorClass.whiteColor,
              ),
            ),
          ],
        ),
        body: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: controller.kGooglePlex,
          onMapCreated: (GoogleMapController cont) {
            controller.controllerCom.complete(cont);
          },
        ),
      ),
    );
  }
}
