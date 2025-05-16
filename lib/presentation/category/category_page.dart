import 'package:flutter/material.dart';
import 'package:hazyna_doner/const/color.dart';
import 'dart:convert';

import 'package:hazyna_doner/list_screen.dart';
import 'package:hazyna_doner/shopping_cart_page.dart';

class CategoriesPage extends StatelessWidget {
 

  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List categories = json.decode(categoriesJson);

    return Scaffold(
      appBar: AppBar(
        title: Text("Food Categories"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: categories.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 3 / 4,
          ),
          itemBuilder: (context, index) {
            final category = categories[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CategoryPlacesPage(category: category),
                  ),
                );
              },
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                        child: Image.network(
                          category['image'],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        category['name'],
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
class CategoryPlacesPage extends StatelessWidget {
  final Map category;

  const CategoryPlacesPage({required this.category});

  @override
  Widget build(BuildContext context) {
    final List places = category['places'];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(category['name']),
      ),
      body: places.isEmpty
          ? Center(child: Text("No places available."))
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                itemCount: places.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 3 / 4,
                ),
                itemBuilder: (context, index) {
                  final place = places[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => PlaceDetailPage(place: place),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                              child: Image.network(
                                place['images'],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  place['name'],
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 4),
                                Text(place['money']),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
class PlaceDetailPage extends StatefulWidget {
  final Map place;

  const PlaceDetailPage({super.key, required this.place});

  @override
  State<PlaceDetailPage> createState() => _PlaceDetailPageState();
}

class _PlaceDetailPageState extends State<PlaceDetailPage> {
  final List<Map<String, dynamic>> cartItems = [];

  void addToCart(Map item) {
    setState(() {
      cartItems.add({
        'title': item['name'],
        'price': 50, // Bahany gerek bolsa widget.place['money']-den alyp bolyar
        'image': widget.place['images'],
      });
    });
  }

  void goToCart() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ShoppingCartPage(items: cartItems),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.place['name']),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: goToCart,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(widget.place['images'], height: 200, fit: BoxFit.cover),
            const SizedBox(height: 10),
            Text("Price: ${widget.place['money']}", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            const Text("Items:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            ...widget.place['items'].map<Widget>((item) {
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  title: Text(item['name']),
                  subtitle: Text("ID: ${item['id']}"),
                  trailing: ElevatedButton(
                    onPressed: () => addToCart(item),
                    child: const Text("Sebede goş"),
                  ),
                ),
              );
            }).toList()
          ],
        ),
      ),
    );
  }
}
