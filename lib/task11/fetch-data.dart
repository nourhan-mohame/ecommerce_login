import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_login/task11/models/ads-models.dart';
import 'package:ecommerce_login/task11/models/catgeroy.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<catgeroy_data>> getCategories() async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('categories').get();
      return querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return catgeroy_data(
          id: doc.id,
          title: data['title'] ?? '',
          createdAt: data['createdat'] ?? '',
          imageUrl: data['imageUrl'] ?? '',
        );
      }).toList();
    } catch (e) {
      print('Error fetching categories: $e');
      // Handle the error, e.g., show a message to the user or return an empty list
      return [];
    }
  }

  Future<List<Ad>> getAds() async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('ads').get();
      return querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return Ad(id: doc.id, name: data['name'] ?? '', image: data['picture'] ?? '');
      }).toList();
    } catch (e) {
      print('Error fetching ads: $e');
      // Handle the error, e.g., show a message to the user or return an empty list
      return [];
    }
  }
}
