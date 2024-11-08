import 'package:flutter/material.dart';
import '../../model/articalmodel.dart';
import 'IconfavoriteItem.dart';

class CustomDetails extends StatefulWidget {
  final Travel? travel;

  const CustomDetails({
    super.key,
    required this.travel,
  });

  @override
  State<CustomDetails> createState() => _CustomDetailsState();
}

bool isFavorite = false; // لتتبع حالة الأيقونة

class _CustomDetailsState extends State<CustomDetails> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.travel != null) {
          Navigator.of(context).push(
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  CustomDetails(travel: widget.travel),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                var sizeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
                  CurvedAnimation(
                      parent: animation, curve: Curves.easeInOutCubic),
                );

                return SizeTransition(
                  sizeFactor: sizeAnimation,
                  axisAlignment: 0.0,
                  child: FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                );
              },
              transitionDuration: const Duration(milliseconds: 600),
            ),
          );
        }
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(16), top: Radius.circular(16)),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.45,
                      width: double.infinity,
                      child: Hero(
                        tag: widget.travel!.image,
                        child: Image.asset(
                          widget.travel!.image,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const Center(
                                child: CircularProgressIndicator());
                          },
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Color(0xFFC8B9A4),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Iconfavoriteitem(
                        travel: widget.travel,
                      ),
                    ),
                  ),

                ]),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      widget.travel?.name ?? '',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    const Text(
                      "\$225",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const Row(
                  children: [
                    Text(
                      "Egypt",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(
                      'Per Person',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 22),
                const Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
                const SizedBox(height: 22),
                Row(
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(50)),
                      child: const Icon(Icons.location_on_outlined),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      widget.travel?.address ?? '',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(50)),
                      child: const Icon(Icons.watch_later_outlined),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      widget.travel?.working_hours ?? '',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    ),
                    const Spacer(),
                    const Image(
                      image: AssetImage('assets/imagesFood/star.png'),
                      height: 35,
                      width: 35,
                    ),
                    Text(
                      widget.travel?.rating ?? '',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'Description',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 24),
                ),
                const SizedBox(height: 12),
                Text(
                  widget.travel?.description ?? '',
                  style: const TextStyle(color: Colors.grey, fontSize: 18),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Center(
                    child: Text(
                      "Book now",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
