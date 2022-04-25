import 'package:flutter/material.dart';

class InputEmail extends StatelessWidget {
  final Color? color;

  final String? helpText;

  final String? hintText;

  final Widget? labelText;

  final TextInputType? inputType;
  TextEditingController controller = TextEditingController();

  InputEmail({
    Key? key,
    this.color,
    this.helpText,
    this.hintText,
    this.labelText,
    this.inputType,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        fillColor: color,
        helperText: helpText,
        hintText: hintText,
        label: labelText,
      ),
      onChanged: (value) {
        print("The value entered is : $value");
      },
      keyboardType: inputType,
    );
  }
}
