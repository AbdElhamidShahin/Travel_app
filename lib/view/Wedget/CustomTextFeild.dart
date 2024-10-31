import 'package:flutter/material.dart';

class Customtextfeild extends StatelessWidget {
  const Customtextfeild(
      {super.key,
      required this.hintText,
      required this.lableText,
      this.validator});
  final String hintText;
  final String lableText;
  final String? Function(String?)? validator; // إضافة المعامل للـ validator

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 8),
      child: TextFormField(
        validator: validator,
        style: const TextStyle(
          color: Colors.white, // لون النص عند الكتابة
          fontSize: 16.0, // حجم النص عند الكتابة
        ),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          labelText: lableText,
          labelStyle: TextStyle(color: Colors.grey),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.amber),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.amber, width: 2.0),
          ),
          hintText: hintText,
          hintStyle:
              const TextStyle(color: Colors.white), // لون النص قبل الكتابة
        ),
      ),
    );

  }
}
