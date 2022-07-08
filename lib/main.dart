import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const _MyTestApp());
}

class _MyTestApp extends StatelessWidget {
  const _MyTestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatefulWidget {
  const _MyHomePage({Key? key}) : super(key: key);

  @override
  State<_MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  Color? _randomBackgroundColor;

  @override
  void initState() {
    _randomBackgroundColor = _generateColor();
    super.initState();
  }

  void _setRandomBackgroundColor() {
    setState(() {
      _randomBackgroundColor = _generateColor();
    });
  }

  Color _generateColor() {
    // r, g, b - from 0 to 255 (256 * 256 * 256 = 16 777 216 colors)
    const int maxCountOfColorParameter = 256;

    return Color.fromRGBO(
      Random().nextInt(maxCountOfColorParameter),
      Random().nextInt(maxCountOfColorParameter),
      Random().nextInt(maxCountOfColorParameter),
      1,
    );
  }

  @override
  Widget build(BuildContext context) {
    const double sizeTextOnScreen = 45.0;

    return Scaffold(
      body: GestureDetector(
        onTap: _setRandomBackgroundColor,
        child: Container(
          color: _randomBackgroundColor,
          alignment: Alignment.center,
          child: Text(
            'Hey there',
            style: TextStyle(
              color: Colors.amber[900],
              fontSize: sizeTextOnScreen,
            ),
          ),
        ),
      ),
    );
  }
}
