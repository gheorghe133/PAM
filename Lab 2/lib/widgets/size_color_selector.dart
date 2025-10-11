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
            _buildSelector(
              value: selectedSize,
              borderColor: Color(0xFFF01F0E),
              onChanged: onSizeChanged,
              options: ['XS', 'S', 'M', 'L', 'XL'],
              placeholder: 'Size',
            ),
            
            SizedBox(width: 16),
            
            // Color Selector
            _buildSelector(
              value: selectedColor,
              borderColor: Color(0xFF9B9B9B),
              onChanged: onColorChanged,
              options: ['Black', 'White', 'Red', 'Blue', 'Green'],
              placeholder: 'Black',
            ),
            
            SizedBox(width: 16),
            
            // Favorite button
            Container(
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
          ],
        ),
      ),
    );
  }

  Widget _buildSelector({
    required String value,
    required Color borderColor,
    required Function(String) onChanged,
    required List<String> options,
    required String placeholder,
  }) {
    return IntrinsicWidth(
      child: IntrinsicHeight(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: borderColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
            color: Color(0xFFFFFFFF),
          ),
          padding: const EdgeInsets.only(top: 10, bottom: 10, left: 12, right: 8),
          child: Row(
            children: [
              IntrinsicHeight(
                child: Container(
                  alignment: Alignment.center,
                  width: 102,
                  child: DropdownButton<String>(
                    value: options.contains(value) ? value : null,
                    hint: Text(
                      placeholder,
                      style: TextStyle(
                        color: Color(0xFF222222),
                        fontSize: 14,
                      ),
                    ),
                    underline: SizedBox(),
                    isExpanded: true,
                    icon: SizedBox(),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        onChanged(newValue);
                      }
                    },
                    items: options.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(
                            color: Color(0xFF222222),
                            fontSize: 14,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              Container(
                width: 16,
                height: 16,
                child: Icon(
                  Icons.keyboard_arrow_down,
                  size: 16,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
