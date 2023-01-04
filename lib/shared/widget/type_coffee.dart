import 'package:flutter/material.dart';

Widget typeCoffee({
  bool isChecked = false,
  required String? label,
 required ValueChanged<bool> onChanged
}) =>
    Row(
      children: [
        Checkbox(
          value: isChecked,
          onChanged:(value) =>  onChanged,
        ),
        const SizedBox(width: 10),
        Text('$label ')
      ],
    );
