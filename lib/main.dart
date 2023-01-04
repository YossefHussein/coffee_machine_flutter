import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/observer.dart';
import 'layout/home_layout.dart';

void main() {
  Bloc.observer = Observer();
  runApp(HomeLayout());
}
