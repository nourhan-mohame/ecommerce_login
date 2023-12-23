import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_login/task12&13/models/ads-models.dart';
import 'package:ecommerce_login/task12&13/models/catgeroy.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<catgeroy_data>> getCategories() async {
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
  }

  Future<List<Ad>> getAds() async {
    QuerySnapshot querySnapshot = await _firestore.collection('ads').get();
    return querySnapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      return Ad(id: doc.id, name: data['title'], image: data['imageUrl']);
    }).toList();
  }
}
