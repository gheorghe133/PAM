import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final VoidCallback? onBackPressed;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.onBackPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Back button
            GestureDetector(
              onTap: onBackPressed,
              child: Container(
                width: 24,
                height: 24,
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 24,
                  color: Colors.black,
                ),
              ),
            ),
            
            // Title
            Text(
              title,
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 18,
              ),
            ),
            
            // Share button (using original design icon)
            Container(
              width: 24,
              height: 24,
              child: Icon(
                Icons.share,
                size: 24,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
