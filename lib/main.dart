import 'package:flutter/material.dart';
import 'package:flutter_gpu_minimal/painter.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter GPU Demo',
      home: Container(
        margin: EdgeInsets.all(32),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: CustomPaint(painter: TrianglePainter()),
      ),
    );
  }
}
