import 'package:ecommerce_login/task11/fetch-data.dart';
import 'package:ecommerce_login/task11/models/ads-models.dart';

import 'package:flutter/material.dart';

class adshome extends StatefulWidget {
   const adshome({Key? key}) : super(key: key);

  @override
  State<adshome> createState() => _adshomeState();
}

class _adshomeState extends State<adshome> {
  final FirestoreService fetchData = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ads Home'),
      ),
      body: FutureBuilder(
        future: fetchData.getAds(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || (snapshot.data as List).isEmpty) {
            return Center(
              child: Text('No ads available.'),
            );
          } else {
            List<Ad> ads = snapshot.data as List<Ad>;

            return ListView.builder(
              itemCount: ads.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(ads[index].name),
                );
              },
            );
          }
        },
      ),
    );
  }
}
