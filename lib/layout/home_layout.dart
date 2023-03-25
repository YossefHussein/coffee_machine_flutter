import 'package:coffee_machine_flutter/shared/style/color.dart';
import 'package:coffee_machine_flutter/shared/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../modules/main_module.dart';
import '../shared/cubit/app_cubit.dart';
import '../shared/cubit/states.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        home: BlocConsumer<AppCubit, AppState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                actions: [
                  Icon(
                    Icons.coffee_maker,
                    color: pIconColor,
                  ),
                ],
                title: const Text('Coffee Machine ☕'),
              ),
              body: MainModule(),
            );
          },
        ),
      ),
    );
  }
}
