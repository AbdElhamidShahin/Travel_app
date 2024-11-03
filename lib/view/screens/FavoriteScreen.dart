import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/articalmodel.dart';
import '../../model/itemProvider.dart';

class Favorite extends StatelessWidget {
  final Travel? travel;

  const Favorite({super.key, this.travel});

  @override
  Widget build(BuildContext context) {
    return Consumer<ItemProvider>(
      builder: (context, itemProvider, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Center(
              child: Text(
                'My Favorite',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          ),
          body: itemProvider.items.isEmpty
              ? const Center(
                  child: Text('No favorite items',
                      style: TextStyle(fontSize: 18, color: Colors.grey)),
                )
              : ListView.builder(
                  itemCount: itemProvider.items.length,
                  itemBuilder: (context, index) {
                    final recipe = itemProvider.items[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(16),
                                bottomLeft: Radius.circular(16),
                              ),
                              child: Image.asset(
                                travel?.image ??
                                    'assets/images/placeholder.png',
                                width: 120,
                                height: 120,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      recipe.name,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            color: Colors.grey,
                                          ),
                                          height: 28,
                                          width: 28,
                                          child: Image.asset(
                                              'assets/imagesFood/timer.jpeg'),
                                        ),
                                        const SizedBox(width: 4),
                                        Text("${travel?.rating} min",
                                            style: const TextStyle(
                                                fontSize: 16,
                                                color: Colors.black54)),
                                        const Spacer(),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            color: Colors.grey,
                                          ),
                                          height: 28,
                                          width: 28,
                                          child: Image.asset(
                                              'assets/imagesFood/star.jpeg'),
                                        ),
                                        const SizedBox(width: 4),
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text("${travel?.rating} ",
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black54)),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: IconButton(
                                onPressed: () {
                                  itemProvider.removeItem(recipe);
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                  size: 30,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        );
      },
    );
  }
}
