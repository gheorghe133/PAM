import 'package:flutter/material.dart';

class RelatedProducts extends StatelessWidget {
  const RelatedProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Section header
        IntrinsicHeight(
          child: Container(
            margin: const EdgeInsets.only(bottom: 12, left: 16, right: 16),
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    child: Text(
                      "You can also like this",
                      style: TextStyle(
                        color: Color(0xFF222222),
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Text(
                  "12 items",
                  style: TextStyle(
                    color: Color(0xFF9B9B9B),
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
        ),
        
        // Products horizontal scroll
        IntrinsicWidth(
          child: IntrinsicHeight(
            child: Container(
              margin: const EdgeInsets.only(bottom: 101),
              width: double.infinity,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // First product (Sale item)
                    _buildSaleProduct(),
                    
                    // Second product (New item)
                    _buildNewProduct(),
                    
                    // Third product (New item)
                    _buildNewProduct(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSaleProduct() {
    return IntrinsicWidth(
      child: IntrinsicHeight(
        child: Container(
          margin: const EdgeInsets.only(right: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product image with sale badge
              IntrinsicWidth(
                child: IntrinsicHeight(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 7, left: 1, right: 1),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IntrinsicWidth(
                              child: IntrinsicHeight(
                                child: Container(
                                  padding: const EdgeInsets.only(top: 8, bottom: 152, left: 9, right: 99),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage("https://storage.googleapis.com/tagjs-prod.appspot.com/v1/M1cILAB2gT/ixqhqhqr_expires_30_days.png"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      // Sale badge
                                      InkWell(
                                        onTap: () => print('Sale badge pressed'),
                                        child: IntrinsicWidth(
                                          child: IntrinsicHeight(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(29),
                                                color: Color(0xFFDB3022),
                                              ),
                                              padding: const EdgeInsets.only(top: 7, bottom: 7, left: 6, right: 6),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "-20%",
                                                    style: TextStyle(
                                                      color: Color(0xFFFFFFFF),
                                                      fontSize: 11,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        // Favorite button
                        Positioned(
                          bottom: 0,
                          right: 0,
                          width: 36,
                          height: 36,
                          child: Container(
                            transform: Matrix4.translationValues(0, 16, 0),
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x14000000),
                                  blurRadius: 4,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Icon(
                              Icons.favorite_border,
                              size: 24,
                              color: Color(0xFF9B9B9B),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              
              // Rating stars
              _buildRatingStars(),
              
              // Brand name
              Container(
                margin: const EdgeInsets.only(bottom: 5, left: 1, right: 65),
                child: Text(
                  "Dorothy Perkins",
                  style: TextStyle(
                    color: Color(0xFF9B9B9B),
                    fontSize: 11,
                  ),
                ),
              ),
              
              // Product name
              Container(
                margin: const EdgeInsets.only(bottom: 3, left: 1, right: 39),
                child: Text(
                  "Evening Dress",
                  style: TextStyle(
                    color: Color(0xFF222222),
                    fontSize: 16,
                  ),
                ),
              ),
              
              // Price with strikethrough
              IntrinsicWidth(
                child: IntrinsicHeight(
                  child: Container(
                    margin: const EdgeInsets.only(left: 2),
                    child: Row(
                      children: [
                        IntrinsicWidth(
                          child: IntrinsicHeight(
                            child: Container(
                              margin: const EdgeInsets.only(right: 6),
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "15\$",
                                        style: TextStyle(
                                          color: Color(0xFF9B9B9B),
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Positioned(
                                    top: 9,
                                    left: 0,
                                    right: 0,
                                    height: 1,
                                    child: Container(
                                      color: Color(0xFF9B9B9B),
                                      width: 23,
                                      height: 1,
                                      child: SizedBox(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "12\$",
                          style: TextStyle(
                            color: Color(0xFFDB3022),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNewProduct() {
    return IntrinsicWidth(
      child: IntrinsicHeight(
        child: Container(
          margin: const EdgeInsets.only(right: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product image with NEW badge
              IntrinsicWidth(
                child: IntrinsicHeight(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IntrinsicWidth(
                          child: IntrinsicHeight(
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 7, left: 1, right: 1),
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      IntrinsicWidth(
                                        child: IntrinsicHeight(
                                          child: Container(
                                            padding: const EdgeInsets.only(top: 8, bottom: 152, left: 9, right: 99),
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: NetworkImage("https://storage.googleapis.com/tagjs-prod.appspot.com/v1/M1cILAB2gT/ixqhqhqr_expires_30_days.png"),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                // NEW badge
                                                InkWell(
                                                  onTap: () => print('NEW badge pressed'),
                                                  child: IntrinsicWidth(
                                                    child: IntrinsicHeight(
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(29),
                                                          color: Color(0xFF222222),
                                                        ),
                                                        padding: const EdgeInsets.only(top: 7, bottom: 7, left: 6, right: 6),
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Text(
                                                              "NEW",
                                                              style: TextStyle(
                                                                color: Color(0xFFFFFFFF),
                                                                fontSize: 11,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  // Favorite button
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    width: 36,
                                    height: 36,
                                    child: Container(
                                      transform: Matrix4.translationValues(0, 16, 0),
                                      width: 36,
                                      height: 36,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color(0x14000000),
                                            blurRadius: 4,
                                            offset: Offset(0, 4),
                                          ),
                                        ],
                                      ),
                                      child: Icon(
                                        Icons.favorite_border,
                                        size: 24,
                                        color: Color(0xFF9B9B9B),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        // Rating stars
                        _buildRatingStars(),
                      ],
                    ),
                  ),
                ),
              ),

              // Brand name
              Container(
                margin: const EdgeInsets.only(bottom: 5, left: 1, right: 90),
                child: Text(
                  "Mango Boy",
                  style: TextStyle(
                    color: Color(0xFF9B9B9B),
                    fontSize: 11,
                  ),
                ),
              ),

              // Product name
              Container(
                margin: const EdgeInsets.only(bottom: 3, left: 1, right: 42),
                child: Text(
                  "T-Shirt Sailing",
                  style: TextStyle(
                    color: Color(0xFF222222),
                    fontSize: 16,
                  ),
                ),
              ),

              // Price
              Container(
                margin: const EdgeInsets.only(left: 2, right: 125),
                child: Text(
                  "10\$",
                  style: TextStyle(
                    color: Color(0xFF222222),
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRatingStars() {
    return IntrinsicWidth(
      child: IntrinsicHeight(
        child: Container(
          margin: const EdgeInsets.only(bottom: 6),
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
    );
  }
}
