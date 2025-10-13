import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'hero_section.dart';

class CustomStatusBar extends StatelessWidget {
  final Color backgroundColor;
  final Color foregroundColor;
  final Brightness brightness;
  final Widget child;

  const CustomStatusBar({
    Key? key,
    this.backgroundColor = Colors.white,
    this.foregroundColor = Colors.black,
    this.brightness = Brightness.light,
    required this.child,
  }) : super(key: key);

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

/// Custom App Bar component pentru consistență
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
    Key? key,
    this.title,
    this.leading,
    this.actions,
    this.backgroundColor = Colors.white,
    this.foregroundColor = Colors.black,
    this.elevation = 0,
    this.centerTitle = true,
    this.onBackPressed,
  }) : super(key: key);

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

/// Scaffold wrapper cu status bar consistent
class CustomScaffold extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final Color backgroundColor;
  final Color statusBarColor;
  final Brightness statusBarBrightness;

  const CustomScaffold({
    Key? key,
    required this.body,
    this.appBar,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.backgroundColor = Colors.white,
    this.statusBarColor = Colors.white,
    this.statusBarBrightness = Brightness.light,
  }) : super(key: key);

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

/// Widget reutilizabil pentru status bar cu conținut (9:41, WiFi, baterie)
class StatusBarContent extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final EdgeInsets padding;

  const StatusBarContent({
    Key? key,
    this.backgroundColor = const Color(0xFFF9F9F9),
    this.textColor = Colors.black,
    this.padding = const EdgeInsets.only(
      top: 12,
      bottom: 8,
      left: 21,
      right: 21,
    ),
  }) : super(key: key);

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
    );
  }
}
