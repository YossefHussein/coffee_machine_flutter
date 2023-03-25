// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import '../../shared/cubit/app_cubit.dart';
import '../shared/components/constant.dart';
import '../shared/components/widgets.dart';

class MainModule extends StatefulWidget {
  const MainModule({Key? key}) : super(key: key);

  @override
  State<MainModule> createState() => _MainModuleState();
}

class _MainModuleState extends State<MainModule> {
  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return Padding(
      padding: const EdgeInsets.all(pPadding),
      child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('assets/images/show_coffee.png'),
                    // email
                    defaultFormField(
                      helperText: 'please write your email here',
                      hintText: 'example@gmail.com',
                      labelText: 'email',
                      type: TextInputType.emailAddress,
                      controller: cubit.emailController,
                      suffixIcon: const Icon(Icons.email)
                    ),
                    const SizedBox(height: pSizeBox),
                    const Text('enter your type of coffee'),
                    // type of coffee
                    Row(
                      children: [
                        Checkbox(
                          value: cubit.isWithChocolateChecked,
                          onChanged: (bool? value) {
                            cubit.checkBoxChocolate(value: value!);
                          },
                        ),
                        const Text('adding chocolate to coffee')
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: cubit.isWithCreamChecked,
                          onChanged: (bool? value) {
                            cubit.checkBoxCream(value: value!);
                          },
                        ),
                        const Text('adding Cream to coffee')
                      ],
                    ),
                    /// adding or less the coffee quantity
                    Row(
                      children: [
                        IconButton(
                          tooltip: 'less',
                          onPressed: () {
                            if(cubit.quantity == 0){
                              cubit.quantityNotToZero();
                            }
                            cubit.lessQuantity();
                          },
                          icon: const Icon(Icons.remove),
                        ),
                        Text(
                          'your coffee  ${cubit.quantity}',
                          style: const TextStyle(
                            fontSize: pSizeBox,
                          ),
                        ),
                        IconButton(
                          tooltip: 'adding',
                          onPressed: () {
                            cubit.addingQuantity();
                          },
                          icon: const Icon(Icons.add),
                        ),
                      ],
                    )
                  ],
                ),
              ),

              /// get message
              OutlinedButton.icon(
                onPressed: () {
                    cubit.showToast();
                },
                icon: const Icon(
                  Icons.coffee,
                ),
                label: const Text('Get My Order'),
              )
            ],
          ),
        ),
    );
  }
}
