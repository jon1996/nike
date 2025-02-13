import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nike/Component/MyRouter.dart';
import 'package:nike/screens/checkout.dart';
import '../Component/myButton.dart';
import '../Component/shoes_size.dart';
import '../Model/product.dart';
import 'shoping.dart';

class DetailsPage extends StatelessWidget {
  final Product product;

  const DetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56), // Standard AppBar height
        child: AppBar(
          title: Center(
            child: SvgPicture.asset('assets/svg/nike-11.svg', width: 50),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Shoping()),
                    );
                  },
                  child: Icon(Icons.shopping_cart, color: Colors.grey[900])),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Floating 3D Effect
                  Transform.translate(
                    offset: Offset(0, -10), // Moves the image slightly up
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color:
                                Colors.black.withOpacity(0.15), // Soft shadow
                            blurRadius: 20, // More blur for realism
                            spreadRadius: -5,
                            offset:
                                Offset(0, 10), // Moves shadow below the image
                          ),
                        ],
                      ),
                      child: Image.asset(
                        product.imagePaths ?? 'assets/images/placeholder.jpg',
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
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
                        Text(
                          product.description ?? 'No description available',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber, size: 20),
                            Icon(Icons.star, color: Colors.amber, size: 20),
                            Icon(Icons.star, color: Colors.amber, size: 20),
                            Icon(Icons.star, color: Colors.amber, size: 20),
                            Icon(Icons.star_border,
                                color: Colors.grey, size: 20),
                            SizedBox(width: 5),
                            Text("(349)"),
                            SizedBox(width: 120),
                            Text(
                              product.price ?? '\$0.00',
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Text(
                          "A cutting-edge athletic shoe that combines comfort, style, and performance.",
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 10),
                        if (product.discount != null &&
                            product.discount != '0%')
                          Row(
                            children: [
                              Icon(Icons.discount, color: Colors.red, size: 20),
                              const SizedBox(width: 10),
                              Text(
                                'Discount: ${product.discount!}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        SizedBox(height: 15),
                        Text(
                          'Size',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 15),
                        ShoesSize(),
                        SizedBox(height: 15),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Add to Cart Button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Mybutton(
              text: 'Add to Cart',
              onTap: () {
                Navigator.push(
                  context,
                  createRoute(Checkout(
                    product: product,
                  )),
                );
              },
              color: Colors.grey[900],
            ),
          ),
        ],
      ),
    );
  }
}
