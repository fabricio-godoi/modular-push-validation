import 'package:flutter/material.dart';

class CustomPage extends StatelessWidget {
  final Color color;
  final String title;

  CustomPage({super.key, required this.color, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: color,
      ),
      body: Container(),
    );
  }
}
