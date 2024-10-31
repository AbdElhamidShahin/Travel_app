import 'package:Tourism_app/view/Wedget/Ingredients_Screen.dart';
import 'package:flutter/material.dart';

import '../../model/articalmodel.dart';
import '../screens/StartCookingScreen.dart';
import 'IconText_CustomDetails.dart';

class CustomDetails extends StatefulWidget {
  final Recipe? recipe;
  final Nutrition? nutrition;

  const CustomDetails({
    super.key,
    required this.recipe,
    this.nutrition,
  });

  @override
  State<CustomDetails> createState() => _CustomDetailsState();
}

class _CustomDetailsState extends State<CustomDetails> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.recipe != null) {
          Navigator.of(context).push(
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  CustomDetails(recipe: widget.recipe),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                var sizeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
                  CurvedAnimation(
                      parent: animation, curve: Curves.easeInOutCubic),
                );

                return SizeTransition(
                  sizeFactor: sizeAnimation,
                  axisAlignment: 0.0,
                  child: FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                );
              },
              transitionDuration: const Duration(milliseconds: 600),
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: Color.fromRGBO(42, 45, 52, 1),
        body: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(50)),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 120),
                      Center(
                        child: Text(
                          widget.recipe?.name ?? '',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconText(
                            text: "${widget.recipe?.nutrition?.prepTime} min",
                            image: 'assets/imagesFood/timer.png',
                          ),
                          IconText(
                            text:
                                "${widget.recipe?.nutrition?.calories} calories",
                            image: 'assets/imagesFood/22.png',
                          ),
                          IconText(
                            text: "${widget.recipe?.nutrition?.protein} ",
                            image: 'assets/imagesFood/star.jpeg',
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Ingredients",
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      if (widget.recipe?.steps != null &&
                          widget.recipe!.steps!.isNotEmpty)
                        Container(
                          height: 220,
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:
                                  widget.recipe!.ingredients.map((ingredient) {
                                return Ingredients(
                                  text1: ingredient,
                                );
                              }).toList(),
                            ),
                          ),
                        )
                      else
                        Text(
                          "لا توجد مكونات متاحة",
                          style:
                              TextStyle(fontSize: 16, color: Colors.grey[600]),
                        ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 16),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      StartCookingScreen(recipe: widget.recipe),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                var scaleAnimation = Tween<double>(
                                  begin: 0.5, // بداية التكبير
                                  end: 1.0, // النهاية
                                ).animate(CurvedAnimation(
                                  parent: animation,
                                  curve: Curves.easeInOut,
                                ));

                                var fadeAnimation = Tween<double>(
                                  begin: 0.0,
                                  end: 1.0,
                                ).animate(CurvedAnimation(
                                  parent: animation,
                                  curve: Curves.easeInOut,
                                ));

                                return ScaleTransition(
                                  scale: scaleAnimation,
                                  child: FadeTransition(
                                    opacity: fadeAnimation,
                                    child: child,
                                  ),
                                );
                              },
                            ),
                          );
                        },
                        child: Center(
                          child: Text(
                            "Start Cooking",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              bottom: 460,
              child: ClipRRect(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(16)),
                child: Container(
                  height: 100,
                  width: double.infinity,
                  child: Hero(
                    tag: widget.recipe?.imageUrl ?? 'default-hero',
                    child: Image.asset(
                      widget.recipe?.imageUrl ??
                          'assets/imagesFood/download.png',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          'assets/imagesFood/download.png',
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
