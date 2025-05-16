import 'package:flutter/material.dart';
import 'package:hazyna_doner/presentation/home_page/home_page.dart';
import 'package:hazyna_doner/shopping_cart_page.dart';
import 'package:hazyna_doner/assignment_page.dart';
import 'package:hazyna_doner/media_page.dart';

import '../presentation/category/category_page.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => MenuState();
}

class MenuState extends State<Menu> {
  int _selectedIndex = 0;
  final String username = "";
static final List<Widget> _widgetOptions = <Widget>[
  const HomeScreen(username: ''),
  const CategoriesPage(),
  const ShoppingCartPage(items: []), // <<-- düzediş
  const AssignmentPage(),
  const MediaPage(),
];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 250, 250, 250),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Öý',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Kategoriýa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Sebet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Sargytlar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_media),
            label: 'Media',
          ),
        ],
      ),
    );
  }
}
