import 'package:flutter/material.dart';

class ExpandableSections extends StatelessWidget {
  const ExpandableSections({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Separator line
        Container(
          color: Color(0xFF9B9B9B),
          margin: const EdgeInsets.only(bottom: 15, left: 1, right: 1),
          height: 1,
          width: double.infinity,
          child: SizedBox(),
        ),
        
        // Item details section
        _buildExpandableSection(
          title: "Item details",
          onTap: () => print('Item details tapped'),
        ),

        // Separator line
        Container(
          color: Color(0xFF9B9B9B),
          margin: const EdgeInsets.only(bottom: 14),
          height: 1,
          width: double.infinity,
          child: SizedBox(),
        ),

        // Shipping info section
        _buildExpandableSection(
          title: "Shipping info",
          onTap: () => print('Shipping info tapped'),
        ),

        // Separator line
        Container(
          color: Color(0xFF9B9B9B),
          margin: const EdgeInsets.only(bottom: 14),
          height: 1,
          width: double.infinity,
          child: SizedBox(),
        ),

        // Support section
        _buildExpandableSection(
          title: "Support",
          onTap: () => print('Support tapped'),
        ),
        
        // Separator line
        Container(
          color: Color(0xFF9B9B9B),
          margin: const EdgeInsets.only(bottom: 23),
          height: 1,
          width: double.infinity,
          child: SizedBox(),
        ),
      ],
    );
  }

  Widget _buildExpandableSection({
    required String title,
    required VoidCallback onTap,
  }) {
    return IntrinsicHeight(
      child: Container(
        margin: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
        width: double.infinity,
        child: InkWell(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 6),
                child: Text(
                  title,
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
                  Icons.keyboard_arrow_down,
                  size: 16,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
