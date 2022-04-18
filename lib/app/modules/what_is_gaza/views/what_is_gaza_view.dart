import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_app/constant/colors.dart';

import 'package:get/get.dart';

import '../controllers/what_is_gaza_controller.dart';

class WhatIsGazaView extends GetView<WhatIsGazaController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorClass.appBarColor,
        title: Text('ما هي غزة ؟'.tr),
        centerTitle: true,
        leading: Container(),
        actions: [
          IconButton(
            onPressed: () {
              Get.back();
              Get.back();
            },
            icon: const Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/gaza.jpg',
              width: double.infinity,
              height: 220.h,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'ركن فلسطين، وخاصرتها الغربية، نقطة الوصل الدنيا والأخيرة بين بر بلاد الشام والبحر المتوسط ، والبقعة الأكثر تقدما غربا نحو البحر ، في زاوية بين شبه جزيرة سيناء وصحراء النقب والداخل الفلسطيني.نطل على غزة فنطل من فلسطين وفلسطين بلاد كنعان وغزة بلدة كنعانية عربية، بلدة تعتبر من أقدم مدن العالم المأهولة، عبر التاريخ قيل إنها في الألف الرابعة، قبل ميلاد السيد المسيح، وهنالك من قال إن المعينيين هم من بنوها، في القرن الثامن عشر قبل ميلاد المسيح وتتعدد الروايات في هذا الصدد إذ ثمة يرى أنها بنيت قبل ذلك فيقال إنها رابع مدينة بنيت على وجه الأرض.كما سنجد أن ثمة العديد من الروايات التي تحاول أن تفسر معنى اسم غزة، فمنها من رأى أن غزة جمع غازى والغزى والغزاة، الرماة بالنشاب ثم تحولت الى غزة ومٍنها من رأى أن لفظة غزة لغويا تأتي بمعنى قوي ومنيع ومخازن وكنوز وما يدخر.'
                      .tr,
                  // textDirection: TextDirection.rtl,
                  style: TextStyle(
                    color: ColorClass.textColor,
                    fontSize: 18.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
