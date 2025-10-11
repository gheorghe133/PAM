import 'package:flutter/material.dart';

class AddToCart extends StatelessWidget {
  final VoidCallback? onAddToCart;

  const AddToCart({
    Key? key,
    this.onAddToCart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          boxShadow: [
            BoxShadow(
              color: Color(0x1A000000),
              blurRadius: 8,
              offset: Offset(0, -4),
            ),
          ],
        ),
        padding: const EdgeInsets.only(top: 20),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Add to Cart Button
            InkWell(
              onTap: onAddToCart,
              child: IntrinsicHeight(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Color(0xFFDB3022),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x40D32525),
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  margin: const EdgeInsets.only(bottom: 9, left: 16, right: 16),
                  width: double.infinity,
                  child: Column(
                    children: [
                      Text(
                        "ADD TO CART",
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            
            // Separator line
            Container(
              color: Color(0xFF9B9B9B),
              margin: const EdgeInsets.symmetric(horizontal: 1),
              height: 1,
              width: double.infinity,
              child: SizedBox(),
            ),
            
            // Item details section
            IntrinsicHeight(
              child: Container(
                padding: const EdgeInsets.only(top: 14, bottom: 3, left: 16, right: 16),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 1),
                      child: Text(
                        "Item details",
                        style: TextStyle(
                          color: Color(0xFF222222),
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Container(
                      width: 16,
                      height: 16,
                      child: Icon(
                        Icons.keyboard_arrow_up,
                        size: 16,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
