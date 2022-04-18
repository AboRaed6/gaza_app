import 'dart:async';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends GetxController {
  Completer<GoogleMapController> controllerCom = Completer();

  final CameraPosition kGooglePlex = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  final CameraPosition kLake = const CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> goToTheLake() async {
    final GoogleMapController controller = await controllerCom.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(kLake));
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
