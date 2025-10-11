import 'package:flutter/material.dart';

class ProductImages extends StatelessWidget {
  const ProductImages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Status bar (separate from image)
        Container(
          padding: const EdgeInsets.only(
            top: 12,
            bottom: 8,
            left: 21,
            right: 21,
          ),
          color: Color(0xFFF9F9F9),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "9:41",
                style: TextStyle(
                  color: Color(0xFF000000),
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  // Signal icon
                  Container(
                    margin: const EdgeInsets.only(right: 5),
                    width: 18,
                    height: 12,
                    child: CustomPaint(painter: MobileSignalPainter()),
                  ),
                  // WiFi icon
                  Container(
                    margin: const EdgeInsets.only(right: 5),
                    width: 16,
                    height: 12,
                    child: CustomPaint(painter: WifiSignalPainter()),
                  ),
                  // Battery icon
                  Container(
                    width: 25,
                    height: 12,
                    child: CustomPaint(painter: BatteryPainter()),
                  ),
                ],
              ),
            ],
          ),
        ),

        // App bar (separate from image)
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          color: Color(0xFFF9F9F9),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Back button
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: 24,
                  height: 24,
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 18,
                    color: Colors.black,
                  ),
                ),
              ),

              // Title
              Text(
                "Short dress",
                style: TextStyle(
                  color: Color(0xFF222222),
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),

              // Share button
              Container(
                width: 24,
                height: 24,
                child: Icon(Icons.share, size: 18, color: Colors.black),
              ),
            ],
          ),
        ),

        // Image area (no overlay, just the images)
        IntrinsicHeight(
          child: Container(
            margin: const EdgeInsets.only(bottom: 12),
            width: double.infinity,
            height:
                400, // Reduced height since status bar and app bar are separate
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  // First image - 75% of screen width
                  Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    height: 400,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assests/product_image_1.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Spacing between images
                  SizedBox(width: 4),
                  // Second image - full screen width (25% visible initially, rest on scroll)
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 400,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assests/product_image_2.png'),
                        fit: BoxFit.cover,
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

// Custom painters for SVG icons
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
