import 'package:flutter/material.dart';

class ProductImages extends StatelessWidget {
  const ProductImages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Main large image
            Expanded(
              child: IntrinsicHeight(
                child: Container(
                  padding: const EdgeInsets.only(top: 410),
                  margin: const EdgeInsets.only(right: 4),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assests/product_image_1.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Bottom indicator bar
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Color(0xFF222222),
                        ),
                        width: 125,
                        height: 3,
                        child: SizedBox(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            
            // Small thumbnail image
            Container(
              width: 96,
              height: 413,
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
    );
  }
}
