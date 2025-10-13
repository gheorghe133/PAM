import 'package:flutter/material.dart';
import 'hero_section.dart';

class ProductImages extends StatelessWidget {
  const ProductImages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Status bar (separate from image)
        Container(
          padding: const EdgeInsets.only(
            top: 12,
            bottom: 8,
            left: 21,
            right: 21,
          ),
          color: Color(0xFFF9F9F9),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "9:41",
                style: TextStyle(
                  color: Color(0xFF000000),
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  // Signal icon
                  Container(
                    margin: const EdgeInsets.only(right: 5),
                    width: 18,
                    height: 12,
                    child: CustomPaint(painter: MobileSignalPainter()),
                  ),
                  // WiFi icon
                  Container(
                    margin: const EdgeInsets.only(right: 5),
                    width: 16,
                    height: 12,
                    child: CustomPaint(painter: WifiSignalPainter()),
                  ),
                  // Battery icon
                  Container(
                    width: 25,
                    height: 12,
                    child: CustomPaint(painter: BatteryPainter()),
                  ),
                ],
              ),
            ],
          ),
        ),

        // App bar (separate from image)
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          color: Color(0xFFF9F9F9),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Back button
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
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
              Text(
                "Short dress",
                style: TextStyle(
                  color: Color(0xFF222222),
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),

              // Share button
              Container(
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
            height:
                400, // Reduced height since status bar and app bar are separate
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  // First image - 75% of screen width
                  Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    height: 400,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assests/product_image_1.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Spacing between images
                  SizedBox(width: 4),
                  // Second image - full screen width (25% visible initially, rest on scroll)
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 400,
                    decoration: BoxDecoration(
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


