import 'package:flutter/material.dart';

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
                    width: 17,
                    height: 10,
                    child: Icon(
                      Icons.signal_cellular_4_bar,
                      size: 12,
                      color: Colors.black,
                    ),
                  ),
                  // WiFi icon
                  Container(
                    margin: const EdgeInsets.only(right: 5),
                    width: 15,
                    height: 10,
                    child: Icon(Icons.wifi, size: 12, color: Colors.black),
                  ),
                  // Battery icon
                  Container(
                    width: 24,
                    height: 11,
                    child: Icon(
                      Icons.battery_full,
                      size: 14,
                      color: Colors.black,
                    ),
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
            child: Stack(
              children: [
                // Main large image background
                Positioned.fill(
                  child: Row(
                    children: [
                      // Main image area
                      Expanded(
                        flex: 3,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assests/product_image_1.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      // Thumbnail area
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin: const EdgeInsets.only(left: 4),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assests/product_image_2.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Bottom indicator bar
                Positioned(
                  bottom: 16,
                  left: 16,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Color(0xFF222222),
                    ),
                    width: 125,
                    height: 3,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
