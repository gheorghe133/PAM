import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator Viteză Medie',
      home: SpeedCalculatorScreen(),
    );
  }
}

class SpeedCalculatorScreen extends StatefulWidget {
  @override
  _SpeedCalculatorScreenState createState() => _SpeedCalculatorScreenState();
}

class _SpeedCalculatorScreenState extends State<SpeedCalculatorScreen> {
  final TextEditingController _distanceController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  String _result = '';

  void _calculateSpeed() {
    final double? distance = double.tryParse(_distanceController.text);
    final double? time = double.tryParse(_timeController.text);

    if (distance != null && time != null && time > 0) {
      final double speed = distance / time;
      setState(() {
        _result = 'Viteza medie: ${speed.toStringAsFixed(2)} km/h';
      });
    } else {
      setState(() {
        _result = 'Introduceți valori valide';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculator Viteză Medie')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _distanceController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Distanța (km)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _timeController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Timpul (ore)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: _calculateSpeed,
              child: Text('Calculează Viteza'),
            ),
            SizedBox(height: 24),
            if (_result.isNotEmpty)
              Text(
                _result,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _distanceController.dispose();
    _timeController.dispose();
    super.dispose();
  }
}
