import 'package:Tourism_app/view/Wedget/CustomDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/articalmodel.dart';
import '../view/Wedget/IconfavoriteItem.dart';

class ArticleBuilderSearch extends StatelessWidget {
  final List<Travel> travel; // استلام قائمة الأماكن
  const ArticleBuilderSearch({
    Key? key,
    required this.travel,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CustomDetails()),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // عدد الأعمدة
            childAspectRatio: .70,
            mainAxisSpacing: 18,
            crossAxisSpacing: 18,
            // نسبة العرض إلى الارتفاع
          ),
          itemCount: travel.length, // عدد العناصر في القائمة
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(0.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Stack(
                          children: [
                            Positioned(
                              child: Image(
                                image: AssetImage(
                                  travel[index].image,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Align(
                                  alignment: Alignment.topRight,
                                  child: Iconfavoriteitem(
                                    travel: travel[index],
                                  )),
                            ), // تمرير travel هنا
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          travel[index].name,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "\$${travel[index].price}",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          Text(
                            "/Person",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      const Row(
                        children: [
                          Icon(Icons.location_on_outlined),
                          Text(
                            'Egypt',
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                          ),
                          Spacer(),
                          Image(
                            image: AssetImage('assets/imagesFood/star.png'),
                            height: 24,
                            width: 24,
                          ),
                          Text(
                            "4.6",
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
