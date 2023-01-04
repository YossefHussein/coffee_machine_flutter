import 'package:coffee_machine_flutter/bloc/cubit.dart';
import 'package:coffee_machine_flutter/shared/style/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bloc/states.dart';
import '../modules/main_module/main_module.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.pangolinTextTheme().apply(
          bodyColor: plightTextColor,
          displayColor: plightTextColor,
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: pColor, // Background color (orange in my case).
          textTheme: ButtonTextTheme.primary,
          colorScheme: Theme.of(context).colorScheme.copyWith(
                secondary: sColor,
              ),
        ),
        
        scaffoldBackgroundColor: Colors.white,
      ),
      // dark theme
      darkTheme: ThemeData(
          textTheme: GoogleFonts.pangolinTextTheme().apply(
            bodyColor: pDarkTextColor,
            displayColor: pDarkTextColor,
          ),
          buttonTheme: ButtonThemeData(
            buttonColor: pColor,
          ),
          primaryColor: pColor,
          scaffoldBackgroundColor: sColor),
      home: BlocProvider(
        create: (context) => AppCubit(),
        child: BlocConsumer<AppCubit, AppState>(
          listener: (context, state) {},
          builder: (context, state) {
            return MainModule();
          },
        ),
      ),
    );
  }
}
