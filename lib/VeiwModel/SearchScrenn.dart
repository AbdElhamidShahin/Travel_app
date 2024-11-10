import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart'; // Ensure correct import
import 'package:google_fonts/google_fonts.dart';
import '../model/articalmodel.dart';
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
                // Call the search function when the value changes
                RecipeCubit.get(context).getSearch(value);
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
          Flexible(
            child: BlocConsumer<RecipeCubit, RecipeState>(
              listener: (BuildContext context, RecipeState state) {
                if (state is NewsGetSearchLodingState) {
                  // Show loading indicator while searching
                }
              },
              builder: (BuildContext context, RecipeState state) {
                var list = RecipeCubit.get(context).searchResults;

                if (state is NewsGetSearchLodingState) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (list.isEmpty) {
                  return const Center(
                    child: Text("No results found",
                        style: TextStyle(fontSize: 18, color: Colors.grey)),
                  );
                }

                return ArticleBuilder(travel: list); // Pass the list to ArticleBuilder
              },
            ),
          ),
        ],
      ),
    );
  }
}

class BuildArticleItem extends StatelessWidget {
  final List<Travel> travel; // Change to a List of Travel objects

  const BuildArticleItem({Key? key, required this.travel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Found ${travel.length} Places", // Show correct count
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Flexible(
              child: StaggeredGridView.countBuilder(
                crossAxisCount: 2,
                shrinkWrap: true,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                itemCount: travel.length, // Corrected access to travel length
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: index.isEven ? Colors.amber : Colors.deepPurple,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image(
                          height: 100,
                          width: 100,
                          image: AssetImage(travel[index].image), // Corrected property access
                        ),
                        Text(travel[index].name), // Corrected property access
                        Text('${travel[index].price}/Person'), // Corrected property access
                      ],
                    ),
                  );
                },
                staggeredTileBuilder: (index) {
                  return StaggeredTile.count(1, index == 0 ? 0.3 : 1);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ArticleBuilder extends StatelessWidget {
  final List<Travel> travel;

  const ArticleBuilder({Key? key, required this.travel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 2,
      shrinkWrap: true,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      itemCount: travel.length, // Ensure this accesses the list length
      itemBuilder: (context, index) {
        return Container(
          color: index.isEven ? Colors.amber : Colors.deepPurple,
          alignment: Alignment.center,
          child: Column(
            children: [
              Image.asset(travel[index].image), // Correct access to image
              Text(travel[index].name), // Correct access to name
              Text('${travel[index].price}/Person'), // Correct access to price
            ],
          ),
        );
      },
      staggeredTileBuilder: (index) {
        return StaggeredTile.count(1, 1); // Customize tile size
      },
    );
  }
}


