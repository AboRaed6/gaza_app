import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class CityController extends GetxController {
  bool isLoadingZahra = false;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  List<String> title = [];
  List<String> desc = [];
  List<String> image = [];

  Future<void> getData() async {
    await firestore.collection(Get.arguments['city']).get().then((value) {
      value.docs.forEach((element) {
        title.add(element.data()['title']);
        desc.add(element.data()['desc']);
        image.add(element.data()['image']);
      });
    }).catchError((e) {
      Get.snackbar('Error', e.toString());
      print(e.toString());
    });
    print(title[0]);
  }

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
