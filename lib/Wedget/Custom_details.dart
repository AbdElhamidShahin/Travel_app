import 'package:flutter/material.dart';
import 'Continar_custom%20Details.dart';

class CustomDetails extends StatelessWidget {
  final String? name;
  final String? discription;
  final String? img;
  final double? price;

  const CustomDetails({
    super.key, this.name, this.discription, this.img, this.price,

  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image Container with Rounded Borders
              Container(
                height: MediaQuery.of(context).size.height * 0.50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: img != null && img!.isNotEmpty
                      ? Image.network(
                    img!,
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
                                image: AssetImage(
                                    'assets/Images/images.jpg'))),
                      );
                    },
                  )
                      : Container(
                    color: Colors.grey,
                    width: double.infinity,
                    height: 140,
                    child: const Center(
                        child: Image(
                            image:
                            AssetImage('assets/Images/images.jpg'))),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Title Section
              Text(
             name ?? 'No Title',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 10),

              // Icon Info Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Continar_Custom_details(
                    icon: Icons.monetization_on,
                    text: price != null ? '\$$price' : 'No Price',
                  ),
                  Continar_Custom_details(
                    icon: Icons.location_on_sharp,
                    text: '5.4h',
                  ),
                  Continar_Custom_details(
                    icon: Icons.star,
                    text: '3.2k',
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Description Text
              Text(
                discription ??
                    'No Description available. Vestibulum non enim nunc eleifend consequat a sit amet tellus.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),

      // Fixed Button at the Bottom
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            FloatingActionButton(
              onPressed: () {},
              backgroundColor: Colors.white,
              child: Icon(
                Icons.send,
                color: Color(0xFF2E7D32),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  // Add your action here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF2E7D32),
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  'Book now',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
