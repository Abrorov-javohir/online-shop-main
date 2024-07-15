import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uy_ishi_3/cubid/product_cupid.dart';
import 'package:uy_ishi_3/model/product.dart';
import 'package:uy_ishi_3/model/product_provider.dart';
import 'package:uy_ishi_3/screens/product_card.dart';

class LivingRoomScreen extends StatelessWidget {
  const LivingRoomScreen({super.key});

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
                'https://media.architecturaldigest.com/photos/62f3c04c5489dd66d1d538b9/master/w_1600%2Cc_limit/_Hall_St_0256_v2.jpeg',
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
