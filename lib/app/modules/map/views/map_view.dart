import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../controllers/map_controller.dart';

class MapView extends GetView<MapController> {
  @override
  Widget build(BuildContext context) {
    Get.put(MapController());
    return GetBuilder<MapController>(
      builder: (_) => Scaffold(
        body: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: controller.kGooglePlex,
          onMapCreated: (GoogleMapController cont) {
            controller.controllerCom.complete(cont);
          },
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: controller.goToTheLake,
          label: Text('To the lake!'),
          icon: Icon(Icons.directions_boat),
        ),
      ),
    );
  }
}
