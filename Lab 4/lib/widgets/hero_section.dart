import 'package:flutter/material.dart';
import 'custom_status_bar.dart';
import '../core/constants.dart';

class StreetClothesHeroSection extends StatelessWidget {
  final String? backgroundImagePath;
  final String? bannerImage;
  final String? title;

  const StreetClothesHeroSection({
    super.key,
    this.backgroundImagePath,
    this.bannerImage,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Stack(
        children: [
          Positioned.fill(
            child: bannerImage != null && bannerImage!.startsWith('http')
                ? Image.network(
                    bannerImage!,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                        color: Colors.grey[300],
                        child: Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Image.network(
                        AppConstants.fallbackImageUrl,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Container(
                            color: Colors.grey[300],
                            child: Center(
                              child: CircularProgressIndicator(
                                value:
                                    loadingProgress.expectedTotalBytes != null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            ),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey[300],
                            child: Center(
                              child: Icon(
                                Icons.broken_image,
                                size: 64,
                                color: Colors.grey[400],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  )
                : Image.asset(
                    backgroundImagePath ?? 'assests/banner.jpg',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[300],
                        child: Center(
                          child: Icon(
                            Icons.broken_image,
                            size: 64,
                            color: Colors.grey[400],
                          ),
                        ),
                      );
                    },
                  ),
          ),

          Container(
            padding: const EdgeInsets.only(top: 12, bottom: 26),
            margin: const EdgeInsets.only(bottom: 37),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 103),
                  child: const StatusBarContent(
                    backgroundColor: Colors.transparent,
                    padding: EdgeInsets.only(
                      top: 2,
                      bottom: 2,
                      left: 21,
                      right: 21,
                    ),
                  ),
                ),

                Container(
                  margin: const EdgeInsets.only(left: 16, right: 123),
                  child: Text(
                    title ?? "Street clothes",
                    style: const TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: 34,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MobileSignalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    final path = Path();

    path.addRRect(RRect.fromLTRBR(0.67, 7.33, 3.67, 11.33, Radius.circular(1)));

    path.addRRect(RRect.fromLTRBR(5.33, 5.33, 8.33, 11.33, Radius.circular(1)));

    path.addRRect(RRect.fromLTRBR(10.0, 3.0, 13.0, 11.33, Radius.circular(1)));

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

    final outlinePaint = Paint()
      ..color = Color.fromRGBO(0, 0, 0, 0.35)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    final bodyRect = RRect.fromLTRBR(
      0.5,
      0.83,
      21.5,
      11.17,
      Radius.circular(2),
    );
    canvas.drawRRect(bodyRect, outlinePaint);

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

    final fillRect = RRect.fromLTRBR(2, 2.33, 20, 9.67, Radius.circular(1.33));
    canvas.drawRRect(fillRect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
