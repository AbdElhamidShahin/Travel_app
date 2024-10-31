import 'package:flutter/material.dart';

import '../../model/articalmodel.dart';

class Customcutogarisdoun extends StatelessWidget {
  const Customcutogarisdoun({super.key, this.recipe});
  final Recipe? recipe;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.red),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(
                image: const NetworkImage(
                    'https://plus.unsplash.com/premium_photo-1661915661139-5b6a4e4a6fcc?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aG91c2V8ZW58MHx8MHx8fDA%3D'),
                width: MediaQuery.of(context).size.width * 0.40,
              ),
            ),
            const Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    "Kamak Complex",
                    style: TextStyle(color: Colors.black, fontSize: 20),
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
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Image(
                        image: AssetImage('assets/imagesFood/star.jpeg'),
                        height: 20,
                        width: 20,
                      ),
                      Text(
                        "4.6",
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
