import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/cubit/bloc.dart';
import '../model/cubit/states.dart';
import 'ArticleBuilderSearch.dart';

class Search extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Search")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: TextFormField(
              controller: searchController,
              onChanged: (value) {
                TravelCubit.get(context).getSearch(value);
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
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              ),
            ),
          ),
          Flexible(
            child: BlocConsumer<TravelCubit, TravelState>(
              listener: (BuildContext context, TravelState state) {
                if (state is TravelGetSearchLodingState) {}
              },
              builder: (BuildContext context, TravelState state) {
                var list = TravelCubit.get(context).searchResults;

                if (state is TravelGetSearchLodingState) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (list.isEmpty) {
                  return const Center(
                    child: Text(
                      "No results found",
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  );
                }

                return ArticleBuilderSearch(travel: list);
              },
            ),
          ),
        ],
      ),
    );
  }
}
