import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../VeiwModel/SearchScrenn.dart';

class Upperhomepageui extends StatelessWidget {
  const Upperhomepageui({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(0.0),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "  Hello,Jayson",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined),
                      Text(
                        'Cairo, Egypt',
                        style: TextStyle(color: Colors.grey, fontSize: 22),
                      ),
                    ],
                  )
                ],
              ),
              Spacer(),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.white),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications_none,
                    size: 24,
                  ),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image(
                  image: NetworkImage(
                      "https://cdn1.iconfinder.com/data/icons/user-pictures/101/malecostume-512.png"),
                  width: 50,
                  height: 50,
                ),
              )
            ],
          ),
        ),
        // استخدام TextField كبديل لشريط البحث
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
              ),
            ],
          ),
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Discover your place',
              prefixIcon: const Icon(Icons.search, color: Colors.grey),
              hintStyle: TextStyle(
                color: Colors.grey[400],
                fontStyle: FontStyle.italic,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Search()),
              );
            },
          ),
        ),
      ],
    );
  }
}
