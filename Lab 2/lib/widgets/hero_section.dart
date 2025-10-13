import 'package:flutter/material.dart';
import 'custom_status_bar.dart';

class StreetClothesHeroSection extends StatelessWidget {
  final String? backgroundImagePath;

  const StreetClothesHeroSection({
    super.key,
    this.backgroundImagePath = 'assests/banner.jpg',
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        padding: const EdgeInsets.only(top: 12, bottom: 26),
        margin: const EdgeInsets.only(bottom: 37),
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(backgroundImagePath!),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 103),
              child: const StatusBarContent(
                backgroundColor: Colors.transparent,
                padding: EdgeInsets.only(
                  top: 2,
                  bottom: 2,
                  left: 21,
                  right: 21,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 16, right: 123),
              child: Text(
                "Street clothes",
                style: TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontSize: 34,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


