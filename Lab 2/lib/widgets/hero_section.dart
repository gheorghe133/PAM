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
          if (customContent != null) customContent! else _buildDefaultTitle(),
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
              Container(
                width: 18,
                height: 12,
                child: CustomPaint(painter: MobileSignalPainter()),
              ),
              SizedBox(width: 5),
              Container(
                width: 16,
                height: 12,
                child: CustomPaint(painter: WifiSignalPainter()),
              ),
              SizedBox(width: 5),
              Container(
                width: 25,
                height: 12,
                child: CustomPaint(painter: BatteryPainter()),
              ),
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
          style:
              titleStyle ??
              TextStyle(
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

  const StreetClothesHeroSection({
    Key? key,
    this.backgroundImagePath = 'assests/banner.jpg',
  }) : super(key: key);

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
            // Status Bar
            IntrinsicHeight(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 2),
                margin: const EdgeInsets.only(bottom: 103, left: 21, right: 21),
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(
                      child: IntrinsicHeight(
                        child: Container(
                          margin: const EdgeInsets.only(right: 12),
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                ),
                                child: Text(
                                  "9:41",
                                  style: TextStyle(
                                    color: Color(0xFF000000),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 5),
                      width: 18,
                      height: 12,
                      child: CustomPaint(painter: MobileSignalPainter()),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 5),
                      width: 16,
                      height: 12,
                      child: CustomPaint(painter: WifiSignalPainter()),
                    ),
                    Container(
                      width: 25,
                      height: 12,
                      child: CustomPaint(painter: BatteryPainter()),
                    ),
                  ],
                ),
              ),
            ),
            // Title
            Container(
              margin: const EdgeInsets.only(left: 16, right: 123),
              child: Text(
                "Street clothes",
                style: TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
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
                    color: textColor?.withValues(alpha: 0.8),
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

// Custom painters for SVG icons (Black versions)
class MobileSignalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    final path = Path();

    // Bar 1 (shortest)
    path.addRRect(RRect.fromLTRBR(0.67, 7.33, 3.67, 11.33, Radius.circular(1)));

    // Bar 2
    path.addRRect(RRect.fromLTRBR(5.33, 5.33, 8.33, 11.33, Radius.circular(1)));

    // Bar 3
    path.addRRect(RRect.fromLTRBR(10.0, 3.0, 13.0, 11.33, Radius.circular(1)));

    // Bar 4 (tallest)
    path.addRRect(
      RRect.fromLTRBR(14.67, 0.67, 17.67, 11.33, Radius.circular(1)),
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class WifiSignalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    // Innermost WiFi arc (closest to center)
    Path path1 = Path();
    path1.moveTo(6.12, 8.73);
    path1.cubicTo(7.40, 7.65, 9.26, 7.65, 10.54, 8.73);
    path1.cubicTo(10.60, 8.79, 10.64, 8.87, 10.64, 8.96);
    path1.cubicTo(10.64, 9.04, 10.61, 9.13, 10.55, 9.19);
    path1.lineTo(8.55, 11.20);
    path1.cubicTo(8.49, 11.26, 8.41, 11.30, 8.33, 11.30);
    path1.cubicTo(8.25, 11.30, 8.17, 11.26, 8.11, 11.20);
    path1.lineTo(6.11, 9.19);
    path1.close();
    canvas.drawPath(path1, paint);

    // Middle WiFi arc
    Path path2 = Path();
    path2.moveTo(3.46, 6.04);
    path2.cubicTo(6.20, 3.49, 10.46, 3.49, 13.21, 6.04);
    path2.cubicTo(13.27, 6.10, 13.31, 6.18, 13.31, 6.27);
    path2.cubicTo(13.31, 6.36, 13.27, 6.44, 13.21, 6.50);
    path2.lineTo(12.06, 7.67);
    path2.cubicTo(11.94, 7.79, 11.75, 7.79, 11.62, 7.67);
    path2.cubicTo(10.72, 6.86, 9.55, 6.40, 8.33, 6.40);
    path2.cubicTo(7.11, 6.40, 5.94, 6.86, 5.04, 7.67);
    path2.cubicTo(4.92, 7.79, 4.72, 7.79, 4.60, 7.67);
    path2.lineTo(3.45, 6.50);
    path2.cubicTo(3.39, 6.44, 3.36, 6.36, 3.36, 6.27);
    path2.cubicTo(3.36, 6.18, 3.39, 6.10, 3.46, 6.04);
    path2.close();
    canvas.drawPath(path2, paint);

    // Outermost WiFi arc
    Path path3 = Path();
    path3.moveTo(0.79, 3.36);
    path3.cubicTo(5.01, -0.68, 11.66, -0.68, 15.87, 3.36);
    path3.cubicTo(15.93, 3.42, 15.97, 3.50, 15.97, 3.59);
    path3.cubicTo(15.97, 3.67, 15.93, 3.76, 15.87, 3.82);
    path3.lineTo(14.72, 4.98);
    path3.cubicTo(14.60, 5.10, 14.40, 5.10, 14.28, 4.99);
    path3.cubicTo(12.68, 3.46, 10.55, 2.61, 8.33, 2.61);
    path3.cubicTo(6.11, 2.61, 3.98, 3.46, 2.38, 4.99);
    path3.cubicTo(2.26, 5.10, 2.06, 5.10, 1.94, 4.98);
    path3.lineTo(0.79, 3.82);
    path3.cubicTo(0.73, 3.76, 0.69, 3.67, 0.69, 3.59);
    path3.cubicTo(0.69, 3.50, 0.73, 3.42, 0.79, 3.36);
    path3.close();
    canvas.drawPath(path3, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class BatteryPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    // Battery outline
    final outlinePaint = Paint()
      ..color = Color.fromRGBO(0, 0, 0, 0.35)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    // Battery body outline
    final bodyRect = RRect.fromLTRBR(
      0.5,
      0.83,
      21.5,
      11.17,
      Radius.circular(2),
    );
    canvas.drawRRect(bodyRect, outlinePaint);

    // Battery terminal
    final terminalPaint = Paint()
      ..color = Color.fromRGBO(0, 0, 0, 0.4)
      ..style = PaintingStyle.fill;

    final terminalPath = Path();
    terminalPath.moveTo(23, 4);
    terminalPath.lineTo(23, 8);
    terminalPath.cubicTo(23.80, 7.66, 24.33, 6.87, 24.33, 6);
    terminalPath.cubicTo(24.33, 5.13, 23.80, 4.34, 23, 4);
    terminalPath.close();
    canvas.drawPath(terminalPath, terminalPaint);

    // Battery fill
    final fillRect = RRect.fromLTRBR(2, 2.33, 20, 9.67, Radius.circular(1.33));
    canvas.drawRRect(fillRect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
