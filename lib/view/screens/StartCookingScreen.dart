import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../model/articalmodel.dart';
import '../Wedget/IconText_CustomDetails.dart';
import '../Wedget/Ingredients_Screen.dart';

class StartCookingScreen extends StatefulWidget {
  final Travel? travel;

  const StartCookingScreen({
    super.key,
    required this.travel,
  });

  @override
  _StartCookingScreenState createState() => _StartCookingScreenState();
}

class _StartCookingScreenState extends State<StartCookingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<double> _scaleAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(); // Repeats the animation indefinitely

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _scaleAnimation = Tween<double>(begin: 1, end: 1.2).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    _colorAnimation = ColorTween(begin: Colors.black, end: Colors.red).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(42, 45, 52, 1),
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
                  borderRadius: BorderRadius.circular(50),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),
                    Text(
                      widget.travel?.name ?? '',
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Center(
                      child: Text(
                        widget.travel?.description ?? '',
                        style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                            color: Colors.black54),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Row(
                    //   children: [
                    //     IconText(
                    //       text: "${widget.recipe?.nutrition?.calories} Kcal",
                    //       image: 'assets/imagesFood/22.png',
                    //     ),
                    //     const Spacer(),
                    //     IconText(
                    //       text: "${widget.recipe?.nutrition?.calories} Fats",
                    //       image: 'assets/food/high-fat-food-rgb-color-icon-vector-37009941.png',
                    //     ),
                    //   ],
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   children: [
                    //     IconText(
                    //       text: "${widget.recipe?.nutrition?.calories} Carbs",
                    //       image: 'assets/food/wheat-icon-wheat-logo-illustration-isolated-on-white-background-editable-stroke-free-vector.png',
                    //     ),
                    //     const Spacer(),
                    //     IconText(
                    //       text: "${widget.recipe?.nutrition?.protein} Protein",
                    //       image: 'assets/food/381007.png',
                    //     ),
                    //   ],
                    // ),
                    const Text(
                      "Steps",
                      style: TextStyle(
                          fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                    // const SizedBox(height: 10),
                    // if (widget.recipe?.steps != null &&
                    //     widget.recipe!.steps.isNotEmpty)
                    //   SizedBox(
                    //     height: 200,
                    //     child: SingleChildScrollView(
                    //       child: Column(
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: widget.recipe!.steps.map((steps) {
                    //           return Ingredients(
                    //             text1: steps,
                    //           );
                    //         }).toList(),
                    //       ),
                    //     ),
                    //   )
                    // else
                    //   Text(
                    //     "لا توجد مكونات متاحة",
                    //     style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    //   ),
                    // const SizedBox(height: 20),

                    // Enhanced animation with rotation, scaling, and color change
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Center(
                        child: Text(
                          "End Recipe",
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
          ),          Positioned(
            top: 0,
            right: 0,
            left: 0,
            bottom: 600,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: SizedBox(
                height: 100,
                width: double.infinity,
                child: Hero(
                  tag: widget.travel?.image ?? 'default-hero',

                  child: Image.asset(
                    widget.travel?.image ?? 'assets/imagesFood/download.png',
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
    );
  }
}
