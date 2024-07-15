import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uy_ishi_3/cubid/product_cupid.dart';
import 'package:uy_ishi_3/screens/product_card.dart';

class WallDecorationScreen extends StatelessWidget {
  const WallDecorationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final products = context.watch<ProductCubit>().state.products;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                'https://m.media-amazon.com/images/I/71nFcZ0nXXL.jpg',
                fit: BoxFit.cover,
              ),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Have ${products.length} products'),
                      DropdownButton<String>(
                        hint: const Text('Sort by'),
                        items: <String>['Price', 'Rating', 'Name']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          Provider.of<ProductCubit>(context, listen: false)
                              .sortProducts(value!);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
                childAspectRatio: 0.75,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return ProductCard(product: products[index]);
                },
                childCount: products.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
