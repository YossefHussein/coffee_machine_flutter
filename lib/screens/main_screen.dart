import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isChocolateChecked = false;
  bool isWithCreamChecked = false;
  late int chocolateCheckedPrice;
  late int withCreamCheckedPrice;
  int quantity = 0;
  int price = 20;
  TextEditingController controller = TextEditingController();

  quantityNotToZero() {
    if (quantity == 0) {
      quantity = quantity + 1;
      return;
    }
  }

  /// showToast it function for send for user message
  showToast() {
    /// remove error if quantity = 0
    if (quantity == 0) {
      setState(() {
        chocolateCheckedPrice = 0;
        withCreamCheckedPrice = 0;
        print('It Run 1');
      });
    }

    /// toast message
    Fluttertoast.showToast(
      msg: "Thank You We Will Send Message To Your Email"
          "\n Quantity: $quantity "
          "\n Price: ${quantity >= 1 && isWithCreamChecked == true && isChocolateChecked == true ? withCreamCheckedPrice + quantity * price : quantity * price} "
          "\n Adds: ${isChocolateChecked == true ? 'Chocolate' : 'Without Chocolate'} "
          "\n ${isWithCreamChecked == true ? 'and Cream' : 'Without Cream'} ",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: Colors.brown[800],
      textColor: Colors.white,
      fontSize: 18.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.brown[800],
        title: const Text('CoffeeMachine'),
        actions: const [
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Icon(Icons.coffee_maker),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        fillColor: Colors.brown[900],
                        helperText: 'We Send Message To You By this Email',
                        hintText: 'yourEmail@gmail.com',
                        label: const Text('Email'),
                      ),
                      onChanged: (value) {
                        print("The value entered is : $value");
                      },
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Enter Your Type Of Coffee'),
                    Row(
                      children: [
                        Checkbox(
                          value: isChocolateChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChocolateChecked = value!;
                            });
                          },
                        ),
                        const SizedBox(width: 10),
                        const Text('chocolate')
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: isWithCreamChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isWithCreamChecked = value!;
                            });
                          },
                        ),
                        const SizedBox(width: 10),
                        const Text('With Cream')
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          tooltip: 'minus',
                          onPressed: () {
                            setState(() {
                              quantityNotToZero();
                              --quantity;
                            });
                          },
                          icon: const Icon(Icons.remove),
                        ),
                        Text(
                          'Your Coffee  $quantity',
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        IconButton(
                          tooltip: 'add',
                          onPressed: () {
                            setState(() {
                              ++quantity;
                            });
                          },
                          icon: const Icon(Icons.add),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              OutlinedButton.icon(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.brown[800]),
                ),
                onPressed: () {
                  showToast();
                },
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
