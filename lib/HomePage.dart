import 'package:flutter/material.dart';
import 'package:tourism_app/HomeBody.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor:Color(0xFFF5F5F5),
       body:  Homebody(),
    );
  }
}
