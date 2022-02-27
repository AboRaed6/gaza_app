import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:gaza_app/constant/colors.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddPlaceController extends GetxController {
  //TODO: Implement AddPlaceController
  var titleController = TextEditingController();
  var descController = TextEditingController();
  var key = GlobalKey<FormState>();
  var placeController = TextEditingController();

  String imageName = '';

  XFile? imagePath;
  final ImagePicker picker = ImagePicker();

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;

  bool isLoading = false;

  void addToCity() {
    switch (placeController.text) {
      case 'بيت لاهيا':
        uploadImage(collectionName: 'بيت لاهيا');
        break;
      case 'بيت حانون':
        uploadImage(collectionName: 'بيت حانون');
        break;
      case 'جباليا':
        uploadImage(collectionName: 'جباليا');
        break;
      case 'الشاطئ':
        uploadImage(collectionName: 'الشاطئ');
        break;
      case 'غزة':
        uploadImage(collectionName: 'غزة');
        break;
      case 'الزهراء':
        uploadImage(collectionName: 'الزهراء');
        break;
      case 'البريج':
        uploadImage(collectionName: 'البريج');
        break;
      case 'دير البلح':
        uploadImage(collectionName: 'دير البلح');
        break;
      case 'خانيونس':
        uploadImage(collectionName: 'خانيونس');
        break;
      case 'عبسان':
        uploadImage(collectionName: 'عبسان');
        break;
      case 'رفح':
        uploadImage(collectionName: 'رفح');
        break;
      case 'النصيرات':
        uploadImage(collectionName: 'النصيرات');
        break;
      case 'المغازي':
        uploadImage(collectionName: 'المغازي');
        break;
    }
  }

  imagePicker() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imagePath = image;
      imageName = image.name.toString();
      update();
    }
  }

  uploadImage({required String collectionName}) async {
    isLoading = true;
    update();
    var uniqueKey = firebaseFirestore.collection(collectionName).doc();
    String uploadName =
        DateTime.now().microsecondsSinceEpoch.toString() + '.jpg';
    Reference reference = storage.ref().child(collectionName).child(uploadName);
    UploadTask uploadTask = reference.putFile(File(imagePath!.path));
    uploadTask.snapshotEvents.listen((event) {
      print(event.bytesTransferred.toString() +
          '\t' +
          event.totalBytes.toString());
    });
    await uploadTask.whenComplete(() async {
      var uploadPath = await uploadTask.snapshot.ref.getDownloadURL();
      if (uploadPath.isNotEmpty) {
        firebaseFirestore.collection(collectionName).doc(uniqueKey.id).set({
          'title': titleController.text.trim(),
          'desc': descController.text.trim(),
          'image': uploadPath
        }).then((value) {
          Get.snackbar('Success', 'Record Inserted.',
              backgroundColor: Colors.green);
          Get.back();
        }).catchError((e){
          Get.snackbar('Error', e.toString());
        });
      } else {
        Get.snackbar('Error', 'Something While Uploading Image.',
            backgroundColor: Colors.red);
      }
      isLoading = false;
      descController.text = '';
      titleController.text = '';
      placeController.text = '';
      imageName = '';
      update();
    });
  }

  void selectCategory(index) {
    placeController.text = ColorClass.cities[index];
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    titleController.dispose();
    descController.dispose();
    placeController.dispose();
  }
}
