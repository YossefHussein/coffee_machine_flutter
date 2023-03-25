import 'package:flutter/material.dart';
import './constant.dart';
import '../style/color.dart';

// default from in app
Widget defaultFormField({
  required TextEditingController? controller,
  required String? labelText,
  String? hintText,
  String? helperText,
  final bool isPassword = false,
  final TextInputType? type,
  final Widget? suffixIcon,
  final VoidCallback? suffixPressed,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      decoration: InputDecoration(
        suffixIconColor: pIconColor,
        suffixIcon: suffixIcon,
        labelText: labelText,
        labelStyle: TextStyle(color: pLightColor),
        hintText: hintText,
        hintStyle: TextStyle(color: pLightColor),
        helperText: helperText,
        helperStyle: TextStyle(color: pLightColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(pSizeBox),
        ),
      ),
    );
