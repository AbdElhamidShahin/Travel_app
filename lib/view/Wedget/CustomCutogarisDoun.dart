import 'package:Tourism_app/view/Wedget/CustomDetails.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/articalmodel.dart';
import '../../model/itemProvider.dart';
import 'CustomItemScreen.dart';

class Customcutogarisdoun extends StatelessWidget {
  const Customcutogarisdoun({super.key, this.travel});
  final Travel? travel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, bottom: 10),
      child: GestureDetector(
        child: Customitemscreen(
          travel: travel,
          onTap1: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CustomDetails(
                        travel: travel,
                      )),
            );
          },
          onTap: () {
            if (travel != null) {
              Provider.of<ItemProvider>(context, listen: false)
                  .addItem(travel!);
            }
          },
        ),
      ),
    );
  }
}
