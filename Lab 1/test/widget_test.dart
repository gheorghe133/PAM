import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:speed_calculator/main.dart';

void main() {
  group('Speed Calculator Tests', () {
    testWidgets('Should display basic UI elements', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MyApp());

      expect(find.text('Calculator Viteză Medie'), findsOneWidget);
      expect(find.byType(TextField), findsNWidgets(2));
      expect(find.byType(ElevatedButton), findsOneWidget);
      expect(find.text('Calculează Viteza'), findsOneWidget);
    });

    testWidgets('Should calculate speed correctly', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MyApp());

      final distanceField = find.byType(TextField).first;
      final timeField = find.byType(TextField).last;
      final calculateButton = find.byType(ElevatedButton);

      await tester.enterText(distanceField, '100');
      await tester.enterText(timeField, '2');
      await tester.tap(calculateButton);
      await tester.pump();

      expect(find.text('Viteza medie: 50.00 km/h'), findsOneWidget);
    });

    testWidgets('Should show error for invalid inputs', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MyApp());

      final calculateButton = find.byType(ElevatedButton);

      await tester.tap(calculateButton);
      await tester.pump();

      expect(find.text('Introduceți valori valide'), findsOneWidget);
    });
  });
}
