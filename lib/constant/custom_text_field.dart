import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.inputType,
    this.minLines,
  }) : super(key: key);
  final TextEditingController controller;
  final TextInputType inputType;
  final String hintText;
  final int? minLines;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        maxLines: minLines,
        validator: (value) {
          if (value!.isEmpty) {
            return 'الرجاء ملئ الحقل';
          }
        },
        textDirection: TextDirection.rtl,
        controller: controller,
        keyboardType: inputType,
        decoration: InputDecoration(
          hintText: hintText,
          hintTextDirection: TextDirection.rtl,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}
