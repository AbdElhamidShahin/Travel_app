import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/articalmodel.dart';
import '../../model/itemProvider.dart';
import 'CustomDetails.dart';

class CustomCategories extends StatefulWidget {
  final Recipe? recipe;

  const CustomCategories({super.key, this.recipe});

  @override
  State<CustomCategories> createState() => _CustomCategoriesState();
}

class _CustomCategoriesState extends State<CustomCategories> {
  bool _isFavorite = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.red,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: const Image(
                    image: AssetImage(
                  'food/giza-pyramids-cairo-egypt-with-palm-1024x634.webp',
                ),)),
            const Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  Text(
                    "Giza Pyamids ",
                    style: TextStyle(color: Colors.black),
                  ),
                  Spacer(),
                  Image(
                    image: AssetImage('assets/imagesFood/star.jpeg'),
                    height: 20,
                    width: 20,
                  ),
                  Text(
                    '4.5',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
            const Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: Colors.grey,
                ),
                Text(
                  "Egypt ",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                Spacer(),
                Text(
                  '\$65/Person',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );

    //   GestureDetector(
    //   onTap: () {
    //     if (widget.recipe != null) {
    //       Navigator.of(context).push(
    //         PageRouteBuilder(
    //           pageBuilder: (context, animation, secondaryAnimation) =>
    //               CustomDetails(recipe: widget.recipe),
    //           transitionsBuilder:
    //               (context, animation, secondaryAnimation, child) {
    //             var sizeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
    //               CurvedAnimation(
    //                   parent: animation, curve: Curves.easeInOutCubic),
    //             );
    //
    //             return SizeTransition(
    //               sizeFactor: sizeAnimation,
    //               axisAlignment: 0.0,
    //               child: FadeTransition(
    //                 opacity: animation,
    //                 child: child,
    //               ),
    //             );
    //           },
    //           transitionDuration: const Duration(milliseconds: 600),
    //         ),
    //       );
    //     }
    //   },
    //   child: Stack(
    //     children: [
    //       Positioned(
    //         top: 70,
    //         left: 0,
    //         right: 0,
    //         bottom: 0,
    //         child: Container(
    //           decoration: BoxDecoration(
    //             borderRadius: BorderRadius.circular(20),
    //             color: Colors.white,
    //           ),
    //           child: Padding(
    //             padding: const EdgeInsets.all(12.0),
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 const Spacer(),
    //                 Column(
    //                   crossAxisAlignment: CrossAxisAlignment.end,
    //                   children: [
    //                     Text(
    //                       widget.recipe?.name ?? 'اسم غير متاح',
    //                       style: const TextStyle(
    //                           color: Colors.black, fontSize: 20),
    //                     ),
    //                     Row(
    //                       children: [
    //                         Text(
    //                           '⏱ ${widget.recipe!.nutrition?.prepTime ?? 15} Mins',
    //                           style: const TextStyle(
    //                               color: Colors.black, fontSize: 12),
    //                         ),
    //                         const Spacer(),
    //                         IconButton(
    //                           onPressed: () {
    //                             setState(() {
    //                               widget.recipe!.isFavorite =
    //                                   !widget.recipe!.isFavorite;
    //                             });
    //
    //                             if (widget.recipe != null) {
    //                               Provider.of<ItemProvider>(context,
    //                                       listen: false)
    //                                   .addItem(widget.recipe!);
    //                             }
    //                           },
    //                           icon: Icon(
    //                             widget.recipe!.isFavorite
    //                                 ? Icons.favorite
    //                                 : Icons.favorite_border,
    //                             size: 25,
    //                             color: widget.recipe!.isFavorite
    //                                 ? Colors.red
    //                                 : null,
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                   ],
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ),
    //       ),
    //       Positioned(
    //         top: 0,
    //         right: 0,
    //         left: 0,
    //         bottom: 100,
    //         child: Hero(
    //           tag: widget.recipe?.imageUrl ?? 'default-hero',
    //           child: ClipRRect(
    //             borderRadius: BorderRadius.circular(16),
    //             child: Image.asset(
    //               widget.recipe?.imageUrl ?? 'assets/imagesFood/download.png',
    //               height: 100,
    //               fit: BoxFit.cover,
    //               errorBuilder: (context, error, stackTrace) {
    //                 return Image.asset(
    //                   'assets/imagesFood/download.png',
    //                   height: 100,
    //                 );
    //               },
    //             ),
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
