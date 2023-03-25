import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'layout/home_layout.dart';
import 'shared/cubit/observer.dart';

void main() {
  Bloc.observer = Observer();
  runApp(HomeLayout());
}
