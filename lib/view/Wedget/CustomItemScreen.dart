

import 'package:flutter/material.dart';

import '../../model/articalmodel.dart';

class Customitemscreen extends StatefulWidget {
  const Customitemscreen({super.key, this.travel, this.onTap});
  final Travel? travel;
  final VoidCallback? onTap;

  @override
  State<Customitemscreen> createState() => _CustomitemscreenState();
}

class _CustomitemscreenState extends State<Customitemscreen> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image(
                    image: const NetworkImage(
                      'https://c.myholidays.com/packages/182f8b6a-8f17-4e04-8370-fdfdfb69fb87/original/5c34188f-c589-470a-8a9a-5a0949f3c046.webp',
                    ),
                    width: MediaQuery.of(context).size.width * 0.4,
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                      if (widget.onTap != null) {
                        widget.onTap!();
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(12),
                      child: Icon(
                        Icons.favorite_outlined,
                        size: 30,
                        color: isFavorite ? Colors.red : Colors.transparent,
                        shadows: [
                          BoxShadow(
                            color: Colors.white,
                            blurRadius: 3.0,
                            spreadRadius: 1.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.travel?.name ?? 'No Name',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        "Kamak Complex",
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      SizedBox(width: 8),
                      Text(
                        "\$59",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(height: 22),
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined),
                      Text(
                        'Egypt',
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      SizedBox(width: 40),
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
          ],
        ),
      ),
    );
  }
}
