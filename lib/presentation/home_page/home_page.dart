import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widget/home_page_item.dart';

class HomeScreen extends StatelessWidget {
  final String username;

  const HomeScreen({super.key, required this.username});

  final List<Map<String, String>> popularDishes = const [
    {
      'image':
          'https://tse1.mm.bing.net/th?id=OIP.TSs9HmsFZ3SKQzn4HPYy5AHaE7&pid=Api&P=0&h=180',
      'title': 'Doner',
      'price': '35 TMT',
    },
    {
      'image':
          'https://tse4.mm.bing.net/th?id=OIP.kUtTzpGTMZQxCEyv2brQ4wHaEK&pid=Api&P=0&h=180',
      'title': 'Sushi',
      'price': '5 TMT',
    },
    {
      'image':
          'https://tse4.mm.bing.net/th?id=OIP.V7c_3O04n_ouDkYJxTV9qwAAAA&pid=Api&P=0&h=180',
      'title': 'Erterlik',
      'price': '353 TMT',
    },
    {
      'image':
          'https://tse4.mm.bing.net/th?id=OIP.6XzPug6D-8c-tm2nnwrrGwHaE8&pid=Api&P=0&h=180',
      'title': 'Corba',
      'price': '351 TMT',
    },
    {
      'image':
          'https://tse4.mm.bing.net/th?id=OIP.OWmPISenbnt_uML2oImqowHaE8&pid=Api&P=0&h=180',
      'title': 'Salatlar',
      'price': '55 TMT',
    },
    {
      'image':
          'https://tse2.mm.bing.net/th?id=OIP.JIGH2eoIjYpQO80RzqfkqwHaEK&pid=Api&P=0&h=180',
      'title': 'Etli Nahar',
      'price': '22 TMT',
    },
    {
      'image':
          'https://tse2.mm.bing.net/th?id=OIP.EBgpjBDJ5rNTFuTph5AguQAAAA&pid=Api&P=0&h=180',
      'title': 'Hamyrly',
      'price': '335 TMT',
    },
    {
      'image':
          'https://tse2.mm.bing.net/th?id=OIP.OstwHGlXl5cQw6LZD3WxTAAAAA&pid=Api&P=0&h=180',
      'title': 'Padnos',
      'price': '65 TMT',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Salam $username!',
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 22),
              Text(
                'Işiňiz açyk bolsun!',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 18),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Gözle',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                  autoPlayInterval: const Duration(seconds: 3),
                ),
                items: [
                  'https://tse1.mm.bing.net/th?id=OIP.Ck5NVAEadNRV05MnoyIWrwHaFj&pid=Api&P=0&h=180',
                  'https://tse2.mm.bing.net/th?id=OIP.M1owf8tTJ3XenvF4VxHoGgHaE8&pid=Api&P=0&h=180',
                  'https://tse3.mm.bing.net/th?id=OIP.PAs9ALmpLSVQpk7O3dqklwHaFW&pid=Api&P=0&h=180',
                ]
                    .map((item) => ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network(
                            item,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ))
                    .toList(),
              ),
              const SizedBox(height: 30),
              Text(
                'Meşhur naharlar',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 240,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: popularDishes.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 16),
                  itemBuilder: (context, index) {
                    final dish = popularDishes[index];
                    return HomePageItem(dish: dish);
                  },
                ),
              ),
              _buildDishCategory('Doner', [
                {
                  'image':
                      'https://tse1.mm.bing.net/th?id=OIP.TSs9HmsFZ3SKQzn4HPYy5AHaE7&pid=Api&P=0&h=180',
                  'title': 'Etli Doner',
                  'price': '88 TMT',
                },
                {
                  'image':
                      'https://tse2.mm.bing.net/th?id=OIP.JIGH2eoIjYpQO80RzqfkqwHaEK&pid=Api&P=0&h=180',
                  'title': 'Towukly Doner',
                  'price': '66 TMT',
                },
              ]),
              _buildDishCategory('Sushi', [
                {
                  'image':
                      'https://tse4.mm.bing.net/th?id=OIP.kUtTzpGTMZQxCEyv2brQ4wHaEK&pid=Api&P=0&h=180',
                  'title': 'California Roll',
                  'price': '55 TMT',
                },
                {
                  'image':
                      'https://tse4.mm.bing.net/th?id=OIP.kUtTzpGTMZQxCEyv2brQ4wHaEK&pid=Api&P=0&h=180',
                  'title': 'California Roll',
                  'price': '666 TMT',
                },
                {
                  'image':
                      'https://tse4.mm.bing.net/th?id=OIP.V7c_3O04n_ouDkYJxTV9qwAAAA&pid=Api&P=0&h=180',
                  'title': 'Nigiri',
                  'price': '44 TMT',
                },
              ]),
              _buildDishCategory('Erterlik', [
                {
                  'image':
                      'https://tse4.mm.bing.net/th?id=OIP.OWmPISenbnt_uML2oImqowHaE8&pid=Api&P=0&h=180',
                  'title': 'Gozleme',
                  'price': '32 TMT',
                },
                {
                  'image':
                      'https://tse2.mm.bing.net/th?id=OIP.EBgpjBDJ5rNTFuTph5AguQAAAA&pid=Api&P=0&h=180',
                  'title': 'Yumurta',
                  'price': '44 TMT',
                },
              ]),
            ],
          ),
        ),
      ),
    );
  }
}


Widget _buildDishCategory(String title, List<Map<String, String>> dishes) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 24),
      Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      const SizedBox(height: 16),
      SizedBox(
        height: 260,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: dishes.length,
          itemBuilder: (context, index) {
            final dish = dishes[index];
            return Container(
              width: 150,
              margin: const EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        dish['image']!,
                        height: 160,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      dish['title']!,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${dish['price'] ?? '30 TMT'}',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.green[700],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.all(6),
                          child: const Icon(
                            Icons.shopping_cart_outlined,
                            size: 18,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    ],
  );
}
