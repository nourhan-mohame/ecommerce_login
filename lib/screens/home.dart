import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_login/prodect-data/product_details_model_provider.dart';
import 'package:ecommerce_login/screens/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:provider/provider.dart';

import '../prodect-data/product_data_class.dart';
import 'product_card.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  int _currentSlide = 0;

  Future<List<product>> readJsonData() async {
    final jsondata =
    await rootBundle.rootBundle.loadString('assets/data/productlist.json');
    final list = json.decode(jsondata) as List<dynamic>;
    return list.map((e) => product.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('app'),
      ),
      body: Column(
        children: [
          // Carousel Slider
          FutureBuilder(
            future: readJsonData(),
            builder: (context, data) {
              if (data.hasError) {
                return Center(
                  child: Text("${data.error}"),
                );
              } else if (data.hasData) {
                var items = data.data as List<product>;
                return CarouselSlider.builder(
                  itemCount: items == null ? 0 : items.length,
                  itemBuilder: (BuildContext context, int index, int realIndex) {
                    return Card(
                      elevation: 5,
                      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 50,
                              height: 50,
                              child: Image(
                                image: NetworkImage(items[index].imageUrl.toString()),
                                fit: BoxFit.fill,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8, right: 8),
                                      child: Text(
                                        items[index].name.toString(),
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8, right: 8),
                                      child: Text(items[index].price.toString()),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  options: CarouselOptions(
                    initialPage: 0,
                    aspectRatio: 2.0,
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentSlide = index;
                      });
                    },
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          // Grid of Three Cards
          Container(
            padding: const EdgeInsets.all(8),
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: 3, // Number of cards in the grid
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {

                    // Navigate to the next page when a card is tapped
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChangeNotifierProvider(create:
                        (context)=>product_details_model_provider(),
                        child:const ProductDetails(),)
                      ),
                    );
                  },
                  child: Card(
                    elevation: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ProductCard(
                          imageAsset: 'assets/image/${index + 1}.jpg',
                          productName: 'Product ${index + 1}',
                          productPrice: 'Price: \$${(index + 1) * 10}.00',
                        ),
                      ],
                    ),
                  ),
                );
              },
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
