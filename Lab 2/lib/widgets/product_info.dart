import 'package:flutter/material.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IntrinsicHeight(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    child: Text(
                      "H&M",
                      style: TextStyle(
                        color: Color(0xFF222222),
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    child: Text(
                      "19.99\$",
                      style: TextStyle(
                        color: Color(0xFF222222),
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        Container(
          margin: const EdgeInsets.only(bottom: 8, left: 16, right: 269),
          child: Text(
            "Short black dress",
            style: TextStyle(
              color: Color(0xFF9B9B9B),
              fontSize: 11,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),

        IntrinsicWidth(
          child: IntrinsicHeight(
            child: Container(
              margin: const EdgeInsets.only(bottom: 20, left: 17),
              child: Row(
                children: [
                  ...List.generate(
                    5,
                    (index) => Container(
                      margin: const EdgeInsets.only(right: 1),
                      width: 14,
                      height: 14,
                      child: Icon(
                        Icons.star,
                        size: 14,
                        color: Color(0xFFFFBA49),
                      ),
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.only(left: 2),
                    child: Text(
                      "(10)",
                      style: TextStyle(color: Color(0xFF9B9B9B), fontSize: 10),
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
