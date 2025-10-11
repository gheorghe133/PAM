import 'package:flutter/material.dart';

class HeroSection extends StatelessWidget {
  final String title;
  final String? backgroundImagePath;
  final String? backgroundImageUrl;
  final Color? backgroundColor;
  final double height;
  final TextStyle? titleStyle;
  final EdgeInsets? titlePadding;
  final Alignment titleAlignment;
  final bool showStatusBar;
  final Widget? customContent;

  const HeroSection({
    Key? key,
    required this.title,
    this.backgroundImagePath,
    this.backgroundImageUrl,
    this.backgroundColor,
    this.height = 240,
    this.titleStyle,
    this.titlePadding = const EdgeInsets.only(top: 160, left: 21),
    this.titleAlignment = Alignment.bottomLeft,
    this.showStatusBar = true,
    this.customContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.grey[300],
        image: _buildBackgroundImage(),
      ),
      child: Stack(
        children: [
          // Status Bar (if enabled)
          if (showStatusBar) _buildStatusBar(),
          
          // Custom content or default title
          if (customContent != null)
            customContent!
          else
            _buildDefaultTitle(),
        ],
      ),
    );
  }

  DecorationImage? _buildBackgroundImage() {
    if (backgroundImagePath != null) {
      return DecorationImage(
        image: AssetImage(backgroundImagePath!),
        fit: BoxFit.cover,
      );
    } else if (backgroundImageUrl != null) {
      return DecorationImage(
        image: NetworkImage(backgroundImageUrl!),
        fit: BoxFit.cover,
      );
    }
    return null;
  }

  Widget _buildStatusBar() {
    return Positioned(
      top: 44,
      left: 21,
      right: 21,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "9:41",
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          Row(
            children: [
              Icon(Icons.signal_cellular_4_bar, size: 17, color: Colors.black),
              SizedBox(width: 5),
              Icon(Icons.wifi, size: 15, color: Colors.black),
              SizedBox(width: 5),
              Icon(Icons.battery_full, size: 24, color: Colors.black),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDefaultTitle() {
    return Positioned.fill(
      child: Container(
        padding: titlePadding,
        alignment: titleAlignment,
        child: Text(
          title,
          style: titleStyle ?? TextStyle(
            color: Colors.white,
            fontSize: 48,
            fontWeight: FontWeight.w900,
            height: 1.0,
          ),
        ),
      ),
    );
  }
}

// Specialized hero sections for different use cases
class StreetClothesHeroSection extends StatelessWidget {
  final String? backgroundImagePath;
  final String? backgroundImageUrl;

  const StreetClothesHeroSection({
    Key? key,
    this.backgroundImagePath = 'assests/banner.jpg',
    this.backgroundImageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HeroSection(
      title: "Street clothes",
      backgroundImagePath: backgroundImagePath,
      backgroundImageUrl: backgroundImageUrl,
      height: 240,
      titleStyle: TextStyle(
        color: Colors.white,
        fontSize: 48,
        fontWeight: FontWeight.w900,
        height: 1.0,
      ),
      titlePadding: EdgeInsets.only(top: 160, left: 21),
      showStatusBar: true,
    );
  }
}

class CustomHeroSection extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? backgroundImagePath;
  final String? backgroundImageUrl;
  final Color? backgroundColor;
  final Color? textColor;
  final double height;

  const CustomHeroSection({
    Key? key,
    required this.title,
    this.subtitle,
    this.backgroundImagePath,
    this.backgroundImageUrl,
    this.backgroundColor,
    this.textColor = Colors.white,
    this.height = 240,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HeroSection(
      title: title,
      backgroundImagePath: backgroundImagePath,
      backgroundImageUrl: backgroundImageUrl,
      backgroundColor: backgroundColor,
      height: height,
      showStatusBar: true,
      customContent: Positioned.fill(
        child: Container(
          padding: EdgeInsets.only(top: 160, left: 21, right: 21),
          alignment: Alignment.bottomLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: textColor,
                  fontSize: 48,
                  fontWeight: FontWeight.w900,
                  height: 1.0,
                ),
              ),
              if (subtitle != null) ...[
                SizedBox(height: 8),
                Text(
                  subtitle!,
                  style: TextStyle(
                    color: textColor?.withOpacity(0.8),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
