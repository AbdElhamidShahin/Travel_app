import 'package:flutter/material.dart';
import 'package:tourism_app/Wedget/Product_modile.dart';
import 'package:tourism_app/Wedget/Custom_Catogries.dart';

class CustomListViewCatogary extends StatelessWidget {
  final Future<List<DataModel>> futureArticles;

  CustomListViewCatogary({Key? key, required this.futureArticles})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<DataModel>>(
      future: futureArticles,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No articles available'));
        } else {
          final articles = snapshot.data!;

          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
              childAspectRatio: 0.7,
            ),
            itemCount: articles.length,
            itemBuilder: (context, index) {
              final article = articles[index];

              return CustomCatogries(
                product: article,
                name: article.name ?? 'No Title',
                discription: article.discription ?? 'No Description',
                img: article.img ?? 'https://example.com/placeholder.jpg',
                price: article.price ?? 0.00,
              );
            },
          );
        }
      },
    );
  }
}
