import 'package:cloud_firestore/cloud_firestore.dart';

class ProductRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<DocumentSnapshot>> fetchProducts() async {
    final querySnapshot = await _firestore.collection('shop').get();
    return querySnapshot.docs;
  }
}
