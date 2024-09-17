import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Favorite_Item.dart';
import 'Product_modile.dart';

class Favorite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Like>(builder: (context, cart, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Favorite Item',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        body: cart.basketItems.isEmpty
            ? const Center(
                child: Text('No items '),
              )
            : ListView.builder(
                itemCount: cart.basketItems.length,
                itemBuilder: (context, index) {
                  final product = cart.basketItems[index];
                  return Card(
                    child: ListTile(
                      title: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.name!,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Price: \$${product.price!.toString()}',
                                ),
                                IconButton(
                                    onPressed: () {
                                      cart.remove(cart.basketItems[index]);
                                    },
                                    icon: Icon(Icons.delete))
                              ],
                            ),
                          ),
                          Image.network(
                            product.img!,
                            height: 100,
                            width: 100,
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      );
    });
  }
}
