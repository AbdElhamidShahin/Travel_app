import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/articalmodel.dart';
import '../../model/itemProvider.dart';

class Iconfavoriteitem extends StatefulWidget {
  const Iconfavoriteitem({super.key, this.travel});
  final Travel? travel;

  @override
  State<Iconfavoriteitem> createState() => _IconfavoriteitemState();
}

class _IconfavoriteitemState extends State<Iconfavoriteitem> {
  late bool isFavorite; // تعيين قيمة افتراضية لـ isFavorite

  @override
  void initState() {
    super.initState();
    isFavorite = false; // تعيين القيمة الافتراضية
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: InkWell(
        onTap: () {
          if (widget.travel != null) {
            Provider.of<ItemProvider>(context, listen: false)
                .addItem(widget.travel!);
            setState(() {
              isFavorite = !isFavorite; // تغيير الحالة عند الضغط
            });
          }
        },
        child: Container(
          padding: EdgeInsets.all(12), // لزيادة المساحة حول الأيقونة
          child: Icon(
            Icons.favorite_outlined,
            size: 30,
            color: isFavorite
                ? Colors.red
                : Colors.transparent, // تغيير اللون بناءً على الحالة
            shadows: [
              BoxShadow(
                color: Colors.white, // لون الحواف
                blurRadius: 3.0, // لتنعيم الحواف
                spreadRadius: 1.0, // لتوسيع الحواف
              ),
            ],
          ),
        ),
      ),
    );
  }
}
