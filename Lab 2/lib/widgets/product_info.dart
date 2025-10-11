import 'package:flutter/material.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Brand and Price Row
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
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    child: Text(
                      "\$19.99",
                      style: TextStyle(
                        color: Color(0xFF222222),
                        fontSize: 24,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        
        // Product Name
        Container(
          margin: const EdgeInsets.only(bottom: 8, left: 16, right: 269),
          child: Text(
            "Short black dress",
            style: TextStyle(
              color: Color(0xFF9B9B9B),
              fontSize: 11,
            ),
          ),
        ),
        
        // Rating Stars
        IntrinsicWidth(
          child: IntrinsicHeight(
            child: Container(
              margin: const EdgeInsets.only(bottom: 20, left: 17),
              child: Row(
                children: [
                  // 5 Stars
                  ...List.generate(5, (index) => Container(
                    margin: const EdgeInsets.only(right: 1),
                    width: 14,
                    height: 14,
                    child: Icon(
                      Icons.star,
                      size: 14,
                      color: Color(0xFFFFBA49),
                    ),
                  )),
                  
                  // Review count
                  Container(
                    margin: const EdgeInsets.only(left: 2),
                    child: Text(
                      "(10)",
                      style: TextStyle(
                        color: Color(0xFF9B9B9B),
                        fontSize: 10,
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
