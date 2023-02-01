import 'package:coffee_machine_flutter/shared/component/constant.dart';
import 'package:coffee_machine_flutter/shared/style/color.dart';
import 'package:flutter/material.dart';

// default from in app
Widget defaultFormFieldWidget({
  TextEditingController? controller,
  final Color? color,
  final String? labelText,
  final String? hintText,
  final String? helperText,
  final bool isPassword = false,
  final FormFieldValidator<String>? validMsg,
  final ValueChanged<String>? onSubmits,
  final ValueChanged<String>? onChanged,
  final TextInputType? type,
  final Widget? prefixIcon,
  final Widget? suffixIcon,
  final VoidCallback? suffixPressed,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      onFieldSubmitted: onSubmits,
      onChanged: onChanged,
      obscureText: isPassword,
      decoration: InputDecoration(
        prefixIconColor: Colors.white,
        suffixIconColor: Colors.white,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon != null
            ? IconButton(onPressed: suffixPressed, icon: suffixIcon)
            : null,
        labelText: labelText,
        // labelStyle: TextStyle(color: pColor),
        hintText: hintText,
        // hintStyle: TextStyle(color: pColor),
        helperText: helperText,
        // helperStyle: TextStyle(color: pColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(pSizeBox),
        ),
      ),
      validator: validMsg,
    );
