import 'package:flutter/material.dart';

class ExpandableSections extends StatelessWidget {
  const ExpandableSections({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Color(0xFFE5E5E5),
          margin: const EdgeInsets.only(bottom: 12),
          height: 1,
          width: double.infinity,
        ),

        _buildExpandableSection(
          title: "Item details",
          onTap: () {},
        ),

        Container(
          color: Color(0xFFE5E5E5),
          margin: const EdgeInsets.only(bottom: 12),
          height: 1,
          width: double.infinity,
        ),

        _buildExpandableSection(
          title: "Shipping info",
          onTap: () {},
        ),

        Container(
          color: Color(0xFFE5E5E5),
          margin: const EdgeInsets.only(bottom: 12),
          height: 1,
          width: double.infinity,
        ),

        _buildExpandableSection(
          title: "Support",
          onTap: () {},
        ),

        Container(
          color: Color(0xFFE5E5E5),
          margin: const EdgeInsets.only(bottom: 20),
          height: 1,
          width: double.infinity,
        ),
      ],
    );
  }

  Widget _buildExpandableSection({
    required String title,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12, left: 16, right: 16),
      width: double.infinity,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    color: Color(0xFF222222),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Icon(
                Icons.keyboard_arrow_right,
                size: 20,
                color: Color(0xFF9B9B9B),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
