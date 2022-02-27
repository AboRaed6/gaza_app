import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/splach_controller.dart';

class SplachView extends GetView<SplachController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplachController>(
      builder: (_) => Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/anti.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Image.asset('assets/images/logop.png'),
        ),
      ),
    );
  }
}
