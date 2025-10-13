import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomStatusBar extends StatelessWidget {
  final Color backgroundColor;
  final Color foregroundColor;
  final Brightness brightness;
  final Widget child;

  const CustomStatusBar({
    super.key,
    this.backgroundColor = Colors.white,
    this.foregroundColor = Colors.black,
    this.brightness = Brightness.light,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: backgroundColor,
        statusBarIconBrightness: brightness == Brightness.light
            ? Brightness.dark
            : Brightness.light,
        statusBarBrightness: brightness,
        systemNavigationBarColor: backgroundColor,
        systemNavigationBarIconBrightness: brightness == Brightness.light
            ? Brightness.dark
            : Brightness.light,
      ),
      child: Container(color: backgroundColor, child: child),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? leading;
  final List<Widget>? actions;
  final Color backgroundColor;
  final Color foregroundColor;
  final double elevation;
  final bool centerTitle;
  final VoidCallback? onBackPressed;

  const CustomAppBar({
    super.key,
    this.title,
    this.leading,
    this.actions,
    this.backgroundColor = Colors.white,
    this.foregroundColor = Colors.black,
    this.elevation = 0,
    this.centerTitle = true,
    this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title != null
          ? Text(
              title!,
              style: TextStyle(
                color: foregroundColor,
                fontSize: 18,
                fontWeight: FontWeight.w600,
                fontFamily: 'Metropolis',
              ),
            )
          : null,
      leading:
          leading ??
          (Navigator.canPop(context)
              ? IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: foregroundColor,
                    size: 20,
                  ),
                  onPressed: onBackPressed ?? () => Navigator.pop(context),
                )
              : null),
      actions: actions,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      elevation: elevation,
      centerTitle: centerTitle,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: backgroundColor,
        statusBarIconBrightness: backgroundColor == Colors.white
            ? Brightness.dark
            : Brightness.light,
        statusBarBrightness: backgroundColor == Colors.white
            ? Brightness.light
            : Brightness.dark,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class CustomScaffold extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final Color backgroundColor;
  final Color statusBarColor;
  final Brightness statusBarBrightness;

  const CustomScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.backgroundColor = Colors.white,
    this.statusBarColor = Colors.white,
    this.statusBarBrightness = Brightness.light,
  });

  @override
  Widget build(BuildContext context) {
    return CustomStatusBar(
      backgroundColor: statusBarColor,
      brightness: statusBarBrightness,
      child: Scaffold(
        appBar: appBar,
        body: body,
        bottomNavigationBar: bottomNavigationBar,
        floatingActionButton: floatingActionButton,
        backgroundColor: backgroundColor,
      ),
    );
  }
}

class StatusBarContent extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final EdgeInsets padding;

  const StatusBarContent({
    super.key,
    this.backgroundColor = const Color(0xFFF9F9F9),
    this.textColor = Colors.black,
    this.padding = const EdgeInsets.only(
      top: 12,
      bottom: 8,
      left: 21,
      right: 21,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      color: backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "9:41",
            style: TextStyle(
              color: textColor,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          Row(
            children: [
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
              SizedBox(
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
