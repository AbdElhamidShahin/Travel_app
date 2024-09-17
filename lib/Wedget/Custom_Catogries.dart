import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourism_app/Wedget/Custom_details.dart';

import 'Favorite_Item.dart';
import 'Product_modile.dart';

class CustomCatogries extends StatefulWidget {
  final DataModel product;

  final String name;
  final String discription;
  final String img;
  final double price;

  const CustomCatogries({
    super.key,
    required this.name,
    required this.discription,
    required this.img,
    required this.price,required this.product,
  });

  @override
  State<CustomCatogries> createState() => _CustomCatogriesState();
}

class _CustomCatogriesState extends State<CustomCatogries> {
  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomDetails(
          name: widget.name,
          discription: widget.discription,
          img: widget.img,
          price: widget.price,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showDialog,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: widget.img.isNotEmpty
                  ? Image.network(
                widget.img,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 140,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey,
                    width: double.infinity,
                    height: 140,
                    child: const Center(
                      child: Image(
                        image: AssetImage('assets/Images/images.jpg'),
                      ),
                    ),
                  );
                },
              )
                  : Container(
                color: Colors.grey,
                width: double.infinity,
                height: 140,
                child: const Center(
                  child: Image(
                    image: AssetImage('assets/Images/images.jpg'),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name.isNotEmpty ? widget.name : 'No Title',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.discription.isNotEmpty
                        ? widget.discription
                        : 'No Description',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                      color: Colors.grey,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        '\$${widget.price.toStringAsFixed(2)}',  // تحسين عرض السعر
                        style: const TextStyle(
                          color: Color(0xFF388E3C),
                          fontSize: 18,
                        ),
                      ),
                      const Spacer(),
      IconButton(
        onPressed: () {
          setState(() {
            widget.product.isFavorite = !widget.product.isFavorite;
          });

          final likeProvider = Provider.of<Like>(context, listen: false);

          if (widget.product.isFavorite) {
            // If the product is now a favorite, add it to the list
            likeProvider.add(widget.product);
          } else {
            // If the product is no longer a favorite, remove it from the list
            likeProvider.remove(widget.product);
          }
        },
        icon: Icon(
          widget.product.isFavorite ? Icons.favorite : Icons.favorite_border,
          size: 25,
          color: widget.product.isFavorite ? Colors.red : null,
        ),
      ),

      ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
