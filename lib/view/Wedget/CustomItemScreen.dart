import 'package:flutter/material.dart';

import '../../model/articalmodel.dart';

class Customitemscreen extends StatefulWidget {
  const Customitemscreen({super.key, this.travel, this.onTap, this.onTap1, });
  final Travel? travel;
  final VoidCallback? onTap;
  final VoidCallback? onTap1;

  @override
  State<Customitemscreen> createState() => _CustomitemscreenState();
}

class _CustomitemscreenState extends State<Customitemscreen> {
  bool isFavorite = false;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap1, // استخدم widget.onTap هنا
      child: Container(
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
                      image: AssetImage(
                        widget.travel!.image,
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
                            const BoxShadow(
                              color: Colors.white,
                              blurRadius: 1.0,
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
                      widget.travel?.name.substring(0, 10) ?? 'No Name',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    const Row(
                      children: [
                        Text(
                          "Starting from",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        SizedBox(width: 8),
                        Text(
                          "\$59",
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ],
                    ),
                    const SizedBox(height: 22),
                    const Row(
                      children: [
                        Icon(Icons.location_on_outlined),
                        Text(
                          'Egypt',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                        SizedBox(width: 30),
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
      ),
    );

  }
}
