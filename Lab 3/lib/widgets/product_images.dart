import 'package:flutter/material.dart';
import 'custom_status_bar.dart';

class ProductImages extends StatelessWidget {
  const ProductImages({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Status bar content (9:41, WiFi, battery icons)
        const StatusBarContent(),

        // App bar (back button, title, share button)
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          color: const Color(0xFFF9F9F9),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Back button
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const SizedBox(
                  width: 24,
                  height: 24,
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 18,
                    color: Colors.black,
                  ),
                ),
              ),

              // Title
              const Text(
                "Short dress",
                style: TextStyle(
                  color: Color(0xFF222222),
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),

              // Share button
              const SizedBox(
                width: 24,
                height: 24,
                child: Icon(Icons.share, size: 18, color: Colors.black),
              ),
            ],
          ),
        ),
        // Image area (no overlay, just the images)
        IntrinsicHeight(
          child: Container(
            margin: const EdgeInsets.only(bottom: 12),
            width: double.infinity,
            height: 400, // Standard height for product images
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  // First image - 75% of screen width
                  Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    height: 400,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assests/product_image_1.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Spacing between images
                  const SizedBox(width: 4),
                  // Second image - full screen width (25% visible initially, rest on scroll)
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 400,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assests/product_image_2.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
