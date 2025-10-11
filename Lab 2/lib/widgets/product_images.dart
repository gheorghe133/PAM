import 'package:flutter/material.dart';

class ProductImages extends StatelessWidget {
  const ProductImages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Status bar (separate from image)
        Container(
          padding: const EdgeInsets.only(top: 12, bottom: 8, left: 21, right: 21),
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
                    child: Image.network(
                      "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/M1cILAB2gT/mjb81m8i_expires_30_days.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                  // WiFi icon
                  Container(
                    margin: const EdgeInsets.only(right: 5),
                    width: 15,
                    height: 10,
                    child: Image.network(
                      "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/M1cILAB2gT/2nqsft6v_expires_30_days.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                  // Battery icon
                  Container(
                    width: 24,
                    height: 11,
                    child: Image.network(
                      "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/M1cILAB2gT/kg87hdgs_expires_30_days.png",
                      fit: BoxFit.fill,
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
                  child: Image.network(
                    "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/M1cILAB2gT/0sqjm4gd_expires_30_days.png",
                    fit: BoxFit.fill,
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
                child: Image.network(
                  "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/M1cILAB2gT/00naa2ty_expires_30_days.png",
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),

        // Image area (no overlay, just the images)
        IntrinsicHeight(
          child: Container(
            margin: const EdgeInsets.only(bottom: 12),
            width: double.infinity,
            height: 400, // Reduced height since status bar and app bar are separate
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
                              image: NetworkImage(
                                "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/M1cILAB2gT/jap4k9er_expires_30_days.png",
                              ),
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
                              image: NetworkImage(
                                "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/M1cILAB2gT/beh6d48c_expires_30_days.png",
                              ),
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
