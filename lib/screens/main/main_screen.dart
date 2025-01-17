import 'package:flutter/material.dart';

import '../../shared/layouts/main_layout.dart';
import '../../shared/locale/en.dart';
import '../../shared/widgets/themed_text.dart';
import '../../shared/widgets/product_tile.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Map<String, dynamic>> products = [
    {
      'name': 'Product 1',
      'price': 19.99,
      'description':
          'This is product 1 - a high quality item made with premium materials. Perfect for everyday use and built to last.',
      'image': 'assets/images/product1.jpg',
    },
    {
      'name': 'Product 2',
      'price': 29.99,
      'description':
          'This is product 2 - featuring innovative design and excellent craftsmanship. Ideal for both professional and personal use.',
      'image': 'assets/images/product2.jpg',
    },
    {
      'name': 'Product 3',
      'price': 39.99,
      'description':
          'This is product 3 - combining style and functionality. Made with sustainable materials and environmentally friendly practices.',
      'image': 'assets/images/product3.jpg',
    },
    {
      'name': 'Product 4',
      'price': 49.99,
      'description':
          'This is product 4 - an essential item for any collection. Features modern design elements with classic reliability.',
      'image': 'assets/images/product4.jpg',
    },
    {
      'name': 'Product 5',
      'price': 59.99,
      'description':
          'This is product 5 - carefully crafted for optimal performance. Includes advanced features and premium finish.',
      'image': 'assets/images/product5.jpg',
    },
    {
      'name': 'Product 6',
      'price': 69.99,
      'description':
          'This is product 6 - designed with user comfort in mind. Ergonomic features make this a joy to use daily.',
      'image': 'assets/images/product6.jpg',
    },
    {
      'name': 'Product 7',
      'price': 79.99,
      'description':
          'This is product 7 - the perfect blend of form and function. Versatile enough for multiple applications.',
      'image': 'assets/images/product7.jpg',
    },
    {
      'name': 'Product 8',
      'price': 89.99,
      'description':
          'This is product 8 - setting new standards in quality and design. Backed by our satisfaction guarantee.',
      'image': 'assets/images/product8.jpg',
    },
    {
      'name': 'Product 9',
      'price': 99.99,
      'description':
          'This is product 9 - innovative features meet timeless design. Perfect for both home and office use.',
      'image': 'assets/images/product9.jpg',
    },
    {
      'name': 'Product 10',
      'price': 109.99,
      'description':
          'This is product 10 - premium quality at an excellent value. Includes extended warranty for peace of mind.',
      'image': 'assets/images/product10.jpg',
    },
    {
      'name': 'Product 11',
      'price': 119.99,
      'description':
          'This is product 11 - crafted for durability and performance. Features state-of-the-art technology and materials.',
      'image': 'assets/images/product11.jpg',
    },
    {
      'name': 'Product 12',
      'price': 129.99,
      'description':
          'This is product 12 - designed to exceed expectations. Combines modern aesthetics with practical functionality.',
      'image': 'assets/images/product12.jpg',
    },
    {
      'name': 'Product 13',
      'price': 139.99,
      'description':
          'This is product 13 - the ultimate in luxury and convenience. Handcrafted with attention to every detail.',
      'image': 'assets/images/product13.jpg',
    },
    {
      'name': 'Product 14',
      'price': 149.99,
      'description':
          'This is product 14 - professional grade quality for demanding users. Built to handle intensive daily use.',
      'image': 'assets/images/product14.jpg',
    },
    {
      'name': 'Product 15',
      'price': 159.99,
      'description':
          'This is product 15 - elegant design meets robust construction. Perfect for those who demand the best.',
      'image': 'assets/images/product15.jpg',
    },
    {
      'name': 'Product 16',
      'price': 169.99,
      'description':
          'This is product 16 - featuring cutting-edge innovation and design. Sets new standards in its category.',
      'image': 'assets/images/product16.jpg',
    },
    {
      'name': 'Product 17',
      'price': 179.99,
      'description':
          'This is product 17 - premium materials and expert craftsmanship. Designed to provide years of reliable service.',
      'image': 'assets/images/product17.jpg',
    },
    {
      'name': 'Product 18',
      'price': 189.99,
      'description':
          'This is product 18 - combining traditional quality with modern features. Perfect for the discerning customer.',
      'image': 'assets/images/product18.jpg',
    },
    {
      'name': 'Product 19',
      'price': 199.99,
      'description':
          'This is product 19 - exceptional quality and innovative design. Includes premium features and finishing touches.',
      'image': 'assets/images/product19.jpg',
    },
    {
      'name': 'Product 20',
      'price': 209.99,
      'description':
          'This is product 20 - our flagship product with all premium features. The ultimate choice for professionals.',
      'image': 'assets/images/product20.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: EnLocale.shop,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ThemedText(
            text: 'List of products',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 450,
          child: ListView.separated(
              itemCount: products.length,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemBuilder: (context, index) {
                final product = products[index];
                return ProductTile(
                  title: product['name'],
                  description: product['description'],
                  price: product['price'],
                );
              }),
        ),
      ],
    );
  }
}
