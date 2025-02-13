// ignore_for_file: prefer_const_constructors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nike/screens/finalPage.dart';

import '../Component/MyRouter.dart';
import '../Component/cardInfoDialogue.dart';
import '../Component/myButton.dart';
import '../Model/product.dart';

class Checkout extends StatefulWidget {
  final Product product;

  const Checkout({super.key, required this.product});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  int? selectedMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56), // Standard AppBar height
        child: AppBar(
          title: Center(
            child: SvgPicture.asset('assets/svg/nike-11.svg', width: 50),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize
              .min, // Prevents the column from expanding to fill all available space

          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Floating 3D Effect
                    Text(
                      'Checkout',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20), // Spacing

                    // Additional Content (Product Details, Title, Price, etc.)
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Transform.translate(
                                offset: Offset(
                                    0, -10), // Moves the image slightly up
                                child: Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black
                                            .withOpacity(0.15), // Soft shadow
                                        blurRadius: 20, // More blur for realism
                                        spreadRadius: -5,
                                        offset: Offset(0,
                                            10), // Moves shadow below the image
                                      ),
                                    ],
                                  ),
                                  child: Image.asset(
                                    widget.product.imagePaths ??
                                        'assets/images/placeholder.jpg',
                                    width: 150,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    AutoSizeText(
                                      widget.product.description ?? '',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500),
                                      maxLines: 2,
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      widget.product.discount ?? '',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.red,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  widget.product.price ?? '\$0.00',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 20), // Spacing

                    Center(
                      child: Container(
                        width: 340,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 10,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            PaymentMethodItem(
                              title: 'Credit Card',
                              isSelected: selectedMethod == 0,
                              onTap: () => setState(() => selectedMethod = 0),
                              icon: Row(
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Image.asset(
                                      'assets/images/payments/mastercard.png',
                                      width: 50,
                                      height: 70,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            PaymentMethodItem(
                              title: 'Visa Card',
                              isSelected: selectedMethod == 1,
                              onTap: () => setState(() => selectedMethod = 1),
                              icon: Image.asset(
                                'assets/images/payments/visa.png',
                                width: 50,
                                height: 70,
                              ),
                            ),
                            PaymentMethodItem(
                              title: 'PayPal',
                              isSelected: selectedMethod == 2,
                              onTap: () => setState(() => selectedMethod = 2),
                              icon: Image.asset(
                                'assets/images/payments/paypal.png',
                                width: 50,
                                height: 70,
                              ),
                            ),
                            Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Subtotal',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  widget.product.price ?? '\$0.00',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Chipping',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '\$0.00',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Divider(),
                            SizedBox(
                              height: 50,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Total',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    widget.product.price ?? '\$0.00',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Mybutton(
                                text: 'Checkout',
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    createRoute(Finalpage()),
                                  );
                                },
                                color: Colors.grey[900],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentMethodItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;
  final Widget icon;

  const PaymentMethodItem({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // When selected, show the CardInfoDialog
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return CardInfoDialog();
          },
        );
        onTap(); // You can still trigger any other logic from onTap
      },
      child: Row(
        children: [
          icon,
          const SizedBox(width: 30),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.grey.shade300,
                width: 2,
              ),
            ),
            child: isSelected
                ? Center(
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                    ),
                  )
                : null,
          ),
        ],
      ),
    );
  }
}
