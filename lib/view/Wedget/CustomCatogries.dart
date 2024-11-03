import 'package:Tourism_app/view/Wedget/IconfavoriteItem.dart';
import 'package:flutter/material.dart';
import '../../model/articalmodel.dart';
import 'CustomDetails.dart';

class CustomCategories extends StatefulWidget {
  final Travel? travel;

  const CustomCategories({super.key, this.travel});

  @override
  State<CustomCategories> createState() => _CustomCategoriesState();
}

class _CustomCategoriesState extends State<CustomCategories> {
  bool isFavorite = false; // لتتبع حالة الأيقونة

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.travel != null) {
          Navigator.of(context).push(
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  CustomDetails(travel: widget.travel),
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
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  children: [
                    Positioned(
                      child: Image(
                        image: AssetImage(
                          widget.travel!.image,
                        ),
                      ),
                    ),
                    Iconfavoriteitem(travel: widget.travel), // تمرير travel هنا
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    Text(
                      widget.travel != null ? widget.travel!.name : 'غير متوفر',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                    const Spacer(),
                    const Image(
                      image: AssetImage('assets/imagesFood/star.png'),
                      height: 25,
                      width: 25,
                    ),
                    Text(
                      widget.travel != null ? widget.travel!.rating : '0',
                      style: const TextStyle(color: Colors.black, fontSize: 18),
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
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  Spacer(),
                  Text(
                    '/Person',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ), ],
          ),
        ),
      ),
    );
  }
}

