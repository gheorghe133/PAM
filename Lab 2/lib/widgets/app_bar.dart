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
                child: Image.network(
                  "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/M1cILAB2gT/0sqjm4gd_expires_30_days.png",
                  fit: BoxFit.fill,
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
    );
  }
}
