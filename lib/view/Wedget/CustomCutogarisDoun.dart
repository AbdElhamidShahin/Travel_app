import 'package:flutter/material.dart';

import '../../model/articalmodel.dart';

class Customcutogarisdoun extends StatelessWidget {
  const Customcutogarisdoun({super.key, this.travel});
  final Travel? travel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image(
                  image: const NetworkImage(
                      'https://c.myholidays.com/packages/182f8b6a-8f17-4e04-8370-fdfdfb69fb87/original/5c34188f-c589-470a-8a9a-5a0949f3c046.webp'),
                  width: MediaQuery.of(context).size.width * 0.4,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      "Kamak Complex",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Text(
                          "Kamak Complex",
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                        Text(
                          "\$59",
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    Row(
                      children: [
                        Icon(Icons.location_on_outlined),
                        Text(
                          'Egypt',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                        SizedBox(
                          width: 40,
                        ),
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
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
