import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourism_app/HomePage.dart';
import 'package:tourism_app/Wedget/Buttom_Nav_Bar.dart';

import 'Wedget/Favorite_Item.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Like()), // توفير الكائن Like
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BottomNavigationBarExample(),
    );
  }
}
