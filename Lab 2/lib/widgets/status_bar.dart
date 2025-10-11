import 'package:flutter/material.dart';

class StatusBar extends StatelessWidget {
  const StatusBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFF9F9F9),
          boxShadow: [
            BoxShadow(
              color: Color(0x12000000),
              blurRadius: 24,
              offset: Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(vertical: 12),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IntrinsicHeight(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 2),
                margin: const EdgeInsets.only(bottom: 19, left: 21, right: 21),
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
                                margin: const EdgeInsets.symmetric(horizontal: 12),
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
                    // Signal icon
                    Container(
                      margin: const EdgeInsets.only(right: 5),
                      width: 17,
                      height: 10,
                      child: Icon(
                        Icons.signal_cellular_4_bar,
                        size: 10,
                        color: Colors.black,
                      ),
                    ),
                    // WiFi icon
                    Container(
                      margin: const EdgeInsets.only(right: 5),
                      width: 15,
                      height: 10,
                      child: Icon(
                        Icons.wifi,
                        size: 10,
                        color: Colors.black,
                      ),
                    ),
                    // Battery icon
                    Container(
                      width: 24,
                      height: 11,
                      child: Icon(
                        Icons.battery_full,
                        size: 11,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
