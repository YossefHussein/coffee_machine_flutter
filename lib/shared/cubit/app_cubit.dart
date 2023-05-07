import 'package:coffee_machine_flutter/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../style/color.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  // to get the data and function from this class
  static AppCubit get(BuildContext context) => BlocProvider.of(context);

  // to check if user want to adding things on coffee
  // this use in checkbox
  bool isWithChocolateChecked = false;
  bool isWithCreamChecked = false;

  // quantity of coffee
  int quantity = 0;

  // price coffee
  int price = 7;

  // to control on textField
  TextEditingController emailController = TextEditingController();

  // to make validation
  var formKey = GlobalKey<FormState>();

  // less quantity coffee
  void lessQuantity() {
    quantity--;
    emit(LessQuantity());
  }

  // adding quantity coffee
  void addingQuantity() {
    quantity++;
    emit(AddingQuantity());
  }

  void checkBoxChocolate({required bool value}) {
    isWithChocolateChecked = value;
    emit(ChangeCheckBoxChocolate());
  }

  void checkBoxCream({required bool value}) {
    isWithCreamChecked = value;
    emit(ChangeCheckBoxCream());
  }

  // to remove the error quantity less zero
  // I use this in minus quantity
  quantityNotToZero() {
    if (quantity == 0) {
      quantity = quantity + 1;
      return Fluttertoast.showToast(
        msg: 'the quantity should\'t under zero',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: pLightColor,
        textColor: pColorToast,
        fontSize: 18.0,
      );
    }
    emit(QuantityNotToZero());
  }

  // showToast it function for send for user message
  void showToast() {
    // this like 'quantityNotToZero' but this for adding some logic
    if (quantity == 0 || emailController.text.isEmpty) {
      isWithChocolateChecked = false;
      isWithChocolateChecked = false;
      price = 0;
      quantity = 0;
    }
    Future.delayed(
      Duration(milliseconds: 1000),
      () {
        Fluttertoast.showToast(
          msg: 'We will send message to your email'
              '\n ${emailController.text.isEmpty ? 'email must be empty' : emailController.text}'
              '\n quantity: $quantity'
              '\n price: ${price * quantity}'
              '\n addition: \n'
              ' ${isWithChocolateChecked == true && quantity >= 1 ? 'you order  with chocolate' : 'you order  without chocolate'} '
              '\n ${isWithCreamChecked == true && quantity >= 1 ? 'you order with  cream' : 'you order  without cream'} '
              '\n thank you ',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: pLightColor,
          textColor: pColorToast,
          fontSize: 18.0,
        );
      },
    );
    return;
  }
}
