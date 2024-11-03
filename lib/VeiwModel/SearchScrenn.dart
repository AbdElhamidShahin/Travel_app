import 'package:Tourism_app/VeiwModel/SearchScrenn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/cubit/bloc.dart';
import '../model/cubit/states.dart';

class Search extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Search")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              controller: searchController,
              onChanged: (value) {
                RecipeCubit.get(context).getSearch(value);
              },
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Search must not be empty';
                }
                return null;
              },
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                labelText: "Search",
                prefixIcon: const Icon(Icons.search),
                border: const OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent),
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              ),
            ),
          ),
          Expanded(
            child: BlocConsumer<RecipeCubit, RecipeState>(
              listener: (BuildContext context, RecipeState state) {},
              builder: (BuildContext context, RecipeState state) {
                var list = RecipeCubit.get(context).searchResults;
                if (list.isEmpty) {
                  return const Center(
                    child: Text("No results found", style: TextStyle(fontSize: 18, color: Colors.grey)),
                  );
                }
                return ArticleBuilder(list: list);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class BuildArticleItem extends StatelessWidget {
  final dynamic article;

  const BuildArticleItem(this.article, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(
                  article['urlToImage'] != null && article['urlToImage'].isNotEmpty
                      ? article['urlToImage']
                      : 'https://thumbs.dreamstime.com/b/news-woodn-dice-depicting-letters-bundle-small-newspapers-leaning-left-dice-34802664.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  article['title'] ?? 'No Title',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                Text(
                  article['publishedAt'] ?? '',
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ArticleBuilder extends StatelessWidget {
  final List<dynamic> list;

  const ArticleBuilder({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => BuildArticleItem(list[index]),
      separatorBuilder: (context, index) => const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Divider(),
      ),
      itemCount: list.length,
    );
  }
}
