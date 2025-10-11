import 'package:flutter/material.dart';

class SizeColorSelector extends StatelessWidget {
  final String selectedSize;
  final String selectedColor;
  final Function(String) onSizeChanged;
  final Function(String) onColorChanged;

  const SizeColorSelector({
    Key? key,
    required this.selectedSize,
    required this.selectedColor,
    required this.onSizeChanged,
    required this.onColorChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        margin: const EdgeInsets.only(bottom: 22, left: 16, right: 16),
        width: double.infinity,
        child: Row(
          children: [
            // Size Selector
            IntrinsicWidth(
              child: IntrinsicHeight(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xFFF01F0E),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xFFFFFFFF),
                  ),
                  padding: const EdgeInsets.only(top: 10, bottom: 10, left: 12, right: 8),
                  margin: const EdgeInsets.only(right: 16),
                  child: Row(
                    children: [
                      IntrinsicHeight(
                        child: Container(
                          alignment: Alignment.center,
                          width: 102,
                          child: TextField(
                            style: TextStyle(
                              color: Color(0xFF222222),
                              fontSize: 14,
                            ),
                            decoration: InputDecoration(
                              hintText: selectedSize,
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(vertical: 0),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 16,
                        height: 16,
                        child: Icon(
                          Icons.keyboard_arrow_down,
                          size: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Color Selector
            IntrinsicWidth(
              child: IntrinsicHeight(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xFF9B9B9B),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xFFFFFFFF),
                  ),
                  padding: const EdgeInsets.only(top: 10, bottom: 10, left: 12, right: 8),
                  margin: const EdgeInsets.only(right: 16),
                  child: Row(
                    children: [
                      IntrinsicHeight(
                        child: Container(
                          alignment: Alignment.center,
                          width: 101,
                          child: TextField(
                            style: TextStyle(
                              color: Color(0xFF222222),
                              fontSize: 14,
                            ),
                            decoration: InputDecoration(
                              hintText: selectedColor,
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(vertical: 0),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 16,
                        height: 16,
                        child: Icon(
                          Icons.keyboard_arrow_down,
                          size: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Favorite button
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Icon(
                Icons.favorite_border,
                size: 20,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }


}
