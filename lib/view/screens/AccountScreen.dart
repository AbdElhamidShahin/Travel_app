import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 241, 242, 1),
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back_ios_new_rounded),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Settings",
              style: TextStyle(fontSize: 36),
            ),
            SizedBox(
              height: 50,
            ),
            const Text(
              'Account',
              style: TextStyle(fontSize: 30),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Row(
                  children: [
                    const Image(
                      image: AssetImage(
                          'assets/food/Drinks/istockphoto-1495088043-612x612.png'),
                      width: 70,
                      height: 70,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    const Column(
                      children: [
                        Text(
                          'abdo@gmail.com',
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          'info',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        )
                      ],
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Text(
              'Settings',
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 16,
            ),
            CustomIconSettings(
              text: 'Language',
              image: 'assets/food/settings/earth.png',
              icon: Icons.arrow_forward_ios,
            ),
            CustomIconSettings(
              text: 'Notificathon',
              image: 'assets/food/settings/bell.png',
              icon: Icons.arrow_forward_ios,
            ),
            CustomIconSettings(
              text: 'Dark Mode ',
              image: 'assets/food/settings/user-interface.png',
              icon: Icons.arrow_forward_ios,
            ),
            CustomIconSettings(
              text: 'Help',
              image: 'assets/food/settings/support.png',
              icon: Icons.arrow_forward_ios,
            ),
          ],
        ),
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
          SizedBox(
            width: 6,
          ),
          Column(
            children: [
              Text(
                text,
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          Spacer(),
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
