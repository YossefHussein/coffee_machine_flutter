import 'package:coffee_machine_flutter/bloc/cubit.dart';
import 'package:flutter/material.dart';

import '../../shared/style/color.dart';
import '../../shared/style/constant.dart';
import '../../shared/widget/input_widget.dart';

class MainModule extends StatefulWidget {
  const MainModule({Key? key}) : super(key: key);

  @override
  State<MainModule> createState() => _MainModuleState();
}

class _MainModuleState extends State<MainModule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: pColor,
        title: const Text('CoffeeMachine ☕'),
        actions: const [
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Icon(Icons.coffee_maker),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(pSize),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Email
                    defaultFormFieldWidget(
                      color: pColor,
                      helperText: 'we send message to You by this email',
                      hintText: 'email',
                      labelText:
                          '${AppCubit.get(context).emailController.text}',
                      type: TextInputType.emailAddress,
                      controller: AppCubit.get(context).emailController,
                    ),
                    const SizedBox(height: pSizeBox),
                    const Text('enter your type Of coffee'),

                    /// type of coffee
                    Row(
                      children: [
                        
                       Checkbox(
                          value: AppCubit.get(context).isWithChocolateChecked,
                          onChanged: (bool? value) {
                           setState(() {
                              AppCubit.get(context).isWithChocolateChecked =
                                value!;
                           });
                          },
                        ),
                        const Text('adding chocolate to coffee, price is 10')
                      ],
                    ),
                    Row(
                      children: [
                          Checkbox(
                          value: AppCubit.get(context).isWithCreamChecked,
                          onChanged: (bool? value) {
                           setState(() {
                              AppCubit.get(context).isWithCreamChecked =
                                value!;
                           });
                          },
                        ),
                        const Text('adding Cream to coffee, price is 20')
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          tooltip: 'less',
                          onPressed: () {
                            AppCubit.get(context).quantityNotToZero();
                            AppCubit.get(context).lessQuantity();
                          },
                          icon: const Icon(Icons.remove),
                        ),
                        Text(
                          'your coffee  ${AppCubit.get(context).quantity}',
                          style: const TextStyle(
                            fontSize: pSize,
                          ),
                        ),
                        IconButton(
                          tooltip: 'adding',
                          onPressed: () {
                            AppCubit.get(context).addingQuantity();
                          },
                          icon: const Icon(Icons.add),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              OutlinedButton.icon(
                style: ButtonStyle(foregroundColor: MaterialStateProperty.all(pColor)),
                onPressed: () => AppCubit.get(context).showToast(),
                icon: const Icon(
                  Icons.coffee,
                ),
                label: const Text('My Order'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
