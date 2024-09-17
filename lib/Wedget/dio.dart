import 'package:dio/dio.dart';

import 'Product_modile.dart';

class NewsService {
  final dio = Dio();

  NewsService(Dio dio);

  Future<List<DataModel>> getGenralNews({required String category}) async {
    return await Future.delayed(const Duration(seconds: 2), () async {
      var response = await dio.get(
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=9ff105a7477142d79b9aa26ff0091dde&category=$category');

      Map<String, dynamic> jsonData = response.data;
      List<dynamic> articles = jsonData['articles'];
      List<DataModel> articlesList = [];
      for (var artical in articles) {
        DataModel articaleModel = DataModel(
          price: double.tryParse(artical['price']?.toString() ?? '0.0') ?? 0.0,
          img: artical['urlToImage'],
            name: artical['title'],
            discription: artical['description'],
            starts: artical['url'],
            isFavorite: bool.fromEnvironment('name'),
        );

        articlesList.add(articaleModel);
      }
      print(articlesList);
      return articlesList;
    });
  }
}
