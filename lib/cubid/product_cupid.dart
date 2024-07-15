import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uy_ishi_3/model/product.dart';

class ProductState {
  final List<Product> products;
  final List<Product> cartItems;

  ProductState({required this.products, required this.cartItems});
}

class ProductCubit extends Cubit<ProductState> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  ProductCubit() : super(ProductState(products: [], cartItems: [])) {
    _fetchProductsFromFirestore();
  }

  Future<void> _fetchProductsFromFirestore() async {
    try {
      final QuerySnapshot snapshot = await _firestore.collection('shop').get();
      final products = snapshot.docs.map((doc) => Product.fromDocument(doc)).toList();
      emit(ProductState(products: products, cartItems: state.cartItems));
    } catch (e) {
      print('Error fetching products: $e');
    }
  }

  void toggleLikeStatus(Product product) {
    product.isLiked = !product.isLiked;
    emit(ProductState(products: state.products, cartItems: state.cartItems));
  }

  void sortProducts(String criterion) {
    final sortedProducts = List<Product>.from(state.products);
    switch (criterion) {
      case 'Price':
        sortedProducts.sort((a, b) => a.price.compareTo(b.price));
        break;
      case 'Rating':
        sortedProducts.sort((a, b) => b.rating.compareTo(a.rating));
        break;
      case 'Newest':
        // Implement sorting logic for newest
        break;
    }
    emit(ProductState(products: sortedProducts, cartItems: state.cartItems));
  }

  void addToCart(Product product) {
    final cartItems = List<Product>.from(state.cartItems)..add(product);
    emit(ProductState(products: state.products, cartItems: cartItems));
  }

  void removeFromCart(Product product) {
    final cartItems = List<Product>.from(state.cartItems)..remove(product);
    emit(ProductState(products: state.products, cartItems: cartItems));
  }
}
