import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coffee_machine_flutter/bloc/states.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../shared/style/color.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  // to get the data and function
  static AppCubit get(BuildContext context) => BlocProvider.of(context);

  // to check if user want to adding things on coffee
  // this use in checkbox
  bool isWithChocolateChecked = false;
  bool isWithCreamChecked = false;

  // adding price on coffee
  int withChocolatePrice = 10;
  int withCreamPrice = 20;

  // quantity of coffee
  int quantity = 0;

  // price coffee
  int price = 7;

  // to control on textField
  TextEditingController emailController = TextEditingController();

  // additionPrice is price coffee with additions like Chocolate and Cream
  int? additionPrice;

  // less quantity to coffee
  void lessQuantity() {
    quantity--;
    emit(LessQuantity());
  }

  // adding quantity to coffee
  void addingQuantity() {
    quantity++;
    emit(AddingQuantity());
  }

  // to remove the error quantity less zero
  // I use this in minus quantity
  quantityNotToZero() {
    if (quantity == 0) {
      quantity = quantity + 1;
      return;
    }
    emit(QuantityNotToZero());
  }

  // showToast it function for send for user message
  showToast() {
    if (isWithCreamChecked == true) {
      additionPrice = price * quantity + withCreamPrice;
   
    } else {
      additionPrice = price * quantity;
    }
    if (isWithChocolateChecked) {
      additionPrice = price * quantity + withChocolatePrice;
    }
    if (quantity == 0) {
      additionPrice = 0;
      withChocolatePrice = 0;
      withCreamPrice = 0;
      isWithChocolateChecked = false;
      isWithChocolateChecked = false;
      return Fluttertoast.showToast(
      msg: "We will send message to your email"
          "\n ${emailController.text}"
          "\n quantity: $quantity"
          "\n price: $additionPrice"
          "\n addition: \n "
          " ${isWithChocolateChecked == false? 'you order  with chocolate' : 'you order  without chocolate'} "
          "\n ${isWithCreamChecked == false? 'you order with  cream' : 'you order  without cream'} "
          "\n thank you ",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: pColor,
      textColor: pDarkTextColor,
      fontSize: 18.0,
    );
    }
    Fluttertoast.showToast(
      msg: "We will send message to your email"
          "\n ${emailController.text}"
          "\n quantity: $quantity"
          "\n price: $additionPrice"
          "\n addition: \n "
          " ${isWithChocolateChecked? 'you order  with chocolate' : 'you order  without chocolate'} "
          "\n ${isWithCreamChecked? 'you order with  cream' : 'you order  without cream'} "
          "\n thank you ",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: pColor,
      textColor: pDarkTextColor,
      fontSize: 18.0,
    );
  }
}
