import 'package:Tourism_app/view/Wedget/IconfavoriteItem.dart';
import 'package:flutter/material.dart';
import '../../model/articalmodel.dart';
import 'CustomDetails.dart';

class CustomCategories extends StatelessWidget {
  final Travel? travel;

  const CustomCategories({super.key, this.travel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (travel != null) {
          Navigator.of(context).push(
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  CustomDetails(travel: travel),
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
                          travel!.image,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Align(
                          alignment: Alignment.topRight,
                          child: Iconfavoriteitem(
                            travel: travel,
                          )),
                    ), // تمرير travel هنا
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    Text(
                       travel!.name ,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 1,
                          fontWeight: FontWeight.w500),
                    ),
                    const Spacer(),
                    const Image(
                      image: AssetImage('assets/imagesFood/star.png'),
                      height: 25,
                      width: 25,
                    ),
                    Text(
                    travel!.rating,
                      style: const TextStyle(color: Colors.black, fontSize: 1),
                    ),
                  ],
                ),
              ),
               Row(
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
                    '${travel!.price}',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  Text(
                    '/Person',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
