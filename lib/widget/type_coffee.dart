import 'package:flutter/material.dart';

class TypeCoffee extends StatefulWidget {
  bool? value;

  String? label;

  bool? isChecked;

  TypeCoffee({
    Key? key,
    this.isChecked,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  State<TypeCoffee> createState() => _TypeCoffeeState();
}

class _TypeCoffeeState extends State<TypeCoffee> {
  @override
  Widget build(BuildContext context) {
    bool? isChecked;
    String? label;
    return Row(
      children: [
        Checkbox(
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value!;
            });
          },
        ),
        const SizedBox(width: 10),
        Text('${label}')
      ],
    );
  }
}
