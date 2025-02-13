import 'package:flutter/material.dart';
import 'package:nike/Component/allCategory.dart';

import '../Model/product.dart';
import '../consumer/productData.dart';

class Categorytab extends StatefulWidget {
  const Categorytab({super.key});

  @override
  State<Categorytab> createState() => _CategorytabState();
}

class _CategorytabState extends State<Categorytab>
    with TickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 0;
  final List<String> categories = [
    'All',
    'Running',
    'Sneakers',
    'Fashion',
    'Sandals',
    'Boots',
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: categories.length, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _currentIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // Function to group products by category
  List<Product> _getProductsByCategory(String category) {
    if (category == 'All') {
      return _getShuffledProducts(); // Use the interleaved product logic for "All"
    }
    return products.where((product) => product.category == category).toList();
  }

  // Function to shuffle and interleave products for "All"
  List<Product> _getShuffledProducts() {
    Map<String?, List<Product>> categorizedProducts = {};

    // Group products by category
    for (var product in products) {
      categorizedProducts.putIfAbsent(product.category, () => []).add(product);
    }

    List<Product> interleavedProducts = [];
    bool productsLeft = true;

    while (productsLeft) {
      productsLeft = false;

      for (var category in categories.where((cat) => cat != 'All')) {
        if (categorizedProducts[category]?.isNotEmpty ?? false) {
          productsLeft = true;
          interleavedProducts.add(categorizedProducts[category]!.removeAt(0));
        }
      }
    }

    return interleavedProducts;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // TabBar
        Container(
          height: 60,
          child: TabBar(
            controller: _tabController,
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            indicator: const BoxDecoration(),
            dividerColor: Colors.transparent,
            tabs: List.generate(
              categories.length,
              (index) => Tab(
                child: Container(
                  height: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: _currentIndex == index
                        ? Colors.black
                        : Colors.transparent,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    categories[index],
                    style: TextStyle(
                      fontSize: 20,
                      color:
                          _currentIndex == index ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        // TabBarView
        Container(
          height: MediaQuery.of(context).size.height * 0.4,
          child: TabBarView(
            controller: _tabController,
            children: categories.map((category) {
              final categoryProducts = _getProductsByCategory(category);
              return categoryProducts.isEmpty
                  ? Center(child: Text('No products available in $category'))
                  : GridView.builder(
                      padding: const EdgeInsets.all(8.0),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                      ),
                      itemCount: categoryProducts.length,
                      itemBuilder: (context, index) {
                        final product = categoryProducts[index];
                        return Allcategory(product: product);
                      },
                    );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
