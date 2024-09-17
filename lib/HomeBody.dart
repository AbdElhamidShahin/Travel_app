import 'package:flutter/material.dart';

import 'Tab_Bar.dart';

class Homebody extends StatefulWidget {
  const Homebody({super.key});

  @override
  State<Homebody> createState() => _HomebodyState();
}

class _HomebodyState extends State<Homebody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: IconButton(
          onPressed: () {},
          icon: Icon(Icons.grid_view_sharp),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon:const Icon(Icons.notifications_none),
          ),
          const  SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image Container
              Container(
                width: MediaQuery.of(context).size.width,
    
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Image.asset(
                    'assets/Images/images.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const  SizedBox(height: 50),
    
              // Title Text
              const Text(
                'Categories',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
    
              SizedBox(height: 10),
    
              // TabBar
              TabBarPage(),
            ],
          ),
        ),
      ),
    );
  }
}
