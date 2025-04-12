import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/AddProduct.dart';

class MarketplaceScreen extends StatefulWidget {
  const MarketplaceScreen({super.key});

  @override
  State<MarketplaceScreen> createState() => _MarketplaceScreenState();
}

class _MarketplaceScreenState extends State<MarketplaceScreen> {
  final List<Map<String, String>> products = [
    {
      "name": "Fresh Tomatoes",
      "price": "₹40/kg",
      "image": "assets/images/tamato.jpeg"
    },
    {
      "name": "Wheat Grains",
      "price": "₹25/kg",
      "image": "assets/images/wheate.jpeg"
    },
    {
      "name": "Organic Potatoes",
      "price": "₹30/kg",
      "image": "assets/images/patatp.jpeg"
    },
    {
      "name": "Green Chilies",
      "price": "₹60/kg",
      "image": "assets/images/chilli.jpeg"
    },
    {
      "name": "Tractor",
      "price": "₹100000",
      "image": "assets/images/tractor.jpeg"
    },
    {
      "name": "Spray Machines",
      "price": "₹250",
      "image": "assets/images/spray.jpeg"
    },
  ];

  String searchQuery = '';

  void _navigateToAddProduct() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddProductScreen()),
    );

    if (result != null && result is Map<String, String>) {
      setState(() {
        products.add(result); // Add new product to list
      });
    }
  }

  List<Map<String, String>> get filteredProducts {
    if (searchQuery.isEmpty) return products;
    return products
        .where((product) =>
            product['name']!.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Marketplace"),
        backgroundColor: Colors.green,
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search products...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
          ),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                final product = filteredProducts[index];
                return _productCard(
                    product['name']!, product['price']!, product['image']!);
              },
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToAddProduct,
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
        tooltip: "Add Product",
      ),
    );
  }

  Widget _productCard(String name, String price, String imagePath) {
    final isLocalFile = imagePath.startsWith('/');

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: isLocalFile
              ? Image.file(File(imagePath), width: 60, height: 60, fit: BoxFit.cover)
              : Image.asset(imagePath, width: 60, height: 60, fit: BoxFit.cover),
        ),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(price),
        trailing: const Icon(Icons.shopping_cart_outlined),
      ),
    );
  }
}
