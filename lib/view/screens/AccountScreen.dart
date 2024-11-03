
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TabBar Sample'),
        bottom: const TabBar(
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.cloud_outlined),
            ),
            Tab(
              icon: Icon(Icons.beach_access_sharp),
            ),
            Tab(
              icon: Icon(Icons.brightness_5_sharp),
            ),
          ],
        ),
      ),
      body: const TabBarView(
        children: <Widget>[
          Center(
            child: Text("It's cloudy here"),
          ),
          Center(
            child: Text("It's rainy here"),
          ),
          Center(
            child: Text("It's sunny here"),
          ),
        ],
      ),
    );
  }
}

class CustomIconSettings extends StatelessWidget {
  const CustomIconSettings(
      {super.key, required this.text, required this.image, this.icon});
  final String text;

  final String image;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          Image(
            image: AssetImage(image),
            width: 40,
            height: 40,
          ),
          const SizedBox(
            width: 6,
          ),
          Column(
            children: [
              Text(
                text,
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(12),
              ),
              child: IconButton(
                onPressed: () {},
                icon: Icon(icon),
              ),
            ),
          )
        ],
      ),
    );
  }
}
