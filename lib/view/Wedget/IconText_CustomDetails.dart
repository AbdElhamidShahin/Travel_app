import 'package:flutter/material.dart';

class IconText extends StatelessWidget {
  final String image;
  final String text;

  IconText({required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.asset(image),
            height: 50,
            width: 50,
          ),
          const SizedBox(width: 4),
          Text(text, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
