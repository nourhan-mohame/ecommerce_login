import 'dart:convert';

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../prodect-data/product_data_class.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  int _currentSlide = 0;

  final List<Widget> _pages = [
    Placeholder(color: Colors.red),
    Placeholder(color: Colors.green),
    Placeholder(color: Colors.blue),
    Placeholder(color: Colors.yellow),
  ];

  late List<product> _product = [];

  Future<void> _loadproduct() async {
    final String data =
    await DefaultAssetBundle.of(context).loadString('assets/data/productlist.json');

    if (data != null) {
      final List<dynamic> jsonList = json.decode(data);
      setState(() {
        _product = jsonList.map((json) => product.fromJson(json)).toList();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _loadproduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('app'),
      ),
      body: Stack(
        children: [
          IndexedStack(
            index: _selectedIndex,
          ),
          Positioned(
            top: 20,
            left: 0,
            right: 0,
            child: Column(
              children: [
                CarouselSlider(
                  items: _product.map((product) {
                    return Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(product.imageUrl!),
                          fit: BoxFit.cover,
                        ),
                      ),

                      child:Column(
                        children: [
                          Text(product.name ?? ''),
                          Text(product.category ?? ''),
                          Text(product.price ?? ''),
                        ],
                      ),
                    );

                  }).toList(),
                  options: CarouselOptions(
                    height: 300,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    autoPlayAnimationDuration: const Duration(milliseconds: 800),
                    viewportFraction: 0.8,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentSlide = index;
                      });
                    },
                    enableInfiniteScroll: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.scale,
                  ),
                ),
                SizedBox(height: 30),
                DotsIndicator(
                  dotsCount: _product.length > 0 ? _product.length : 1,
                  position: _currentSlide.toInt(),
                  decorator: DotsDecorator(
                    size: const Size.square(9.0),
                    activeSize: const Size(18.0, 9.0),
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black26,
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}