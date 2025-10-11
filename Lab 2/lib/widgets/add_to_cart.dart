import 'package:flutter/material.dart';

class AddToCart extends StatelessWidget {
  final VoidCallback? onAddToCart;

  const AddToCart({
    Key? key,
    this.onAddToCart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      color: Color(0xFFFFFFFF),
      child: InkWell(
        onTap: onAddToCart,
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
          width: double.infinity,
          child: Center(
            child: Text(
              "ADD TO CART",
              style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
